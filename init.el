;;; init.el -- Emacs Bootstrap
;;
;; Author:  JesusMtnez <jesusmartinez93@gmail.com>
;; URL:     https://gitlab.com/JesusMtnez/emacs.d
;; License: MIT

;; GC threshold to 1GB
(setq gc-cons-threshold 1000000000
      gc-cons-percentage 0.6)

(add-hook 'after-init-hook
          (lambda ()
            (setq gc-cons-threshold 100000000
                  gc-cons-percentage 0.1)))

(defvar defaults/file-name-handler-alist file-name-handler-alist
  "Save default value for file-name-handler-alist")

(add-hook 'emacs-startup-hook
          (lambda ()
            (setq file-name-handler-alist defaults/file-name-handler-alist)))

(setq file-name-handler-alist nil)

(defvar version "0.1.0"
  "Current version of my configuration.")

(defvar homepage "https://gitlab.com/JesusMtnez/emacs.d"
  "Project homepage.")

(defvar emacs-dir (expand-file-name user-emacs-directory)
  "The path to this emacs.d directory.")

(defvar core-dir  "core/"
  "Where essential files are stored.")

(defvar modules-dir "modules/"
  "Where configuration modules are stored.")

(defvar local-dir (concat emacs-dir "local/")
  "Root directory for local Emacs files.")

(defvar cache-dir (concat local-dir "cache/")
  "Where volatile files are storaged.")

(require 'package)
(setq package-enable-at-startup nil)

;; MELPA repos for packages.
(setq package-archives
      '(("gnu"          . "https://elpa.gnu.org/packages/")
        ("melpa"        . "https://melpa.org/packages/")
        ("melpa-stable" . "https://stable.melpa.org/packages/")))

(setq package-archive-priorities
      '(("gnu"          . 10)
        ("melpa"        . 20)
        ("melpa-stable" . 0)))

(package-initialize)

;; Bootstrap 'use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))

(setq use-package-always-defer t
      use-package-always-ensure t
      use-package-compute-statistics t)

(require 'bind-key)
(require 'cl-lib)

(use-package diminish)

;; Configuraion loading
(use-package el-init)

(el-init-load emacs-dir
  :subdirectories (list core-dir modules-dir))

;;; init.el ends here
