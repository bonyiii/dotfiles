(use-package ruby-mode
  :ensure t
  :mode (
	 "\\.rb\\'"
	 "Rakefile\\'"
	 "Gemfile\\'"
	 "Berksfile\\'"
	 "Vagrantfile\\'"
	 )
  :interpreter "ruby"

  :init
  (setq ruby-indent-level 2
        ruby-indent-tabs-mode nil)
  :hook(
	(ruby-mode . superword-mode)
	(ruby-mode . lsp-deferred))
  :bind
  (([(meta down)] . ruby-forward-sexp)
   ([(meta up)]   . ruby-backward-sexp)
   (("C-c C-e"    . ruby-send-region))))

(provide 'init-ruby-mode)
