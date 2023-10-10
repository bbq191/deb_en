;; vk-window.el --- -*- coding: utf-8; lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Make "C-x o" prompt for a target window when there are more than 2
(use-package switch-window)
(setq-default switch-window-shortcut-style 'alphabet)
(setq-default switch-window-timeout nil)

(defun vk/split-window-thirds ()
  "Split a window into thirds."
  (interactive)
  (split-window-right)
  (split-window-right)
  (balance-windows))

(defun my-default-window-setup ()
  "Called by 'emacs-startup-hook to set up my initial window configuration."
  (add-to-list 'default-frame-alist '(fullscreen . maximized)))

(add-hook 'emacs-startup-hook #'my-default-window-setup)

(provide 'vk-window)
;;; vk-window.el ends here
