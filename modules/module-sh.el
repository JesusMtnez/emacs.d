;;; module-sh.el --- sh integration

(use-package sh-script
  ; Built-in mode for sh
  :mode (("\\.zsh$" . sh-mode)
         ("/zshrc$" . sh-mode))
  :bind (:map sh-mode-map
              ("C-c s" . insert-shebang))
  :config (progn
            (setq sh-basic-offset 2
                  sh-indentation 2)))

(use-package insert-shebang
  :init (remove-hook 'find-file-hook 'insert-shebang)
  :config (setq insert-shebang-file-types
                '(("py" . "python")
                  ("fish" . "fish")
                  ("sh" . "bash")
                  ("zsh" . "zsh"))))

(use-package company-shell
  :init
  (add-to-list 'company-backends '(company-shell company-shell-env)))

(provide 'module-sh)
;;; module-sh.el ends here
