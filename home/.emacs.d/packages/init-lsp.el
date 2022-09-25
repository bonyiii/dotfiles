(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (
	 (lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t))

(use-package lsp-ui :commands ls-ui-mode)
(use-package helm-lsp :commands helm-lsp-worspace-symbol)

(provide 'init-lsp)
