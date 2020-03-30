;;; 70-core-lsp.el --- lsp support

(use-package lsp-mode
  :hook ((lsp-mode . lsp-enable-which-key-integration)
         ((scala-mode haskell-mode) . lsp-deferred))
  :bind-keymap ("C-c l" . lsp-command-map)
  :commands (lsp lsp-deferred)
  :custom
  (lsp-session-file (concat cache-dir ".lsp-session-v1"))
  (lsp-auto-guess-root t)
  (lsp-keep-workspace-alive nil)
  (lsp-enable-folding nil)
  (lsp-enable-file-watchers nil)
  (lsp-enable-text-document-color nil)
  (lsp-enable-semantic-highlighting nil)
  (lsp-enable-indentation nil)
  (lsp-enable-on-type-formatting nil)
  (lsp-idle-delay 0.1)
  (lsp-eldoc-enable-hoover t)
  (lsp-eldoc-render-all t)
  (lsp-diagnostic-package :flymake)
  (lsp-signature-auto-activate t)
  (lsp-signature-render-documentation t)
  (lsp-enable-text-document-color t))

(use-package helm-lsp
  :after helm lsp-mode)

(use-package company-lsp
  :after company-mode
  :custom
  (company-lsp-cache-candidates nil)
  (company-lsp-async t)
  (company-lsp-enable-recompletion t))

(provide '70-core-lsp)
;;; 70-core-lsp.el ends here
