(use-package whitespace
  :config
  ;;http://ergoemacs.org/emacs/whitespace-mode.html
  ;; The proper space sign was taken from here.
  ;; To get documentation type: C-h v whitespace-display-mappings
  ;; https://www.codetable.net/unicodecharacters
  (setq whitespace-display-mappings
	'((space-mark   ?\    [?\x20]     [?.])	; space
          (space-mark   ?\xA0 [?\xA4]     [?_])	; hard space
          (newline-mark 10   [?¬ ?\n] [?¬ ?\n])	; end-of-line
          )))

(provide 'init-whitespace)
