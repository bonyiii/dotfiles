(use-package flycheck
  :ensure t
  :init (global-flycheck-mode)
  :config
  (flycheck-add-mode 'javascript-eslint 'web-react-mode))


(provide 'init-flycheck)
