;;; module-sh.el --- sh integration

(use-package sh-script
  ; Built-in mode for sh
  :ensure t
  :defer t
  :mode (("\\.zsh$" . sh-mode)
         ("/zshrc$" . sh-mode)))
  :config (setq sh-basic-offset 2
                sh-indentation 2)

;; TODO Configure 'insert-shebang'
;; (use-package insert-shebang
;;   ; repo: https://github.com/psachin/insert-shebang
;;   :ensure t
;;   :defer t)

(provide 'module-sh)
;;; module-sh.el ends here
