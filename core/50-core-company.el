;;; 50-core-company.el --- company integration
;; TODO Company integration with helm: https://github.com/yasuyk/helm-company

;; Company
(use-package company
  ; repo: https://github.com/company-mode/company-mode
  :demand
  :config (progn (add-hook 'after-init-hook 'global-company-mode)
                 (setq company-idle-delay 0.1)          ; Reduce company auto complete start time
                 (setq company-minimum-prefix-length 1) ; Reduce prefix to start completion
                 (setq company-show-numbers t))         ; Show number to quick access with M-number
  :diminish (company-mode . "CM"))

(provide '50-core-company)
;;; 50-core-company.el ends here
