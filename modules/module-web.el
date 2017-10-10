;;; module-web.el --- web integration

(use-package web-mode
  ; repo: https://github.com/fxbois/web-mode
  :mode ("\\.html?\\'" "\\.css?\\'")
  :config
  (setq web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2
        web-mode-markup-indent-offset 2
        web-mode-script-padding 2
        web-mode-enable-auto-pairing t
        web-mode-enable-current-element-highlight t
        web-mode-enable-current-column-highlight t)
  (set-face-attribute 'web-mode-html-tag-bracket-face nil :foreground "Snow3")
  (set-face-attribute 'web-mode-current-element-highlight-face nil :background "#073642")

  (use-package emmet-mode
    ; repo: https://github.com/smihica/emmet-mode
    :config
    (add-hook 'web-mode-hook 'emmet-mode)))

(provide 'module-web)
;;; module-web.el ends here
