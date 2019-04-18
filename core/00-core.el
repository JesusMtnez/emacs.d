;;; 00-core.el --- the core of the configuration

;; UTF-8 as the default coding system
(when (fboundp 'set-charset-priority)
  (set-charset-priority 'unicode))
(prefer-coding-system        'utf-8)
(set-terminal-coding-system  'utf-8)
(set-keyboard-coding-system  'utf-8)
(set-selection-coding-system 'utf-8)
(setq locale-coding-system   'utf-8)
(setq-default buffer-file-coding-system 'utf-8)

(global-unset-key (kbd "C-z"))
(global-unset-key (kbd "M-/"))

;; Personal settings
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil
              tab-always-indent nil)
(fset 'yes-or-no-p 'y-or-n-p)
(show-paren-mode t)
(setq show-paren-style 'expression)
(column-number-mode t)
(electric-pair-mode t)
(delete-selection-mode t)
(global-auto-revert-mode t)
(global-visual-line-mode t)
(setq make-backup-files nil)
(setq-default cursor-type 'bar)
(put 'downcase-region 'disabled nil)

;; scratch
(setq
 initial-scratch-message nil ; Empty scratch buffer
 initial-major-mode 'org-mode)

;; Key bindings
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

;; Customizations
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Local configurations
(load (concat user-emacs-directory "localrc.el") 'noerror)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold 800000)))

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist defaults/file-name-handler-alist)))

(use-package mwim
  :bind (("C-a" . mwim-beginning)
         ("C-e" . mwim-end)))

(use-package which-key
  :hook (after-init . which-key-mode))

(use-package restart-emacs)

(provide '00-core)
;;; 00-core.el ends here
