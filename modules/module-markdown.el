;;; module-markdown.el --- markdown integration

(use-package markdown-mode
  ; repo: https://github.com/jrblevin/markdown-mode
  :mode (("\\.md" . gfm-mode)
         ("\\.mdown" . gfm-mode)
         ("\\.markdown" . gfm-mode))
  :config (setq markdown-indent-on-enter nil
                markdown-make-))

;; TODO Configure 'markdown-toc'
;; (use-package markdown-toc
;;   ; repo: https://github.com/ardumont/markdown-toc
;;   :ensure t
;;   :defer t)

(provide 'module-markdown)
;;; module-markdown.el ends here
