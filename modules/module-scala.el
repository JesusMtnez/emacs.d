;;; module-scala.el --- scala integration

(use-package scala-mode
  ; repo: https://github.com/ensime/emacs-scala-mode
  :mode "\\.s\\(cala\\|bt\\)$"
  :config
  (setq scala-indent:align-forms t
            scala-indent:align-parameters t
            scala-indent:default-run-on-strategy scala-indent:operator-strategy))

(use-package sbt-mode)

;; ENSIME
(use-package ensime
  :commands (ensime ensime-mode ensime-scala-mode-hook)
  :config
  (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)
  (add-hook 'scala-mode-hook #'ensime-mode)
  (add-hook 'ensime-mode-hook #'eldoc-mode))

(provide 'module-scala)
;;; module-scala.el ends here
