;;; module-git.el --- git integration

(use-package git-gutter
  ; repo: https://github.com/syohex/emacs-git-gutter
  :unless (version< emacs-version "26.1")
  :hook prog-mode
  :config
  (setq git-gutter:hide-gutter t)
  :diminish git-gutter-mode)

(use-package magit
  ; repo: https://github.com/magit/magit
  :init (progn (global-git-commit-mode t))
  :config (progn (setq magit-last-seen-setup-instructions "1.4.0")))

(provide 'module-git)
;;; module-git.el ends here
