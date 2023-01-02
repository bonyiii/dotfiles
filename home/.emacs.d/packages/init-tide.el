(use-package tide
  :ensure t
  :after (web-react-mode company flycheck)
  :hook ((web-react-mode . tide-setup)
         (web-react-mode . tide-hl-identifier-mode)
         (before-save . tide-format-before-save)))


(provide 'init-tide)
