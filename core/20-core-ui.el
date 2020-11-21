;;; 20-core-ui.el --- User Insterface core

(use-package all-the-icons
  :commands (all-the-icons-faicon all-the-icons-material))

(use-package doom-themes
  :demand t
  :custom
  (doom-themes-enable-bold t)
  (doom-themes-enable-italic t)
  :config
  (load-theme 'doom-one t))

(use-package dashboard
  :demand
  :if (< (length command-line-args) 2)
  :bind (:map dashboard-mode-map
              ("U" . auto-package-update-now)
              ("R" . restart-emacs)
              ("K" . kill-emacs))
  :custom
  (dashboard-startup-banner (concat user-emacs-directory "assets/emacs-vscode.png"))
  (dashboard-banner-logo-title "The One True Editor, Emacs")
  (dashboard-set-heading-icons t)
  (dashboard-set-file-icons t)
  (dashboard-set-init-info t)
  (dashboard-set-navigator t)
  (dashboard-navigator-buttons
   `(
     ((,(and (display-graphic-p)
             (all-the-icons-faicon "gitlab" :height 0.8 :face 'all-the-icons-orange))
       "Homepage"
       "Browse Homepage"
       (lambda (&rest _) (browse-url homepage)))
      (,(and (display-graphic-p)
             (all-the-icons-material "update" :height 0.7 :face 'all-the-icons-green))
       "Update"
       "Update emacs"
       (lambda (&rest _) (auto-package-update-now)))
      (,(and (display-graphic-p)
             (all-the-icons-material "autorenew" :height 0.7 :face 'all-the-icons-yellow))
       "Restart"
       "Restar emacs"
       (lambda (&rest _) (restart-emacs))))))
  (dashboard-set-footer t)
  (dashboard-footer-messages (list (format "Powered by JesusMtnez, %s" (format-time-string "%Y"))))
  (dashboard-footer-icon (cond ((display-graphic-p)
                                (all-the-icons-faicon "code" :height 1  :face 'all-the-icons-red))
                               (t (propertize ">" 'face 'font-lock-doc-face))))
  :config
  ;; (defun dashboard-load-packages (list-size)
  ;;   (insert (make-string (ceiling (max 0 (- dashboard-banner-length 38)) 2) ? )
  ;;           (format "[%d packages loaded in %s]" (length package-activated-list) (emacs-init-time))))

  ;; (add-to-list 'dashboard-item-generators '(packages . dashboard-load-packages))

  (setq dashboard-items '((projects . 20)
                          (recents . 15)))
  (dashboard-setup-startup-hook))

(use-package scroll-bar
  :ensure nil
  :config (scroll-bar-mode -1))

(use-package menu-bar
  :ensure nil
  :bind ("C-x C-k" . kill-this-buffer)
  :config (menu-bar-mode -1))

(use-package tool-bar
  :ensure nil
  :config (tool-bar-mode -1))

(use-package whitespace
  :diminish global-whitespace-mode
  :hook (after-init . global-whitespace-mode)
  :custom
  (whitespace-style '(face tabs trailing)))

(use-package rainbow-mode)

(use-package rainbow-delimiters
  :hook (prog-mode . rainbow-delimiters-mode))

(use-package display-line-numbers
  :hook ((prog-mode text-mode) . display-line-numbers-mode))

;; (use-package zoom-window
;;   :bind (("C-x C-z" . zoom-window-zoom))
;;   :custom
;;   (zoom-window-mode-line-color "DarkRed" "Modeline color when enabled"))

(use-package ace-window
  :defer 3
  :bind (("M-o" . ace-window))
  :custom
  (aw-dispatch-always t "Issue read-char even for one window")
  (ace-window-display-mode t)
  :config
  (push " *NeoTree*" aw-ignored-buffers)
  (push "*which-key*" aw-ignored-buffers))

(add-hook 'after-init-hook
          (lambda ()
            (when (member "FuraCode Nerd Font" (font-family-list))
              (set-face-attribute 'default nil :font "FuraCode Nerd Font 9"))))

(use-package fira-code-mode
  :when (display-graphic-p)
  :hook (after-init . global-fira-code-mode))

(provide '20-core-ui)
;;; 20-core-ui.el ends here
