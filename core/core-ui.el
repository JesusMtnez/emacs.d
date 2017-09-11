;;; core-ui.el --- User Insterface core

(use-package doom-themes
  ; repo: https://github.com/hlissner/emacs-doom-themes
  :ensure t
  :init (setq doom-themes-enable-bold t
              doom-themes-enable-italic t)
  :config (load-theme 'doom-one t))

;; Other alternatives:
;; - atom-one-dark-theme: https://github.com/jonathanchu/atom-one-dark-theme/
;; - atom-dark-theme-emacs:  https://github.com/whitlockjc/atom-dark-theme-emacs

(use-package dashboard
  ; repo: https://github.com/rakanalh/emacs-dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((projects  . 5)
                        (recents . 5))
        dashboard-startup-banner 'logo
        dashboard-banner-logo-title "The One True Editor, Emacs"))

(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (fboundp 'menu-bar-mode)   (menu-bar-mode -1))
(if (fboundp 'tool-bar-mode)   (tool-bar-mode -1))

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

(provide 'core-ui)
;;; core-ui.el ends here
