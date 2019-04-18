;;; module-git.el --- git integration

(use-package git-gutter
  :unless (version< emacs-version "26.1")
  :hook ((prog-mode text-mode) . git-gutter-mode)
  :diminish git-gutter-mode
  :custom
  (git-gutter:hide-gutter t)
  (git-gutter:update-interval 0.1)
  (git-gutter:verbosity 0))

(use-package magit
  :init (progn (global-git-commit-mode t)))

(provide 'module-git)
;;; module-git.el ends here
