(use-package lsp-mode
  :commands (lsp lsp-deferred)
  :hook (
	 (lsp-mode . lsp-enable-which-key-integration))
  :init
  (setq lsp-keymap-prefix "C-c l")
  :config
  (lsp-enable-which-key-integration t)
  (setq gc-cons-threshold (* 100 1024 1024)
	read-process-output-max (* 1024 1024)
	treemacs-space-between-root-nodes nil
	lsp-idle-delay 0.1)  ;; clangd is fast
  )

(use-package lsp-ui :commands ls-ui-mode)
(use-package helm-lsp :commands helm-lsp-worspace-symbol)

(provide 'init-lsp)
