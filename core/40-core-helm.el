;;; 40-core-helm.el --- helm integration
;; TODO Integrate with https://github.com/emacs-helm/helm-ls-git

(use-package helm
  :bind (("C-c h"   . helm-command-prefix)
         ("C-x C-f" . helm-find-files)
         ("C-x b"   . helm-buffers-list)
         ("M-x"     . helm-M-x)
         ("M-y"     . helm-show-kill-ring)
         :map helm-map
         ("TAB" . helm-execute-persistent-action)
         ("C-i" . helm-execute-persistent-action)
         ("C-z" . helm-select-action))
  :custom
  (helm-split-window-in-side-p t)
  (helm-move-to-line-cycle-in-source t)
  (helm-ff-search-library-in-sexp t)
  (helm-scroll-amount 8)
  (helm-ff-file-name-history-use-recentf t)
  (helm-autoresize-mode t)
  (helm-autoresize-max-height 20)
  (helm-mode-fuzzy-match t)
  (helm-buffers-fuzzy-matching t)
  (helm-recentf-fuzzy-match t)
  (helm-completion-in-region-fuzzy-match t)
  (helm-M-x-fuzzy-match t)
  :config
  (require 'helm-config)
  (helm-mode t)
  :diminish helm-mode)

(use-package swiper-helm
  :bind (("C-s" . swiper-helm)
         ("C-r" . swiper-helm)))

(provide '40-core-helm)
;;; 40-core-helm.el ends here
