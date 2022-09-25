(use-package helm
  :ensure t
  :demand
  :bind(("M-x" . helm-M-x)
	;;("C-x C-f" . helm-find-files)
	("C-x b" . helm-buffers-list)
	("M-," . helm-browse-project)
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
  :preface (require 'helm-config)
  :config (helm-mode 1))

(use-package helm-ag
  :defer t
  :bind(
	("M-]" . helm-ag-project-root)
	("C-x s" . helm-ag-project-root)))

(provide 'init-helm)
