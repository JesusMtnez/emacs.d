;;; module-text.el --- Text manipulation extras

(use-package move-text
  ; repo: https://github.com/emacsfodder/move-text
  :ensure t
  :defer t
  :bind (("M-p" . move-text-up)
         ("M-n" . move-text-down)))

(provide 'module-text)
;;; module-text.el ends here
