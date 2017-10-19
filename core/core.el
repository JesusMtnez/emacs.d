;;; core.el --- the core of the configuration

(defvar version "0.1.0"
  "Current version of my configuration.")

(defvar emacs-dir (expand-file-name user-emacs-directory)
  "The path to this emacs.d directory.")

(defvar core-dir (concat emacs-dir "core/")
  "Where essential files are stored.")

(defvar modules-dir (concat emacs-dir "modules/")
  "Where configuration modules are stored.")

(defvar local-dir (concat emacs-dir "local/")
  "Root directory for local Emacs files.")

(defvar cache-dir (concat local-dir "cache/")
  "Where volatile files are storaged.")

;;Personal information
(setq user-full-name "JesusMtnez"
      user-mail-address "jesusmartinez93@gmail.com")

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

;; Key bindings
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

(provide 'core)
;;; core.el ends here
