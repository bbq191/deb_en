;;; init-package.el --- Initialize package configurations. -*- lexical-binding:
;;; t -*-

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

;; Set ELPA packages
(set-package-archives centaur-package-archives nil nil t)

;; Initialize packages
(unless (bound-and-true-p package--initialized) ; To avoid warnings in 27
  (setq package-enable-at-startup nil)          ; To prevent initializing twice
  (package-initialize))

;; Setup `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(setq use-package-always-ensure t
      use-package-always-defer t
      use-package-expand-minimally t
      use-package-enable-imenu-support t)

;; Required by `use-package'
(use-package diminish :ensure t)

;; Update GPG keyring for GNU ELPA
(use-package gnu-elpa-keyring-update)

;; A modern Packages Menu
(use-package paradox
  :custom-face
  (paradox-archive-face ((t (:inherit font-lock-doc-face))))
  (paradox-description-face ((t (:inherit completions-annotations))))
  :hook (emacs-startup . paradox-enable)
  :init (setq paradox-execute-asynchronously t
              paradox-github-token t
              paradox-display-star-count nil
              paradox-status-face-alist ;
              '(("built-in"   . font-lock-builtin-face)
                ("available"  . success)
                ("new"        . (success bold))
                ("held"       . font-lock-constant-face)
                ("disabled"   . font-lock-warning-face)
                ("avail-obso" . font-lock-comment-face)
                ("installed"  . font-lock-comment-face)
                ("dependency" . font-lock-comment-face)
                ("incompat"   . font-lock-comment-face)
                ("deleted"    . font-lock-comment-face)
                ("unsigned"   . font-lock-warning-face)))
  :config
  (add-hook 'paradox-after-execute-functions
            (lambda (_)
              "Display `page-break-lines' in \"*Paradox Report*\" buffer."
              (when (fboundp 'page-break-lines-mode)
                (let ((buf (get-buffer "*Paradox Report*"))
                      (inhibit-read-only t))
                  (when (buffer-live-p buf)
                    (with-current-buffer buf
                      (page-break-lines-mode 1))))))
            t))

(provide 'package-setup)

;;; package-setup.el ends here