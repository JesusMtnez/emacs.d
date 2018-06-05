;;; module-scala.el --- scala integration

(use-package scala-mode
  ; repo: https://github.com/ensime/emacs-scala-mode
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

;; ENSIME
(use-package ensime
  :pin "melpa-stable"
  :commands (ensime ensime-mode ensime-scala-mode-hook)
  :hook (scala-mode . ensime-mode)
  :config
  (add-hook 'ensime-mode-hook #'eldoc-mode)
  (setq ensime-startup-notification nil
        ensime-eldoc-hints 'all))

(provide 'module-scala)
;;; module-scala.el ends here
