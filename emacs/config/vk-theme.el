
;; vk-theme.el --- init configurations. -*- lexical-binding: t -*-

;;; Commentary:
;;
;;; Code:

(use-package doom-themes
  :config
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  ;; Sets the default theme to load!!! 
  (load-theme 'doom-zenburn t)
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))


(use-package doom-modeline
  :init (doom-modeline-mode 1)
  :config
  (setq doom-modeline-height 30      ;; sets modeline height
        doom-modeline-bar-width 5    ;; sets right bar width
        doom-modeline-persp-name t   ;; adds perspective name to modeline
        doom-modeline-persp-icon nil   ;; adds folder icon next to persp name
        doom-modeline-hud t
        doom-modeline-minor-modes nil
        doom-modeline-indent-info t
        doom-modeline-total-line-number nil))


(provide 'vk-theme)

;;; vk-theme.el ends here