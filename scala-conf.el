;; Configuration for Scala

(defun scala/enable-eldoc ()
  "Show the type of the symbol under the cursor"
  (setq-local eldoc-documentation-function
              (lambda ()
                (when (ensime-connected-p)
                  (ensime-print-type-at-point))))
  (eldoc-mode +1))

(defun scala/completing-dot ()
  "Insert a period and show company completions."
  (interactive "*")
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t))
  (insert ".")
  (company-complete))

(defun scala/local-keys ()
  "Set up local key bindings"
  (local-set-key (kbd ".") 'scala/completing-dot))

;; ENSIME
(use-package ensime
  :ensure t
  :defer t
  :config (progn (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
                 (add-hook 'ensime-mode-hook 'scala/enable-eldoc)
                 (add-hook 'ensime-mode-hook 'scala/local-keys)))
