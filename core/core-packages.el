;;; core-packages.el --- packages managements core

(require 'package)

;; MELPA repos for packages.
(add-to-list 'package-archives '("melpa"        . "http://melpa.org/packages/") t)
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)

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
(require 'bind-key)

(setq use-package-always-defer t
      use-package-always-ensure t)

(use-package cl)
(require 'misc)

(use-package auto-package-update
  ; repo: https://github.com/rranelli/auto-package-update.el
  :config (setq auto-package-update-delete-old-versions t))

(use-package diminish)

(provide 'core-packages)
;;; core-packages.el ends here
