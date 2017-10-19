;;; core-packages.el --- packages managements core

(require 'package)

;; MELPA repos for packages.
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

;; Bootstrap 'use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)
(require 'diminish)

(setq use-package-always-defer t
      use-package-always-ensure t)

(use-package cl)
(require 'misc)

(use-package auto-package-update
  ; repo: https://github.com/rranelli/auto-package-update.el
  :config (setq auto-package-update-delete-old-versions t))

(provide 'core-packages)
;;; core-packages.el ends here
