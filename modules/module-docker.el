;;; module-docker.el --- docker integration
;; TODO Check https://github.com/Silex/docker.el

(use-package dockerfile-mode
  ; repo: https://github.com/spotify/dockerfile-mode
  :ensure t
  :defer t
  :mode (("\\.dockerfile" . dockerfile-mode)
         ("Dockerfile\\'" . dockerfile-mode)))

(provide 'module-docker)
;;; module-docker.el ends here
