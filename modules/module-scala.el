;;; module-scala.el --- scala integration

(defun scala/enable-eldoc ()
  ;; Configure eldoc-mode for scala.
  (setq-local eldoc-documentation-function
              (lambda ()
                (when (ensime-connected-p)
                  (ensime-type-at-point))))
  (eldoc-mode +1))

(defun scala/completing-dot ()
  "Insert a period and show company completions."
  (interactive "*")
  (when (s-matches? (rx (+ (not space)))
                    (buffer-substring (line-beginning-position) (point)))
    (delete-horizontal-space t))
  (company-abort)
  (insert ".")
  (company-complete))

(use-package scala-mode
  :mode "\\.s\\(cala\\|bt\\)$"
  :config
  (setq scala-indent:align-forms t
        scala-indent:align-parameters t
        scala-indent:indent-value-expression t
        scala-indent:default-run-on-strategy
        scala-indent:operator-strategy))

(use-package sbt-mode
  :after scala-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))

(use-package lsp-scala
  :if (file-directory-p (concat local-dir "lsp-scala"))
  :after scala-mode
  :demand t
  :load-path (lambda() (concat local-dir "lsp-scala"))
  :hook (scala-mode . lsp)
  :init
  (setq lsp-scala-server-command "~/.local/bin/metals-emacs"))

(provide 'module-scala)
;;; module-scala.el ends here
