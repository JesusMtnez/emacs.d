;;; 20-core-ui.el --- User Insterface core

(use-package doom-themes
  :demand t
  :config
  (progn
    (setq doom-themes-enable-bold t
          doom-themes-enable-italic t)
    (load-theme 'doom-one t)
    (doom-themes-org-config)))

(use-package dashboard
  :demand
  :if (< (length command-line-args) 2)
  :config
  (defun dashboard-load-packages (list-size)
    (insert (make-string (ceiling (max 0 (- dashboard-banner-length 38)) 2) ? )
            (format "[%d packages loaded in %s]" (length package-activated-list) (emacs-init-time))))

  (add-to-list 'dashboard-item-generators '(packages . dashboard-load-packages))

  (setq dashboard-items '((packages)
                          (projects . 10)
                          (recents . 10))
        dashboard-startup-banner 'logo
        dashboard-banner-logo-title "The One True Editor, Emacs")
  (dashboard-setup-startup-hook))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))

(use-package whitespace
  :demand
  :diminish global-whitespace-mode
  :init
  (setq whitespace-style '(face tabs trailing))
  (global-whitespace-mode t))

(use-package rainbow-mode)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(unless (version< emacs-version "26.1")
  (use-package display-line-numbers
    :hook ((prog-mode text-mode) . display-line-numbers-mode)))

(when (version< emacs-version "26.1")
  (use-package linum
    :hook ((prog-mode text-mode) . linum-mode)
    :config
    (setq linum-format "%4d")))

(use-package zoom-window
  :config
  (setq zoom-window-mode-line-color "DarkRed")
  :bind (("C-x C-z" . zoom-window-zoom)))

(use-package all-the-icons)

(use-package ace-window
  :bind (("M-o" . ace-window))
  :custom
  (aw-dispatch-always t "Issue read-char even for one window")
  :config
  (push " *NeoTree*" 'aw-ignored-buffers )
  (push "*which-key*" 'aw-ignored-buffers))

;; Smooth scrolling
(setq redisplay-dont-pause t
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Font configuration
(when (member "Hack" (font-family-list))
  (set-face-attribute 'default nil :font "Hack 9"))
(when (member "FontAwesome" (font-family-list))
  (set-fontset-font t 'unicode "FontAwesome" nil 'prepend))

(provide '20-core-ui)
;;; 20-core-ui.el ends here
