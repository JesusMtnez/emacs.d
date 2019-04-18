;;; module-snippets.el --- snippets integration

(use-package yasnippet
  :after company
  :hook (prog-mode . yas-minor-mode)
  :bind (:map yas-minor-mode-map
              ("<tab>" . nil)
              ("TAB" . nil)
              ("C-<tab>" . yas-expand))
  :custom
  (yas-snippet-dirs (list (concat emacs-dir "snippets")))
  (yas-verbosity 1)
  :config
  (yas-reload-all))

(provide 'module-snippets)
;;; module-snippets.el ends here
