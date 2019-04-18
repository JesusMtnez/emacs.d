;;; module-markdown.el --- markdown integration

(use-package markdown-mode
  :mode (("\\.m[ark]*d[own]*" . gfm-mode))
  :custom
  (markdown-indent-on-enter nil))

(use-package flymd
  :custom
  (flymd-output-directory (concat cache-dir "flymd")
        flymd-browser-open-function (lambda (url) (let((browse-url-browser-function 'browse-url-firefox))
                                                    (browse-url url)))))

(use-package markdown-toc
  :hook (before-save . markdown-toc-refresh-toc)
  :bind (:map markdown-mode-map
              ("C-c i" . markdown-toc-generate-or-refresh-toc)
              ("C-c r" . markdown-toc-refresh-toc)))

(provide 'module-markdown)
;;; module-markdown.el ends here
