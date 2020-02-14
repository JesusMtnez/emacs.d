;;; module-haskell.el -- haskell integration

(use-package haskell-mode
  :custom
  (haskell-stylish-on-save t))

(use-package lsp-haskell
  :custom
  ;; (lsp-log-io t)
  (lsp-haskell-process-path-hie "ghcide")
  (lsp-haskell-process-args-hie '()))

(provide 'module-haskell)
;;; module-haskell.el  ends here
