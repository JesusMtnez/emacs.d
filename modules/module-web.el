;;; module-web.el --- web integration

(use-package web-mode
  :mode ("\\.html?\\'" "\\.css?\\'")
  :custom
  (web-mode-code-indent-offset 2)
  (web-mode-css-indent-offset 2)
  (web-mode-markup-indent-offset 2)
  (web-mode-script-padding 2)
  (web-mode-enable-auto-pairing t)
  (web-mode-enable-current-element-highlight t)
  (web-mode-enable-current-column-highlight t)
  :custom-face
  (web-mode-html-tag-bracket-face ((nil (:foreground "Snow3"))))
  (web-mode-current-element-highlight-face ((nil (:background "#073642")))))

(use-package emmet-mode
  :after (web-mode)
  :hook (web-mode . emmet-mode))

(provide 'module-web)
;;; module-web.el ends here
