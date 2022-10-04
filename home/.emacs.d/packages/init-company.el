(use-package company
;;  :bind (:map company-active-map
;;              ("C-n" . company-select-next)
;;             ("C-p" . company-select-previous))
  :config
  (setq
   company-idle-delay 0.1
   company-minimum-prefix-length 1))

(provide 'init-company)
