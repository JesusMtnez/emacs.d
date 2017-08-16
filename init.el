;;; init.el
;;
;; Author:  JesusMtnez <jesusmartinez93@gmail.com>
;; URL:     https://gitlab.com/JesusMtnez/emacs.d
;; License: MIT

;(package-initialize)
; TODO Improve how everything is loaded
(require 'core (concat user-emacs-directory "core/core"))
(require 'core-packages (concat user-emacs-directory "core/core-packages"))
(require 'core-ui (concat user-emacs-directory "core/core-ui"))

(require 'module-sh (concat user-emacs-directory "modules/module-sh"))
(require 'module-snippets (concat user-emacs-directory "modules/module-snippets"))

;;;;;;;;;;;;;;;;
;; OLD CONFIG ;;
;;;;;;;;;;;;;;;;

;; Common Lisp
(use-package cl
  :ensure t
  :defer t)

;; Company
(use-package company
  :ensure t
  :config (progn (add-hook 'after-init-hook 'global-company-mode)
                 (setq company-idle-delay 0.1)          ; Reduce company auto complete start time
                 (setq company-minimum-prefix-length 1) ; Reduce prefix to start completion
                 (setq company-show-numbers t))         ; Show number to quick access with M-number
  :diminish (company-mode . "CM"))
;; TODO: Company integration with helm: https://github.com/yasuyk/helm-company

;; git-gutter
(use-package git-gutter
  :ensure t
  :if (not window-system) ; Only in terminal
  :config (progn (add-hook 'after-init-hook 'global-git-gutter-mode)
                 (git-gutter:linum-setup)
                 (setq git-gutter:hide-gutter t))
  :diminish (git-gutter-mode . "gg"))

;; git-gutter-fringe+
(use-package git-gutter-fringe+
  :ensure t
  :if window-system ; Only when window-system
  :config (progn (add-hook 'after-init-hook 'global-git-gutter+-mode)
                 (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
                 (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
                 (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
                 (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
                 (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
                 (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
                 (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-define)
                 (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
                 (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer))
  :diminish (git-gutter+-mode . "gg+"))

;; Helm
(use-package helm
  :ensure t
  :defer t
  :bind (("C-c h" . helm-command-prefix)
         ("C-x C-f" . helm-find-files)
         ("C-x b" . helm-buffers-list)
         ("M-x" . helm-M-x)
         ("M-y" . helm-show-kill-ring))
  :config (progn (require 'helm-config)
                 (setq helm-split-window-in-side-p t
                       helm-move-to-line-cycle-in-source t ; Circle when using helm-next/previous-line
                       helm-ff-search-library-in-sexp t
                       helm-scroll-amount 8
                       helm-ff-file-name-history-use-recentf t
                       helm-autoresize-mode t;
                       helm-autoresize-max-height 20
                       helm-mode-fuzzy-match t
                       helm-completion-in-region-fuzzy-match t
                       helm-M-x-fuzzy-match t)
                 (helm-mode t)
                 (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebind tab to run persistent action
                 (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
                 (define-key helm-map (kbd "C-z") 'helm-select-action)) ; list actions using C-z
  :diminish helm-mode)

;; Highlight-Characters
(use-package highlight-chars
  :ensure t
  :config (progn (add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
                 (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)))

;; Magit
(use-package magit
  :ensure t
  :defer t
  :init (progn (global-git-commit-mode t))
  :config (progn (setq magit-last-seen-setup-instructions "1.4.0")))

;; Markdown-mode
(use-package markdown-mode
  :ensure t
  :defer t
  :mode (("\\.md" . gfm-mode)
         ("\\.mdown" . gfm-mode)
         ("\\.markdown" . gfm-mode))
  :config (progn (set-variable 'markdown-indent-on-enter nil)))

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

;; YAML mode
(use-package yaml-mode
  :ensure t
  :defer t
  :mode (("\\.yml$" .  yaml-mode)
         ("\\.yaml$" . yaml-mode))
  :bind (("C-m" . newline-and-indent)))

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
