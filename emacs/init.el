;; init.el -*- coding: utf-8; lexical-binding: t -*-
;;; Commentary:
;;; Code:

;; Base optomize ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Defer garbage collection further back in the startup process
(setq gc-cons-threshold most-positive-fixnum)

;; Don't pass case-insensitive to `auto-mode-alist'
(setq auto-mode-case-fold nil)

;; Optimization
;; UTF-8 should always, always be the default.
(set-charset-priority 'unicode)
(prefer-coding-system 'utf-8-unix)

(setq idle-update-delay 1.0)

(setq-default cursor-in-non-selected-windows nil)
(setq highlight-nonselected-windows nil)

(setq fast-but-imprecise-scrolling t)
(setq redisplay-skip-fontification-on-input t)

;; Disable warning of defvar
(setq enable-local-variables :all)

;; By default, Emacs requires you to hit ESC three times to escape quit the minibuffer.
(global-set-key [escape] 'keyboard-escape-quit)

(let ((dir (locate-user-emacs-file "config")))
  (add-to-list 'load-path (file-name-as-directory dir)))

;; --debug-init implies `debug-on-error'.
(setq debug-on-error init-file-debug)

;; Package setup and additional utility functions
(setq read-process-output-max (* 4 1024 1024))

;; use package ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(require 'package)
(setq package-archives '(("melpa"  . "https://melpa.org/packages/")
                         ("gnu"    . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")))

;; Bootstrap `use-package'
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Should set before loading `use-package'
(eval-and-compile
  (setq use-package-always-ensure t) ;不用每个包都手动添加:ensure t关键字
  (setq use-package-always-defer nil) ;默认都不是延迟加载
  (setq use-package-always-demand nil)
  (setq use-package-expand-minimally t)
  (setq use-package-verbose t))
(eval-when-compile
  (require 'use-package))

;; Bootstrap `quelpa'.
(use-package quelpa
  :commands quelpa
  :custom
  (quelpa-git-clone-depth 1)
  (quelpa-self-upgrade-p nil)
  (quelpa-update-melpa-p nil)
  (quelpa-checkout-melpa-p nil))

;; Personal config load
(require 'vk-base)
(require 'vk-fix-default)
(require 'vk-visual)
(require 'vk-centaur-tabs)
(require 'vk-treesitter)

;; For editor
(require 'vk-text-manipulation)
(require 'vk-improvements)

;; Load `custom-file'
;; (when (file-exists-p custom-file) (load custom-file))

(provide 'init)
;;; init.el ends here
