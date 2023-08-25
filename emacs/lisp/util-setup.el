;; init-base.el --- Util configurations.	-*- lexical-binding: t -*-

;;; Commentary:
;;
;;
;;; Code:

;; Diminish
(use-package diminish)

;; Move Up/Down
(use-package move-dup
  :bind (([M-S-up] . move-dup-move-lines-up)
         ([M-S-down] . move-dup-move-lines-down)
         ("C-c d" . 'move-dup-duplicate-down)
         ("C-c u" . 'move-dup-duplicate-up)))

;; No Littering - Help keeping ~/.config/emacs clean
;; If you would like to use base directories different from what no-littering uses by default, then you have to set the respective variables before loading the feature.
(use-package no-littering)
(setq no-littering-etc-directory (expand-file-name "config/" user-emacs-directory))
(setq no-littering-var-directory (expand-file-name "data/" user-emacs-directory))

;; recentf setting
(use-package recentf :init (recentf-mode)
  :config (setq recentf-max-saved-items 300)
  :hook (recentf-exclude . (recentf-expand-file-name no-littering-var-directory))
          (recentf-exclude . (recentf-expand-file-name no-littering-etc-directory)))

;; Fix Exec Path for Mac
(use-package exec-path-from-shell
  :when (eq system-type 'darwin)
  :hook (after-init . exec-path-from-shell-initialize))

;; TODO: need to move
(use-package general)
;; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;



;; Icons Completion
;; Note: All-the-icons-completion depends on an already installed all-the-icons.
(use-package all-the-icons
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :after (marginalia all-the-icons)
  :hook (marginalia-mode . all-the-icons-completion-marginalia-setup)
  :init (all-the-icons-completion-mode))

;; Page Break Lines
(use-package page-break-lines
  :hook (after-init . global-page-break-lines-mode)
  :custom (set-fontset-font "fontset-default"
                  (cons page-break-lines-char page-break-lines-char)
                  (face-attribute 'default :family)))

;; ;; Which Key
;; (use-package which-key
;;   :init (which-key-mode 1)
;;   :diminish
;;   :config (setq which-key-side-window-location 'bottom
;;                 which-key-sort-order #'which-key-key-order-alpha
;;                 which-key-allow-imprecise-window-fit nil
;;                 which-key-sort-uppercase-first nil
;;                 which-key-add-column-padding 1
;;                 which-key-max-display-columns nil
;;                 which-key-min-display-lines 6
;;                 which-key-side-window-slot -10
;;                 which-key-side-window-max-height 0.25
;;                 which-key-idle-delay 0.8
;;                 which-key-max-description-length 25
;;                 which-key-allow-imprecise-window-fit nil
;;                 which-key-separator " → " ))

(provide 'util-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; init-util.el ends here
