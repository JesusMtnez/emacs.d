;;; init.el
;;
;; Author:  JesusMtnez <jesusmartinez93@gmail.com>
;; URL:     https://gitlab.com/JesusMtnez/emacs.d
;; License: MIT

;(package-initialize)
;; TODO Improve how everything is loaded
(require 'core (concat user-emacs-directory "core/core"))
(require 'core-packages (concat user-emacs-directory "core/core-packages"))
(require 'core-helm (concat user-emacs-directory "core/core-helm"))
(require 'core-ui (concat user-emacs-directory "core/core-ui"))

(require 'module-company (concat user-emacs-directory "modules/module-company"))
(require 'module-git (concat user-emacs-directory "modules/module-git"))
(require 'module-markdown (concat user-emacs-directory "modules/module-markdown"))
(require 'module-sh (concat user-emacs-directory "modules/module-sh"))
(require 'module-snippets (concat user-emacs-directory "modules/module-snippets"))
(require 'module-yaml (concat user-emacs-directory "modules/module-yaml"))

;;;;;;;;;;;;;;;;
;; OLD CONFIG ;;
;;;;;;;;;;;;;;;;

;; Common Lisp
(use-package cl
  :ensure t
  :defer t)

;; Highlight-Characters
(use-package highlight-chars
  :ensure t
  :config (progn (add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
                 (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)))

;; Move-text
(use-package move-text
  :ensure t
  :defer t
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

;; Neo-tree
(use-package neotree
  :ensure t
  :defer t
  :bind ("<f8>" . neotree-toggle))
  ;TODO: Add config section with set-face-attribute

;; linum
(use-package linum
  :ensure t
  :config (progn (setq linum-format "%4d")
                 (add-hook 'after-init-hook 'global-linum-mode)))

;; Powerline
(use-package powerline
  :ensure t
  :config (progn (powerline-default-theme)
                 (setq ns-use-srgb-colorspace t)
                 (add-hook 'after-init-hook 'powerline-reset)))

;; Rainbow mode
(use-package rainbow-mode
  :ensure t
  :defer t)

;; Rainbow delimiters mode
(use-package rainbow-delimiters
  :ensure t
  :config (progn (add-hook 'emacs-lisp-mode-hook 'rainbow-delimiters-mode)))

;; Undo-Tree
(use-package undo-tree
  :ensure t
  :defer t
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo))
  :init (progn (global-undo-tree-mode t))
  :diminish undo-tree-mode)

;; Web-mode
(use-package web-mode
  :ensure t
  :defer t
  :mode ("\\.html?\\'" "\\.css?\\'")
  :config (progn (setq web-mode-code-indent-offset 2)
                 (setq web-mode-css-indent-offset 2)
                 (setq web-mode-markup-indent-offset 2)
                 (setq web-mode-script-padding 2)
                 (setq web-mode-enable-auto-pairing t)
                 (setq web-mode-enable-current-element-highlight t)
                 (setq web-mode-enable-current-column-highlight t)
                 (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "Snow3")
                 (set-face-attribute 'web-mode-current-element-highlight-face nil :background "#073642")))

;; Web-mode -> Emmet
(use-package emmet-mode
  :ensure t
  :defer t
  :config (progn (add-hook 'web-mode-hook 'emmet-mode)))

;; Which-key
(use-package which-key
  :ensure t
  :defer t
  :init (progn (which-key-mode)))


;; Zoom Window (like tmux zoom)
(use-package zoom-window
  :ensure t
  :defer t
  :config (progn (setq zoom-window-mode-line-color "DarkRed"))
  :bind (("C-x C-z" . zoom-window-zoom)))

;; misc package for extra functionality
(require 'misc)

;; Scala-IDE configuration
(load (concat user-emacs-directory "scala-conf.el") 'noerror)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My personal configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
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
;; (setq inhibit-startup-screen t)

;; Functions
(defun reload-configuration ()
  "Reload configuration"
  (interactive)
  (load-file user-init-file))

;; Key bindings
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)
(global-set-key (kbd "<f5>") 'reload-configuration)

;; Customizations
(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

;; OSX Specific configurations
(if (eq system-type 'darwin)
    (load (concat user-emacs-directory "macosx-conf.el") 'noerror))

;; Local configurations
(load (concat user-emacs-directory "localrc.el") 'noerror)
