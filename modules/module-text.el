;;; module-text.el --- Text manipulation extras

(use-package move-text
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

(global-set-key (kbd "M-u") 'upcase-dwim)
(global-set-key (kbd "M-l") 'downcase-dwim)

(provide 'module-text)
;;; module-text.el ends here
