;;; module-markdown.el --- markdown integration

(use-package markdown-mode
  :mode (("\\.m[ark]*d[own]*" . gfm-mode))
  :custom
  (markdown-indent-on-enter nil))

(use-package grip-mode
  :bind (:map markdown-mode-command-map
              ("g" . grip-mode))
  :custom
  (grip-update-after-change nil)
  (grip-preview-use-webkit nil))

(use-package markdown-toc
  :hook (before-save . markdown-toc-refresh-toc)
  :bind (:map markdown-mode-map
              ("C-c i" . markdown-toc-generate-or-refresh-toc)
              ("C-c r" . markdown-toc-refresh-toc)))

(provide 'module-markdown)
;;; module-markdown.el ends here
