;; Configuration for Scala

;; ENSIME
(use-package ensime
  :ensure t
  :defer t
  :config (progn (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)))
