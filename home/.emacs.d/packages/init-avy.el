(use-package avy
  :defer t
  :bind
  (("C-j" . avy-goto-char-timer))
  :custom
  (avy-timeout-seconds 0.3)
  (avy-style 'pre)
  :custom-face
  (avy-lead-face ((t (:background "#51afef" :foreground "#870000" :weight bold)))))


(provide 'init-avy)
