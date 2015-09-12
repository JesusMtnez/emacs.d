;; Improve Emacs performance
(setq max-specpdl-size (* max-specpdl-size 15)
      max-lisp-eval-depth (* max-lisp-eval-depth 30))

;; MELPA and Marmalade repos for packages.
(require 'package)
;;(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
;;(add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/") t)
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

;; Color Theme: Solarized Dark [Light]
(use-package color-theme-solarized
  :ensure t
  :init (require 'color-theme)
  :config (progn (set-frame-parameter nil 'background-mode 'dark)
                 (set-terminal-parameter nil 'background-mode 'dark)
                 (add-to-list 'load-path (car (directory-files "~/.emacs.d/elpa" t "color-theme-solarized-*" nil)))
                 (color-theme-solarized))
  )

;; Common Lisp
(use-package cl
  :ensure t
  :defer t)

;; Company
(use-package company
  :ensure t
  :config (progn (add-hook 'after-init-hook 'global-company-mode))
  :diminish company-mode)
;; TODO: Company integration with helm: https://github.com/yasuyk/helm-company

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
                       helm-move-to-line-cycle-in-source t
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
                 (define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z
                 )
  )

;; Highlight-Characters
(use-package highlight-chars
  :ensure t
  :config (progn (add-hook 'font-lock-mode-hook 'hc-highlight-tabs)
		 (add-hook 'font-lock-mode-hook 'hc-highlight-trailing-whitespace)))

;; JS2-mode
(use-package js2-mode
  :ensure t
  :defer t
  :mode (("\\.js" . js2-mode)))

;; Magit
(use-package magit
  :ensure t
  :defer t
  :config (progn (setq magit-last-seen-setup-instructions "1.4.0")))

;; Markdown-mode
(use-package markdown-mode
  :ensure t
  :defer t
  :mode (("\\.md" . gfm-mode)
         ("\\.mdown" . gfm-mode)
         ("\\.markdown" . gfm-mode))
  :config (progn (set-variable 'markdown-indent-on-enter nil)))

;; Neo-tree
(use-package neotree
  :ensure t
  :defer t
  :bind ("<f8>" . neotree-toggle))
  ;TODO: Add config section with set-face-attribute

;; nlinum
(use-package nlinum
  :ensure t
  :config (progn (setq nlinum-format "%4d")
                 (add-hook 'after-init-hook 'global-nlinum-mode)))

;; Powerline
(use-package powerline
  :ensure t
  :config (progn (powerline-center-theme)
                 (setq powerline-default-separator 'contour)))

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

;;;;;;;;;;;;;;;;;;;;;;;;
;; OLD CONFIGURATIONS ;;
;;;;;;;;;;;;;;;;;;;;;;;;

;; Bootstrap 'paradox-package-manager
(unless (package-installed-p 'paradox)
  (package-refresh-contents)
  (package-install 'paradox))

;; move-lines package
(add-to-list 'load-path "~/.emacs.d/non-elpa/move-lines")
(require 'move-lines)
(move-lines-binding)

;; livedown package
(add-to-list 'load-path "~/.emacs.d/non-elpa/emacs-livedown")
(require 'livedown)

;; misc package for extra functionality
(require 'misc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; My personal configurations ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(setq-default c-basic-offset 4
              tab-width 4
              indent-tabs-mode nil
              tab-always-indent nil)

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))
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

;; Font configuration
(set-face-attribute 'default nil :font "DejaVu Sans Mono for Powerline")
(set-frame-font "DejaVu Sans Mono for Powerline 9" nil t)
;; Encoding configuration
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; Remap left-option-key to meta-key
(if (eq system-type 'darwin)
  (setq ns-command-modifier 'meta)
  (setq ns-option-modifier 'meta)
)
(setq ns-right-command-modifier 'none)
(setq ns-right-option-modifier 'none)
;; (setq inhibit-startup-screen t)

;; Comment line/region function. Bind to C-c C-c
(defun comment-or-uncomment-region-or-line ()
  "Comments or uncomments the region or the current line if there's no active region."
  (interactive)
  (let (beg end)
    (if (region-active-p)
      (setq beg (region-beginning) end (region-end))
      (setq beg (line-beginning-position) end (line-end-position))
    )
    (comment-or-uncomment-region beg end)
  )
)

;; Key bindings
(global-set-key (kbd "C-c C-c") 'comment-or-uncomment-region-or-line)
(global-set-key (kbd "C-x C-k") 'kill-this-buffer)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(livedown:autostart t)
 '(livedown:open t)
 '(livedown:port 1337)
 '(paradox-github-token t)
 '(sh-indentation 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-dir-link-face ((t (:foreground "DeepSkyBlue"))))
 '(neo-expand-btn-face ((t (:foreground "SkyBlue"))))
 '(neo-file-link-face ((t (:foreground "White"))))
 '(neo-header-face ((t (:foreground "lightBlue" :weight bold)))))

(if (file-exists-p "~/.emacs.d/localrc.el")
    (load "~/.emacs.d/localrc.el"))
