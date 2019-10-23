;;; module-restclient.el --- restclient integration

(use-package restclient
  :mode ("\\.http$" . restclient-mode)
  :hook (restclient-mode . display-line-numbers-mode))

(use-package company-restclient
  :after (company restclient)
  :init
  (push 'company-restclient company-backends))

(provide 'module-restclient)
;;; module-resclient.el ends here
