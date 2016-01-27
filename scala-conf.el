;; Configuration for Scala

(defun scala/enable-eldoc ()
  "Show the type of the symbol under the cursor"
  (setq-local eldoc-documentation-function
              (lambda ()
                (when (ensime-connected-p)
                  (ensime-print-type-at-point))))
  (eldoc-mode +1))

;; ENSIME
(use-package ensime
  :ensure t
  :defer t
  :config (progn (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
                 (add-hook 'ensime-mode-hook #'scala/enable-eldoc)))
