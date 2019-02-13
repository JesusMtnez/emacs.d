;;; 70-core-lsp.el --- lsp support

(use-package lsp-mode
  :config
  (setq lsp-session-file (concat cache-dir ".lsp-session-v1")))

;; (use-package eglot
;;   :config
;;   (add-to-list 'eglot-server-programs '(scala-mode . ("metals-emacs")))
;;   :hook (scala-mode . eglot-ensure))

(use-package helm-lsp
  :after helm lsp-mode)

(provide '70-core-lsp)
;;; 70-core-lsp.el ends here
