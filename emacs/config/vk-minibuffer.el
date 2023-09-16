;; vk-minibuffer.el --- vk-minibuffer configurations. -*- lexical-binding: t -*-

;;; Commentary:
;;
;;; Code:

;; FIXME needs to use use-package way
(when (use-package embark)
  (with-eval-after-load 'vertico
    (define-key vertico-map (kbd "C-c C-o") 'embark-export)
    (define-key vertico-map (kbd "C-c C-c") 'embark-act)))

(when (use-package consult)
  (defmacro sanityinc/no-consult-preview (&rest cmds)
    `(with-eval-after-load 'consult
       (consult-customize ,@cmds :preview-key "M-P")))

  (sanityinc/no-consult-preview
   consult-ripgrep
   consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-recent-file consult--source-project-recent-file consult--source-bookmark)

  (when (and (executable-find "rg"))
    (defun sanityinc/consult-ripgrep-at-point (&optional dir initial)
      (interactive (list prefix-arg (when-let ((s (symbol-at-point)))
                                      (symbol-name s))))
      (consult-ripgrep dir initial))
    (sanityinc/no-consult-preview sanityinc/consult-ripgrep-at-point)
    (global-set-key (kbd "M-?") 'sanityinc/consult-ripgrep-at-point))

  (global-set-key [remap switch-to-buffer] 'consult-buffer)
  (global-set-key [remap switch-to-buffer-other-window] 'consult-buffer-other-window)
  (global-set-key [remap switch-to-buffer-other-frame] 'consult-buffer-other-frame)
  (global-set-key [remap goto-line] 'consult-goto-line)

  (when (use-package embark-consult)
    (with-eval-after-load 'embark
      (require 'embark-consult)
      (add-hook 'embark-collect-mode-hook 'embark-consult-preview-minor-mode)))

  (use-package consult-flycheck))

(when (use-package marginalia)
  (add-hook 'after-init-hook 'marginalia-mode))

(provide 'vk-minibuffer)

;;; vk-minibuffer.el ends here
