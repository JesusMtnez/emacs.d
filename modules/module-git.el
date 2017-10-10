;;; module-git.el --- git integration

(use-package git-gutter
  ; repo: https://github.com/syohex/emacs-git-gutter
  :demand
  :if (not window-system) ; Only in terminal
  :config (progn (add-hook 'after-init-hook 'global-git-gutter-mode)
                 (git-gutter:linum-setup)
                 (setq git-gutter:hide-gutter t))
  :diminish (git-gutter-mode . "gg"))

(use-package git-gutter-fringe+
  ; repo: https://github.com/nonsequitur/git-gutter-fringe-plus
  :ensure t
  :if window-system ; Only when window-system
  :config (progn (add-hook 'after-init-hook 'global-git-gutter+-mode)
                 (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
                 (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
                 (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
                 (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
                 (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
                 (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
                 (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-define)
                 (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
                 (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer))
  :diminish (git-gutter+-mode . "gg+"))

(use-package magit
  ; repo: https://github.com/magit/magit
  :init (progn (global-git-commit-mode t))
  :config (progn (setq magit-last-seen-setup-instructions "1.4.0")))

(provide 'module-git)
;;; module-git.el ends here
