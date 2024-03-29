(use-package helm
  :ensure t
  :demand
  :bind(("M-x" . helm-M-x)
	;;("C-x C-f" . helm-find-files)
	("C-x b" . helm-buffers-list)
	("C-M-," . helm-ls-git-ls)
	("M-]" . helm-ls-git-ls)
	("M-y" . helm-show-kill-ring)
	("C-x c o" . helm-occur)
	("C-x r b" . helm-filtered-bookmarks)

	;; Taken from the below two pages
	;; on TAB it describes the function in helm-M-x and maybe in other places which I have to discover
	;; https://github.com/yusekiya/dotfiles/blob/master/.emacs.d/config/packages/my-helm-config.el
	;; https://github.com/jwiegley/use-package#binding-within-local-keymaps
	:map helm-map
	("TAB" . helm-execute-persistent-action)
	)

  :config (helm-mode 1))

(use-package helm-ag
  :defer t
  :bind(
	("C-x s" . helm-ag-project-root)))

(provide 'init-helm)
