;;; module-sh.el --- sh integration

(use-package sh-script
  :mode (("\\.zsh$" . sh-mode)
         ("/zshrc$" . sh-mode))
  :bind (:map sh-mode-map
              ("C-c s" . insert-shebang))
  :custom
  (sh-basic-offset 2)
  (sh-indentation 2))

(use-package insert-shebang
  :init (remove-hook 'find-file-hook 'insert-shebang)
  :config (setq insert-shebang-file-types
                '(("py" . "python")
                  ("fish" . "fish")
                  ("sh" . "bash")
                  ("zsh" . "zsh"))))

(use-package company-shell
  :after (company sh-script)
  :init
  (push 'company-shell company-backends)
  (push 'company-shell-env company-backends))

(provide 'module-sh)
;;; module-sh.el ends here
