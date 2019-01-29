;;; 60-core-projects.el --- projects integration

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

(use-package helm-projectile
  :hook (projectile-mode . helm-projectile-on))

(use-package neotree
  :functions (neotree-resize-window neotree-project-dir)
  :commands neotree-project-dir
  :hook ((neo-enter . neotree-resize-window))
  :bind ("<f8>" . 'neotree-project-dir)
  :config

  (defun neotree-resize-window (&rest _args)
    "Resize neotree window."
    (neo-global--when-window
      (let ((fit-window-to-buffer-horizontally t))
        (neo-buffer--unlock-width)
        (fit-window-to-buffer)
        (neo-buffer--lock-width))))

  (defun neotree-project-dir ()
    "Open NeoTree using the git root."
    (interactive)
    (let ((project-dir (projectile-project-root))
          (file-name (buffer-file-name)))
      (neotree-toggle)
      (if project-dir
          (if (neo-global--window-exists-p)
              (progn
                (neotree-dir project-dir)
                (neotree-find file-name))))))

  (setq neo-theme (if (display-graphic-p) 'icons 'nerd)
        neo-window-width 40
        neo-create-file-auto-open t
        neo-show-updir-line nil
        neo-mode-line-type 'neotree
        neo-smart-open t
        neo-autorefresh t
        neo-auto-indent-point t
        neo-show-hidden-files t
        neo-window-fixed-size nil))

(provide '60-core-projects)
;;; 60-core-projects.el ends here
