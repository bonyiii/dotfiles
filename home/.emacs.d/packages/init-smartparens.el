
(use-package smartparens
  :hook (prog-mode . smartparens-mode)
  :diminish smartparnes-mode
  :bind
  (:map smartparens-mode-map
	("C-M-f" . sp-forward-sexp)
	("C-M-b" . sp-backward-sexp)
	("C-M-a" . sp-backward-down-sexp)
	("C-M-e" . sp-up-sexp)
	("C-M-w" . sp-copy-sexp)
	("C-M-k" . sp-change-enclosing)
	("M-k" . sp-kill-sexp)
	("C-M-<backspace>" . sp-splice-sexp-killing-backward)
  	("C-S-<backspace>" . sp-splice-sexp-killing-around))
  :custom
  (sp-escape-quotes-after-insert nil)
  :config
  ;; Stop pairing single quotes in elisp
  (sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)
  (sp-local-pair 'org-mode "[" nil :actions nil))

(provide 'init-smartparens)
