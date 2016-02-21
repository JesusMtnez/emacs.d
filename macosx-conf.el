;; Mac OSX special configurations

(setq mac-command-modifier 'meta) ; left-cmd-key as meta-key
(setq mac-option-modifier 'meta) ; left-option-key as meta-key
(setq mac-right-option-modifier nil) ; right-option-key as option-key
(when window-system
  (menu-bar-mode t)) ; Restore menu-bar to fix: https://github.com/railwaycat/emacs-mac-port/issues/79
