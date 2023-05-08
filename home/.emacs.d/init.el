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
;;(Load-File Custom-File)

(load "~/.emacs.d/init.d/transpose-frame.el")
(load "~/.emacs.d/init.d/highlight-global.el")
;; https://github.com/glen-dai/highlight-global config
(global-set-key (kbd "M-+") 'highlight-frame-toggle)
(global-set-key (kbd "M--") 'clear-highlight-frame)


(require 'init-global)
(require 'init-whitespace)
(require 'init-company)
(require 'init-helm)

(require 'init-smartparens)
(require 'init-yasnippet)
(require 'init-which-key)
(require 'init-avy)
(require 'init-lsp)
(require 'init-tide)
(require 'init-flycheck)

;; Programming modes
(require 'init-web-mode)
(require 'init-ruby-mode)
;; (require 'init-editorconfig)
;; (require 'init-yaml)
;;; my-init.el ends here
