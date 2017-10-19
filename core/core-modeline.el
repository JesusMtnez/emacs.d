;;; core-modeline.el --- Modeline configuration

;; Powerline
(use-package powerline
  ; repo: https://github.com/milkypostman/powerline
  :demand
  :config
  (powerline-default-theme)
  (setq ns-use-srgb-colorspace t)
  (add-hook 'after-init-hook 'powerline-reset))

(provide 'core-modeline)
;;; core-modeline.el ends here
