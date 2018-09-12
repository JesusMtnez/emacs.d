;;; 50-core-company.el --- company integration

(use-package company
  :demand
  :hook (after-init . global-company-mode)
  :bind (("M-/" . company-complete))
  :config
  (progn
    (setq company-idle-delay nil
          company-show-numbers t))
  :diminish (company-mode . "CM"))

(use-package helm-company
  :after (company helm)
  :bind (:map company-active-map
              ("C-/" . helm-company)))

(provide '50-core-company)
;;; 50-core-company.el ends here
