;; vk-util.el --- vk-util configurations. -*- lexical-binding: t -*-
;;; Commentary:
;;
;;; Code:

;; Sudo edit especilly in edite remote file
(use-package sudo-edit)

(use-package hl-todo
  :hook ((org-mode . hl-todo-mode)
         (emacs-lisp-mode . hl-todo-mode)
         (prog-mode . hl-todo-mode))
  :config
  (setq hl-todo-highlight-punctuation ":"
        hl-todo-keyword-faces
        `(("TODO"       warning bold)
          ("FIXME"      error bold)
          ("HACK"       font-lock-constant-face bold)
          ("REVIEW"     font-lock-keyword-face bold)
          ("NOTE"       success bold)
          ("DEPRECATED" font-lock-doc-face bold))))

(use-package rainbow-mode
  :diminish t
  :hook org-mode prog-mode)

;; Make "C-x o" prompt for a target window when there are more than 2
(use-package switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)

;; GC optimization
(use-package gcmh
  :ensure t
  :hook (after-init . gcmh-mode)
  :custom
  (gcmh-idle-delay 10)
  (gcmh-high-cons-threshold #x6400000)) ;; 100 MB

;; Call undotree
(use-package vundo
  :bind ("C-x u" . vundo)
  :config (setq vundo-glyph-alist vundo-unicode-symbols))

(use-package which-key
  :init (which-key-mode 1)
  :diminish t
  :config
  (setq which-key-side-window-location 'bottom
	    which-key-sort-order #'which-key-key-order-alpha
	    which-key-allow-imprecise-window-fit nil
	    which-key-sort-uppercase-first nil
	    which-key-add-column-padding 1
	    which-key-max-display-columns nil
	    which-key-min-display-lines 4
	    which-key-side-window-slot -10
	    which-key-side-window-max-height 0.15
	    which-key-idle-delay 1.5
	    which-key-max-description-length 40
	    which-key-separator " |→ " ))

(provide 'vk-util)

;;; vk-util.el ends here
