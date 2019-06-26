;;; 10-core-packages.el --- packages managements core

(use-package cl)
(require 'misc)

(use-package auto-package-update
  :custom
  (auto-package-update-last-update-day-path (concat cache-dir ".last-package-update-day"))
  (auto-package-update-delete-old-versions t))

(provide '10-core-packages)
;;; 10-core-packages.el ends here
