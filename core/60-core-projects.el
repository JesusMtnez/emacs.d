;;; 60-core-projects.el --- projects integration
;; Repositories:
;;  - `projectile`: https://github.com/bbatsov/projectile
;;  - `helm-projectile`: https://github.com/bbatsov/helm-projectile

(use-package projectile
  :demand
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

(provide '60-core-projects)
;;; 60-core-projects.el ends here
