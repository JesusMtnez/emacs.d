;;; module-direnv.el --- direnv integration

(use-package direnv
  :hook (prog-mode . direnv-mode))

(provide 'module-direnv)
;;; module-direnv.el ends here
