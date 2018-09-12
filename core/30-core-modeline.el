;;; 30-core-modeline.el --- Modeline configuration

;; Powerline
(use-package powerline
  :demand
  :config
  (powerline-default-theme)
  (setq ns-use-srgb-colorspace t)
  (add-hook 'after-init-hook 'powerline-reset))

(provide '30-core-modeline)
;;; 30-core-modeline.el ends here
