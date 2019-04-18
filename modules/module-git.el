;;; module-git.el --- git integration

(use-package git-gutter
  :unless (version< emacs-version "26.1")
  :hook ((prog-mode text-mode) . git-gutter-mode)
  :diminish git-gutter-mode
  :custom
  (git-gutter:hide-gutter t)
  (git-gutter:update-interval 0.1)
  (git-gutter:verbosity 0))

(use-package git-commit
  :hook (after-init . global-git-commit-mode))

(use-package magit
  :bind ("C-x g" . magit-status))

(provide 'module-git)
;;; module-git.el ends here
