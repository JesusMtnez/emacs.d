;;; 30-core-modeline.el --- Modeline configuration

(use-package doom-modeline
  :pin melpa-stable
  :hook
  (after-init . doom-modeline-mode)
  :custom
  (doom-modeline-buffer-file-name-style 'relative-to-project)
  (doom-modeline-height 20)
  (doom-modeline-major-mode-color-icon t))

(provide '30-core-modeline)
;;; 30-core-modeline.el ends here
