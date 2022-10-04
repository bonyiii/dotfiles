(setq inhibit-startup-message t)


;;(scroll-bar-mode -1) ; Disable visible scrollbar
;;(tool-bar-mode -1) ; Disable the toolbar
(tooltip-mode -1) ; Disable tooltips
;;(set-fringe-mode 10) ; Give some breathing room
;;(menu-bar-mode -1) ; Disable the menu bar

;; Initialize package sources
(require 'package)
(setq package-archives '(("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))

(package-initialize)
(unless package-archive-contents
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)

;; The last 't' means true and it won't ask for confirmation when theme loaded
;; same as what is being used in (use-package doom-themes ...
;;(load-theme 'doom-dracula t)
(load-theme 'wombat)

;; LoadPath
(defun update-to-load-path (folder)
  "Update FOLDER and its subdirectories to `load-path'."
  (let ((base folder))
    (unless (member base load-path)
      (add-to-list 'load-path base))
    (dolist (f (directory-files base))
      (let ((name (concat base "/" f)))
        (when (and (file-directory-p name)
                   (not (equal f ".."))
                   (not (equal f ".")))
          (unless (member base load-path)
            (add-to-list 'load-path name)))))))

(update-to-load-path (expand-file-name "packages" user-emacs-directory))
;;(update-to-load-path (expand-file-name "packages" "~/.emacs.d/")

;; Do not use `init.el` for `custom-*` code - use `custom-file.el`.
(setq custom-file "~/.emacs.d/custom-file.el")

;; Assuming that the code in custom-file is execute before the code
;; ahead of this line is not a safe assumption. So load this file
;; proactively.
;;(load-file custom-file)

(require 'init-global)
(require 'init-whitespace)
(require 'init-company)
(require 'init-helm)
(require 'init-flycheck)
(require 'init-smartparens)
(require 'init-yasnippet)
(require 'init-which-key)
(require 'init-avy)
(require 'init-lsp)

;; Programming modes
(require 'init-web-mode)
(require 'init-ruby-mode)
(require 'init-editorconfig)
;;; my-init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(delete-selection-mode nil)
 '(package-selected-packages
   '(flycheck-popup-tip helm-lsp lsp-ui lsp-mode smartparens flycheck-posframe yasnippet which-key web-mode use-package tide smart-tab slime robe racket-mode nand2tetris magit kotlin-mode jasminejs-mode init-loader helm-ls-git helm-git-grep helm-company helm-ag haml-mode gnu-elpa-keyring-update flycheck-kotlin f elscreen elixir-mode eglot dotenv-mode company-web company-tabnine coffee-mode cider base16-theme avy ag)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(avy-lead-face ((t (:background "#51afef" :foreground "#870000" :weight bold))))
 '(flycheck-posframe-face ((t (:foreground "Green1"))))
 '(flycheck-posframe-info-face ((t (:foreground "Green1")))))
