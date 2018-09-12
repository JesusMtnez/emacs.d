;;; 20-core-ui.el --- User Insterface core

(use-package nord-theme
  :demand
  :config
  (progn
    (load-theme 'nord t)))

(use-package dashboard
  :demand
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((projects . 10)
                          (recents . 10))
        dashboard-startup-banner 'logo
        dashboard-banner-logo-title "The One True Editor, Emacs"))

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
  :hook (emacs-lisp-mode . rainbow-delimiters-mode))

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

;; Smooth scrolling
(setq redisplay-dont-pause t
      scroll-margin 5
      scroll-step 1
      scroll-conservatively 10000
      scroll-preserve-screen-position 1)

;; Font configuration
(set-face-attribute 'default nil :font "Hack")
(set-frame-font "Hack 9" nil t)
(when (member "FontAwesome" (font-family-list))
  (set-fontset-font t 'unicode "FontAwesome" nil 'prepend))

(provide '20-core-ui)
;;; 20-core-ui.el ends here
