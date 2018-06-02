;;; 10-core-packages.el --- packages managements core

(use-package cl)
(require 'misc)

(use-package auto-package-update
  ; repo: https://github.com/rranelli/auto-package-update.el
  :config (setq auto-package-update-delete-old-versions t))

(provide '10-core-packages)
;;; 10-core-packages.el ends here
