;;; module-docker.el --- docker integration
;; TODO Check https://github.com/Silex/docker.el

(use-package dockerfile-mode
  :mode (("\\.dockerfile" . dockerfile-mode)
         ("Dockerfile\\'" . dockerfile-mode)))

(provide 'module-docker)
;;; module-docker.el ends here
