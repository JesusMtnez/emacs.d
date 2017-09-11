;;; core.el --- the core of the configuration

(defvar version "0.0.1"
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

(provide 'core)
;;; core.el ends here
