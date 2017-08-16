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

;; Auto Package Update
(use-package auto-package-update
  ; repo: https://github.com/rranelli/auto-package-update.el
  :ensure t
  :defer t
  :config (setq auto-package-update-delete-old-versions t))

(provide 'core-packages)
;;; core-packages.el ends here
