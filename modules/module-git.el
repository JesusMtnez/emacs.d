;;; module-git.el --- git integration

(use-package git-gutter
  :unless (version< emacs-version "26.1")
  :hook ((prog-mode text-mode) . git-gutter-mode)
  :config
  (setq git-gutter:hide-gutter t
        git-gutter:update-interval 0.1
        git-gutter:verbosity 0)
  ;(add-to-list 'git-gutter:update-hooks 'focus-in-hook)
  :diminish git-gutter-mode)

(use-package magit
  :init (progn (global-git-commit-mode t))
  :config (progn (setq magit-last-seen-setup-instructions "1.4.0")))

(provide 'module-git)
;;; module-git.el ends here
