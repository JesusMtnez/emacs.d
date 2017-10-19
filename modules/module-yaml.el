;;; module-yaml.el --- yaml integration

(use-package yaml-mode
  ; repo: https://github.com/yoshiki/yaml-mode
  :mode (("\\.yml$" .  yaml-mode)
         ("\\.yaml$" . yaml-mode))
  :bind (("C-m" . newline-and-indent)))

(provide 'module-yaml)
;;; module-yaml.el ends here
