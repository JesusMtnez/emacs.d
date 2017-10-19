;;; module-sh.el --- sh integration

(use-package sh-script
  ; Built-in mode for sh
  :mode (("\\.zsh$" . sh-mode)
         ("/zshrc$" . sh-mode))
  :config (setq sh-basic-offset 2
                sh-indentation 2))

(use-package insert-shebang
  ; repo: https://github.com/psachin/insert-shebang
  :init
  (remove-hook 'find-file-hook 'insert-shebang))

(use-package company-shell
  ; repo: https://github.com/Alexander-Miller/company-shell
  :init
  (add-to-list 'company-backends '(company-shell company-shell-env)))

(provide 'module-sh)
;;; module-sh.el ends here
