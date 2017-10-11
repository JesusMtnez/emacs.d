;;; module-ansible.el --- ansible integration

(use-package ansible
  ; repo: https://github.com/spotify/ansiblefile-mode
  :mode (("\\.ansiblefile" . ansiblefile-mode)
         ("Ansiblefile\\'" . ansiblefile-mode)))

(provide 'module-ansible)
;;; module-ansible.el ends here
