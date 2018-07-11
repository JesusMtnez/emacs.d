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
  :commands sbt-start sbt-command)

(use-package ensime
  :pin "melpa-stable"
  :commands (ensime ensime-mode ensime-scala-mode-hook)
  :hook ((scala-mode . ensime-mode)
         (ensime-mode . scala/enable-eldoc)
         (ensime-mode . eldoc-mode))
  :bind (:map ensime-mode-map
              ("." . scala/completing-dot))
  :config
  (setq ensime-startup-notification nil
        ensime-eldoc-hints 'all))

(provide 'module-scala)
;;; module-scala.el ends here
