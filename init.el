;; Improve Emacs performance
(setq max-specpdl-size (* max-specpdl-size 15)
      max-lisp-eval-depth (* max-lisp-eval-depth 30))

;; MELPA and Marmalade repos for packages.
(require 'package)
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
  :ensure t
  :defer t
  :config (progn (setq auto-package-update-delete-old-versions t)))

;; Color-theme
(use-package color-theme
  :ensure t)

;; Color Theme: Solarized Dark [Light]
(use-package color-theme-solarized
  :ensure t
  :config (progn (load-theme 'solarized t)
                 (set-frame-parameter nil 'background-mode 'dark)
                 (set-terminal-parameter nil 'background-mode 'dark)
                 (enable-theme 'solarized)))

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
  :diminish company-mode)
;; TODO: Company integration with helm: https://github.com/yasuyk/helm-company

;; git-gutter
(use-package git-gutter
  :ensure t
  :if (not window-system) ; Only in terminal
  :config (progn (add-hook 'after-init-hook 'global-git-gutter-mode)
                 (git-gutter:linum-setup)
                 (setq git-gutter:hide-gutter t))
  :diminish (git-gutter-mode . "gg")
)

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
  :diminish (git-gutter+-mode . "gg+")
)

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
                 (define-key helm-map (kbd "C-z") 'helm-select-action) ; list actions using C-z
                 )
  :diminish helm-mode
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
                 (setq ns-use-srgb-colorspace nil)
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

;; YAML mode
(use-package yaml-mode
  :ensure t
  :defer t
  :mode (("\\.yml$" .  yaml-mode)
         ("\\.yaml$" . yaml-mode))
  :bind (("C-m" . newline-and-indent))
)

;; Yasnippets
(use-package yasnippet
  :ensure t
  :defer t
  :init (progn (setq yas-snippet-dirs (cons (concat user-emacs-directory "snippets") '()))
               (setq yas-verbosity 1)
               (yas-global-mode t))
)

;; Zoom Window (like tmux zoom)
(use-package zoom-window
  :ensure t
  :defer t
  :config (progn (setq zoom-window-mode-line-color "DarkRed"))
  :bind (("C-x C-z" . zoom-window-zoom))
)

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
(set-face-attribute 'default nil :font "Hack")
(set-frame-font "Hack 9" nil t)
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
 '(sh-basic-offset 2)
 '(sh-indentation 2))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(neo-dir-link-face ((t (:foreground "DeepSkyBlue"))))
 '(neo-expand-btn-face ((t (:foreground "SkyBlue"))))
 '(neo-file-link-face ((t (:foreground "white"))))
 '(neo-header-face ((t (:foreground "LightBlue" :weight bold))))
 '(rainbow-delimiters-depth-1-face ((t (:foreground "dark orange"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "deep pink"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "chartreuse"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "deep sky blue"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "yellow"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "orchid"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "spring green"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "sienna1")))))

(if (file-exists-p "~/.emacs.d/localrc.el")
    (load "~/.emacs.d/localrc.el"))
