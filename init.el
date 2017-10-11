;;; init.el
;;
;; Author:  JesusMtnez <jesusmartinez93@gmail.com>
;; URL:     https://gitlab.com/JesusMtnez/emacs.d
;; License: MIT

;(package-initialize)
;; TODO Improve how everything is loaded
(require 'core (concat user-emacs-directory "core/core"))
(require 'core-packages (concat user-emacs-directory "core/core-packages"))
(require 'core-projects (concat user-emacs-directory "core/core-projects"))
(require 'core-helm (concat user-emacs-directory "core/core-helm"))
(require 'core-modeline (concat user-emacs-directory "core/core-modeline"))
(require 'core-ui (concat user-emacs-directory "core/core-ui"))

(require 'module-company (concat user-emacs-directory "modules/module-company"))
(require 'module-docker (concat user-emacs-directory "modules/module-docker"))
(require 'module-git (concat user-emacs-directory "modules/module-git"))
(require 'module-json (concat user-emacs-directory "modules/module-json"))
(require 'module-markdown (concat user-emacs-directory "modules/module-markdown"))
(require 'module-sh (concat user-emacs-directory "modules/module-sh"))
(require 'module-text (concat user-emacs-directory "modules/module-text"))
(require 'module-scala (concat user-emacs-directory "modules/module-scala"))
(require 'module-snippets (concat user-emacs-directory "modules/module-snippets"))
(require 'module-undo (concat user-emacs-directory "modules/module-undo"))
(require 'module-web (concat user-emacs-directory "modules/module-web"))
(require 'module-yaml (concat user-emacs-directory "modules/module-yaml"))

;; Customizations
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; Local configurations
(load (concat user-emacs-directory "localrc.el") 'noerror)
