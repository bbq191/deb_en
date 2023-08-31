;;; init-package.el --- Initialize package configurations. -*- lexical-binding: t -*-

;;; Commentary:
;;
;; Emacs Package management configurations.
;;

;;; Code:

(eval-when-compile (require 'custom-setup))

;; At first startup
(when (and (file-exists-p vk-custom-file)
           (not (file-exists-p custom-file)))
  (copy-file vk-custom-file custom-file))

;; Load `custom-file'
(and (file-readable-p custom-file) (load custom-file))

;; HACK: DO NOT save package-selected-packages to `custom-file'.
;; https://github.com/jwiegley/use-package/issues/383#issuecomment-247801751
(defun my-package--save-selected-packages (&optional value)
  "Set `package-selected-packages' to VALUE but don't save to option `custom-file'."
  (when value (setq package-selected-packages value))
  (unless after-init-time
    (add-hook 'after-init-hook #'my-package--save-selected-packages)))
(advice-add 'package--save-selected-packages :override #'my-package--save-selected-packages)

;; When on Emacs 29 with the --with-native-compilation turned on,
;; make sure you’re on straight.el’s development branch
(setq straight-repository-branch "develop")

;; Install straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 6))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/radian-software/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Integration with use-package
(straight-use-package 'use-package)

;; Configure use-package to use straight.el by default
(use-package straight
  :custom
  (straight-use-package-by-default t))

;; Required by `use-package'
(use-package diminish :ensure t)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)


(provide 'package-setup)

;;; package-setup.el ends here
