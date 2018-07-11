;;; 50-core-company.el --- company integration

(use-package company
  :demand
  :hook (after-init . global-company-mode)
  :config
  (progn
    (setq company-idle-delay 0.1
          company-minimum-prefix-length 1
          company-show-numbers t))
  :diminish (company-mode . "CM"))

(use-package helm-company
  :after (company helm)
  :bind (:map company-active-map
              ("C-/" . helm-company)))

(provide '50-core-company)
;;; 50-core-company.el ends here
