;;; 70-core-lsp.el --- lsp support

(use-package lsp-ui
  :custom
  (lsp-ui-doc-enable t)
  (lsp-ui-doc-include-signature t)
  (lsp-ui-doc-position 'at-point)
  (lsp-ui-doc-delay 0.2)
  (lsp-ui-imenu-enable nil)
  (lsp-ui-sideline-enable nil))

(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         ((scala-mode haskell-mode) . lsp-deferred))
  :bind-keymap ("C-c l" . lsp-command-map)
  :commands (lsp lsp-deferred)
  :custom
  (lsp-session-file (concat cache-dir ".lsp-session-v1"))
  (lsp-prefer-capf t)
  (lsp-idle-delay 0.1)
  (lsp-eldoc-enable-hoover t)
  (lsp-eldoc-render-all t)
  (lsp-diagnostic-package :flymake))

(use-package helm-lsp
  :after helm lsp-mode)

(use-package company-lsp
  :after company-mode
  :custom
  (company-lsp-cache-candidates t)
  (company-lsp-async t)
  (company-lsp-enable-recompletion t))

(provide '70-core-lsp)
;;; 70-core-lsp.el ends here
