;;; module-snippets.el --- snippets integration

;; Yasnippets
(use-package yasnippet
  :ensure t
  :defer t
  :init
  (setq yas-snippet-dirs (cons (concat user-emacs-directory "snippets") '()))
  (setq yas-verbosity 1)
  (yas-global-mode t))

(provide 'module-snippets)
;;; module-snippets.el ends here
