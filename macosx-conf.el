;; Mac OSX special configurations

; left-cmd-key as meta-key
(setq mac-command-modifier 'meta)
; left-option-key as meta-key
(setq mac-option-modifier 'meta)
; right-option-key as option-key
(setq mac-right-option-modifier nil)

; GUI only settings
(when window-system
  (menu-bar-mode t) ; Restore menu-bar to fix: https://github.com/railwaycat/emacs-mac-port/issues/79
  (setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin")) ; Add brew path in PATH
  (setq exec-path (append exec-path '("/usr/local/bin"))) ; Add brew bin in ExecPath
)
