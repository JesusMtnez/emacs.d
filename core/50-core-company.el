;;; 50-core-company.el --- company integration

(use-package company
  :diminish (company-mode . "CM")
  :hook (after-init . global-company-mode)
  :bind (("M-/" . company-complete))
  :custom
  (company-idle-delay nil)
  (company-show-numbers t)
  (company-dabbrev-downcase nil)
  (company-dabbrev-ignore-case t))

(unless (version< emacs-version "26.1")
  (use-package company-box
    :after (company)
    :hook (company-mode . company-box-mode)
    :custom
    (company-box-icons-alist 'company-box-icons-all-the-icons)))

(use-package company-quickhelp
  :after (company)
  :custom
  (company-quickhelp-delay 0.2)
  (company-quickhelp-mode t))

(use-package helm-company
  :after (company helm)
  :bind (:map company-active-map
              ("C-/" . helm-company)))

(provide '50-core-company)
;;; 50-core-company.el ends here
