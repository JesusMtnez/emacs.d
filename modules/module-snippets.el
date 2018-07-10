;;; module-snippets.el --- snippets integration

(use-package yasnippet
  :hook (prog-mode . yas-minor-mode)
  :bind (:map yas-minor-mode-map
              ("C-<tab>" . yas-expand))
  :diminish
  :config
  (progn
    (yas-reload-all)
    (setq yas-snippet-dirs (list (concat emacs-dir "snippets")))
    (setq yas-verbosity 1)))

(provide 'module-snippets)
;;; module-snippets.el ends here
