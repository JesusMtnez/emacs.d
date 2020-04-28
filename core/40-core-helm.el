;;; 40-core-helm.el --- helm integration.    -*- lexical-binding: t -*-

(use-package helm
  :hook (after-init . helm-mode)
  :bind (("C-x C-f" . helm-find-files)
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
  (helm-mode t)
  :diminish helm-mode)

(use-package helm-swoop
  :after (helm)
  :bind (("C-s" . helm-swoop)
         ("C-r" . helm-swoop)
         :map helm-swoop-map
         ("C-r" . helm-previous-line)
         ("C-s" . helm-next-line))
  :custom
  (helm-swoop-use-fuzzy-match t))

(provide '40-core-helm)
;;; 40-core-helm.el ends here
