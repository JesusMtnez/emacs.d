;;; module-undo.el --- undo-tree integration

(use-package undo-tree
  ; repo: https://github.com/emacsmirror/undo-tree
  :bind (("C-z" . undo-tree-undo)
         ("C-S-z" . undo-tree-redo))
  :init
  (global-undo-tree-mode t)
  (setq undo-tree-visualizer-timestamps t
        undo-tree-visualizer-diff t)
  :diminish undo-tree-mode)

(provide 'module-undo)
;;; module-undo.el ends here
