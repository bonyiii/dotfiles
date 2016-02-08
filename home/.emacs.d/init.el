;; Set up 'custom' system
(setq custom-file
      (expand-file-name "emacs-customizations.el" user-emacs-directory))
(load custom-file)

;; set up packages
(require 'package)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("marmalade" . "https://marmalade-repo.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")))
(package-initialize)
(setq ggp-required-packages
      (list
       'alchemist
       'base16-theme
       'elixir-mode
       'robe
       'which-key))
(dolist (package ggp-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))

;; theme
(load-theme 'base16-monokai-dark)

;; global modes
(which-key-mode t)
(cua-mode t)

;; programming modes
(add-hook 'ggp-code-modes-hook
          (lambda ()
            (linum-mode 1)
            (company-mode 1)
            (whitespace-mode 1)
            (add-to-list 'write-file-functions 'delete-trailing-whitespace)))

;; elixir mode
(add-hook 'elixir-mode-hook
          (lambda ()
            (alchemist-mode 1)
            (run-hooks 'ggp-code-modes-hook)))

;; elisp mode
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

;; ruby mode
(add-hook 'ruby-mode-hook
          (lambda ()
            (robe-mode 1)
            (run-hooks 'ggp-code-modes-hook)))

;; keybinds
(global-set-key (kbd "C-/") 'company-complete)
(global-set-key (kbd "C-M-f") 'fiplr-find-file)
;;(global-set-key (kbd "C-x <prior>") 'windmove-left)
;;(global-set-key (kbd "C-x <next>") 'windmove-right)
 (setq whitespace-display-mappings
          '((space-mark   ?\    [?\xB7]     [?.])	; space
            (space-mark   ?\xA0 [?\xA4]     [?_])	; hard space
            (newline-mark ?\n   [?¬ ?\n] [?¬ ?\n])	; end-of-line
            ))

(setq fiplr-ignored-globs '((directories (".git" ".svn" "node_modules" "_build"))
                            (files ("*.jpg" "*.png" "*.zip" "*~"))))
