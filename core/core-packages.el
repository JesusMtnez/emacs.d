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

(provide 'core-packages)
;;; core-packages.el ends here
