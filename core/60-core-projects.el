;;; 60-core-projects.el --- projects integration

(use-package projectile
  ; repo: https://github.com/bbatsov/projectile
  :demand
  :init
  (setq projectile-enable-caching t
        projectile-indexing-method 'alien
        projectile-cache-file (concat cache-dir "projectile.cache")
        projectile-known-projects-file (concat cache-dir "projectile.projects")
        projectile-project-root-files '(".git" ".project" "setup.py" "build.sbt" "pom.xml")
        projectile-globally-ignored-file-suffixes '(".elc" ".pyc" ".o" ".class")
        projectile-globally-ignored-files '(".DS_Store" "Icon"))
  :config
  (projectile-global-mode))

(provide '60-core-projects)
;;; 60-core-projects.el ends here
