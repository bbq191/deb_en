;; vk-base.el --- -*- coding: utf-8; lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Frame ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Title
(setq frame-title-format '("Vinci & Kate's Gnu Emacs - %b")
      icon-title-format frame-title-format)

;; Set proxy configurations in emacs
(setq url-proxy-services
      '(("no_proxy" . "^\\(localhost\\|127.0.0.1\\)")
        ("http" . "localhost:6152")
        ("https" . "localhost:6152")))

(setq-default major-mode 'text-mode
              fill-column 80
              tab-width 4
              indent-tabs-mode nil     ; Permanently indent with spaces, never with TABs
              truncate-lines t
              display-line-numbers-width 3
              indicate-buffer-boundaries 'left
              display-fill-column-indicator-character ?\u254e)

(setq visible-bell nil
      inhibit-compacting-font-caches t  ; Don’t compact font caches during GC
      delete-by-moving-to-trash t       ; Deleting files go to OS's trash folder
      make-backup-files nil             ; Forbide to make backup files
      auto-save-default nil             ; Disable auto save
      blink-cursor-mode nil             ; No eyes distraction
      column-number-mode t
      create-lockfiles nil
      uniquify-buffer-name-style 'post-forward-angle-brackets ; Show path if names are same
      adaptive-fill-regexp "[ t]+|[ t]*([0-9]+.|*+)[ t]*"
      adaptive-fill-first-line-regexp "^* *$"
      sentence-end "\\([。！？]\\|……\\|[.?!][]\"')}]*\\($\\|[ \t]\\)\\)[ \t\n]*"
      sentence-end-double-space nil     ; Double-spaces after periods is morally wrong.
      word-wrap-by-category t
      use-short-answers t
      mark-even-if-inactive nil         ; Fix undo in commands affecting the mark.
      ;; Suppress GUI features
      use-file-dialog nil
      use-dialog-box nil
      inhibit-startup-screen t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      ;; Let C-k delete the whole line.
      kill-whole-line t
      ;; search should be case-sensitive by default
      case-fold-search nil
      ;; I want to close these fast, so switch to it so I can just hit 'q'
      help-window-select t
      ;; highlight error messages more aggressively
      next-error-message-highlight t
      ;; don't let the minibuffer muck up my window tiling
      read-minibuffer-restore-windows t
      ;; don't let the minibuffer muck up my window tiling
      read-minibuffer-restore-windows t
      ;; scope save prompts to individual projects
      save-some-buffers-default-predicate 'save-some-buffers-root
      ;; don't keep duplicate entries in kill ring
      kill-do-not-save-duplicates t
      truncate-string-ellipsis "…"  ;; unicode ellipses are better
      custom-safe-themes t
      mouse-wheel-tilt-scroll t
      mouse-wheel-flip-direction t
      ;; eke out a little more scrolling performance
      fast-but-imprecise-scrolling t
      ;; prefer newer elisp files
      load-prefer-newer t
      ;; more info in completions
      completions-detailed t
      ;; 允许在活动的minibuffer中执行命令并打开新的minibuffer。这样可以实现命令的嵌套。
      enable-recursive-minibuffers t
      ;; Some pretty config from prucell
      initial-scratch-message (concat ";; Happy hacking, " user-login-name " - Emacs ♥ you!\n\n"))

(global-auto-revert-mode t)  ;; Automatically show changes if the file has changed
(delete-selection-mode t)    ;; You can select text and delete it by typing.
(savehist-mode)
(minibuffer-depth-indicate-mode) ;;开头显示当前嵌套层级的深度,用方括号括起,以示区分
;; UTF-8 should always, always be the default.
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

;; Emacs has problems with very long lines.
(global-so-long-mode)

;; URLs should be highlighted and linkified.
(global-goto-address-mode)

;; Display wrape line
(global-display-fill-column-indicator-mode 1)
(global-visual-line-mode 1)

;; Show line numbers
(global-display-line-numbers-mode 1)
(setq display-line-numbers-type 'relative)

;; Eemacs true transparent
(set-frame-parameter (selected-frame) 'alpha '(90 90))
(add-to-list 'default-frame-alist '(alpha 90 90))

;; Fonts
(defun vk/setup-fonts ()
  (set-face-attribute 'default nil
                      :family "Iosevka Fixed"
                      :height 130)

  (set-fontset-font t 'symbol (font-spec :family "Nerd Font Symbol Mono") nil 'prepend)
  (set-fontset-font t 'emoji (font-spec :family "Apple Color Emoji") nil 'prepend)
  (set-fontset-font t 'han (font-spec :family "Source Han Sans CN"))

  (set-face-attribute 'font-lock-comment-face nil :slant 'italic)
  (set-face-attribute 'font-lock-keyword-face nil :slant 'italic))

(vk/setup-fonts)
(add-hook 'window-setup-hook #'vk/setup-fonts)
(add-hook 'server-after-make-frame-hook #'vk/setup-fonts)

(provide 'vk-base)
;;; vk-base.el ends here