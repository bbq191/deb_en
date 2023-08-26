;;; init-elisp.el --- elisp -*- lexical-binding: t -*-
;;; Commentary:
;; dev utils and some no need config lang

;;; Code:

;; elisp-mode
(use-package elisp-mode
  :elpaca nil
  :ensure nil
  :bind (:map emacs-lisp-mode-map
              ("C-c C-c" . eval-to-comment)
              :map lisp-interaction-mode-map
              ("C-c C-c" . eval-to-comment))
  :config
  (defconst eval-as-comment-prefix ";;=> ")

  ;; Imitate scala-mode
  ;; from https://github.com/dakra/dmacs
  (defun eval-to-comment (&optional arg)
    (interactive "P")
    (let ((start (point)))
      (eval-print-last-sexp arg)
      (save-excursion
        (goto-char start)
        (forward-line 1)
        (insert eval-as-comment-prefix)))))
(elpaca-wait)

(provide 'coding-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; coding-setup.el ends here
