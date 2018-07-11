;;; module-snippets.el --- snippets integration

(use-package yasnippet
  :after company
  :hook (prog-mode . yas-minor-mode)
  :bind (:map yas-minor-mode-map
              ("<tab>" . nil)
              ("TAB" . nil)
              ("C-<tab>" . yas-expand))
  :config
  (progn
    (setq yas-snippet-dirs (list (concat emacs-dir "snippets")))
    (yas-reload-all)
    (setq yas-verbosity 1)))

(provide 'module-snippets)
;;; module-snippets.el ends here
