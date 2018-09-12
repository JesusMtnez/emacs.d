;;; 60-core-projects.el --- projects integration
;; Repositories:
;;  - `projectile`: https://github.com/bbatsov/projectile
;;  - `helm-projectile`: https://github.com/bbatsov/helm-projectile

(use-package projectile
  :demand
  :bind-keymap ("C-c p" . projectile-command-map)
  :config
  (setq projectile-enable-caching nil
        projectile-indexing-method 'alien
        projectile-cache-file (concat cache-dir "projectile.cache")
        projectile-known-projects-file (concat cache-dir "projectile.projects")
        projectile-project-root-files '(".git" ".project" "setup.py" "build.sbt" "pom.xml")
        projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o" ".class")
        projectile-globally-ignored-files '(".DS_Store" "Icon")))
  (projectile-mode)

(use-package helm-projectile
  :hook (projectile-mode . helm-projectile-on))

(use-package neotree
  :commands neo-global--window-exists-p
  :bind ("<f8>" . neotree-toggle)
  :config
  (setq neo-theme (if (display-graphic-p) 'icons 'nerd)
        neo-window-width 40
        neo-create-file-auto-open t
        neo-show-updir-line nil
        neo-mode-line-type 'neotree
        neo-smart-open t
        neo-show-hidden-files t))

(provide '60-core-projects)
;;; 60-core-projects.el ends here
