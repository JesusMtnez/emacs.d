;;; module-markdown.el --- markdown integration

(use-package markdown-mode
  ; repo: https://github.com/jrblevin/markdown-mode
  :mode (("\\.md" . gfm-mode)
         ("\\.mdown" . gfm-mode)
         ("\\.markdown" . gfm-mode))
  :config
  (setq markdown-indent-on-enter nil))

(use-package markdown-toc
  :hook (before-save . markdown-toc-refresh-toc)
  :bind (:map markdown-mode-map
              ("C-c i" . markdown-toc-generate-or-refresh-toc)
              ("C-c r" . markdown-toc-refresh-toc)))

(provide 'module-markdown)
;;; module-markdown.el ends here
