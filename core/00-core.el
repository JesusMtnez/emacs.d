;;; 00-core.el --- the core of the configuration

;; UTF-8 as the default coding system
(use-package mule
  :ensure nil
  :config
  (when (fboundp 'set-charset-priority)
    (set-charset-priority 'unicode))
  (prefer-coding-system        'utf-8)
  (set-terminal-coding-system  'utf-8)
  (set-keyboard-coding-system  'utf-8)
  (set-selection-coding-system 'utf-8)
  (setq locale-coding-system   'utf-8)
  (setq-default buffer-file-coding-system 'utf-8))

(use-package frame
  :ensure nil
  :bind ("C-z" . nil))

(use-package emacs
  :ensure nil
  :bind ("C-c C-c" . comment-or-uncomment-region-or-line)
  :custom
  (cursor-type 'bar)
  (make-backup-files nil)
  (c-basic-offset 2)
  (tab-width 2)
  (tab-always-indent nil)
  (indent-tabs-mode nil)
  (show-paren-mode t)
  (electric-pair-mode t)
  (delete-selection-mode t)
  (global-auto-revert-mode t)
  (custom-file (concat user-emacs-directory "custom.el"))
  :config
  (put 'downcase-region 'disabled nil)
  (fset 'yes-or-no-p 'y-or-n-p)
  (load custom-file 'no-error)
  (load (concat user-emacs-directory "localrc.el") 'noerror))

(use-package simple
  :ensure nil
  :hook (before-save . delete-trailing-whitespace)
  :custom
  (column-number-mode t)
  (global-visual-line-mode t))

(use-package startup
  :ensure nil
  :custom
  (initial-scratch-message nil)
  (initial-major-mode 'org-mode))

(use-package mwim
  :bind (("C-a" . mwim-beginning)
         ("C-e" . mwim-end)))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package restart-emacs)

(provide '00-core)
;;; 00-core.el ends here
