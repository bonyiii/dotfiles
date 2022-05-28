;; Set up 'custom' system
(setq custom-file
      (expand-file-name "emacs-customizations.el" user-emacs-directory))
(load custom-file)

;; set up packages
(require 'package)
;;(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
;;                         ;;                         ("marmalade" . "https://marmalade-repo.org/packages/")
;;                                                  ("marmalade" . "https://ojab.ru/marmalade/")
;;                                                  ("melpa" . "https://melpa.org/packages/")))

(setq package-archives '(("org" . "https://orgmode.org/elpa/")
                         ("gnu" . "https://elpa.gnu.org/packages/")
                         ("melpa" . "https://melpa.org/packages/")
                         ("melpa-stable" . "https://stable.melpa.org/packages/")))

(package-initialize)
(setq ggp-required-packages
      (list
       'base16-theme
       'elixir-mode
       'dotenv-mode
       'helm-git-grep
       'helm-ag
       'helm-ls-git
       'company
       'company-web
       'helm-company
       'web-mode
       'magit
       'avy
       'tide
       'elscreen
       'which-key))

(add-to-list 'load-path
              "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet)
(yas-reload-all)

(dolist (package ggp-required-packages)
  (when (not (package-installed-p package))
    (package-refresh-contents)
    (package-install package)))

;; theme
(load-theme 'base16-monokai)

;; global modes
(which-key-mode t)
;;(cua-mode t)
(elscreen-start)

;; programming modes
(add-hook 'ggp-code-modes-hook
          (lambda ()
            (linum-mode 1)
            (whitespace-mode 1)
            (show-paren-mode 1)
            (company-mode 1)
            (yas-minor-mode 1)
            (add-to-list 'write-file-functions 'delete-trailing-whitespace 'check-parens)
            ))

;; elixir mode
(add-hook 'elixir-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

;; elisp mode
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

;; ruby mode
(add-hook 'ruby-mode-hook
          (lambda ()
            ;; (rubocop-mode 1)
            ;; (add-hook 'after-save-hook 'rubocop-autocorrect-current-file nil 'make-it-local)
            (flycheck-mode 1)
            (run-hooks 'ggp-code-modes-hook)))

(add-hook 'python-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (run-hooks 'ggp-code-modes-hook)))

;; C++ mode
(add-hook 'c++-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (run-hooks 'ggp-code-modes-hook)))


;; feature mode
(add-hook 'feature-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

(add-hook 'haml-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

(add-hook 'racket-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode 1)
            (eldoc-mode +1)
            (tide-hl-identifier-mode +1)
            (flycheck-add-mode 'typescript-tslint 'web-mode)
            (run-hooks 'ggp-code-modes-hook)))
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)


;; web mode
(add-to-list 'auto-mode-alist '("\\.js$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue$" . web-mode))
;; web mode React jsx templates
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.s?css$" . web-mode))
;; web mode elixir template
(add-to-list 'auto-mode-alist '("\\.eex$" . web-mode))
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

(add-hook 'web-mode-hook
          (lambda ()
            (setq web-mode-markup-indent-offset 2)
            (setq web-mode-css-indent-offset 2)
            (setq web-mode-code-indent-offset 2)
            (setq web-mode-enable-css-colorization t)
            (setq web-mode-enable-current-column-highlight t)
            (setq web-mode-enable-current-element-highlight t)
            (setq web-mode-style-padding 0)
            (setq web-mode-script-padding 0)
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (tide-mode-hook))
            (flycheck-mode 1)
            (jasminejs-mode 1)
            (set (make-local-variable 'company-backends) '(company-css company-web-html company-yasnippet company-files))
            (run-hooks 'ggp-code-modes-hook)))

(add-hook 'jasminejs-mode-hook (lambda () (jasminejs-add-snippets-to-yas-snippet-dirs)))

;; javascript mode
;;(add-hook 'js-mode-hook
;;          (lambda ()
;;            (run-hooks 'ggp-code-modes-hook)))

;; coffee mode
(setq coffee-tab-width 2)
(add-hook 'coffee-mode-hook
          (lambda ()
            (run-hooks 'ggp-code-modes-hook)))

;; kotlin mode
(add-hook 'kotlin-mode-hook
          (lambda ()
            (flycheck-mode 1)
            (run-hooks 'ggp-code-modes-hook)))

;; keybinds
(global-set-key (kbd "C-6") 'company-complete)
(global-set-key (kbd "C-M-,") 'helm-browse-project)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
;; vim like word under cusror search
(global-set-key (kbd "C-#") 'isearch-forward-symbol-at-point)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;;(global-set-key (kbd "C-x <prior>") 'windmove-left)
;;(global-set-key (kbd "C-x <next>") 'windmove-right)

;; http://ergoemacs.org/emacs/whitespace-mode.html
(setq whitespace-display-mappings
      '((space-mark   ?\    [?\xB7]     [?.])	; space
        (space-mark   ?\xA0 [?\xA4]     [?_])	; hard space
        (newline-mark 10   [?¬ ?\n] [?¬ ?\n])	; end-of-line
        ))

;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; replace buffer-menu with ibuffer
(global-set-key (kbd "C-x C-b") #'ibuffer)
(global-set-key (kbd "C-c g") 'helm-git-grep)
;; Invoke `helm-git-grep' from isearch.
(define-key isearch-mode-map (kbd "C-c g") 'helm-git-grep-from-isearch)
;; Invoke `helm-git-grep' from other helm.
(eval-after-load 'helm
  '(define-key helm-map (kbd "C-c g") 'helm-git-grep-from-helm))
(custom-set-variables
 '(robe-completing-read-func 'helm-robe-completing-read))

;; Taken from https://github.com/avdi/.emacs24.d/blob/master/init.el
(setq abg-emacs-init-file (or load-file-name buffer-file-name))
(setq abg-emacs-config-dir
      (file-name-directory abg-emacs-init-file))
(setq abg-init-dir
      (expand-file-name "init.d" abg-emacs-config-dir))
;; Load all elisp files in ./init.d
(if (file-exists-p abg-init-dir)
    (dolist (file (directory-files abg-init-dir t "\\.el$"))
      (load file)))

;; https://github.com/glen-dai/highlight-global config
(global-set-key (kbd "M-+") 'highlight-frame-toggle)
(global-set-key (kbd "M--") 'clear-highlight-frame)
(global-unset-key (kbd "M-v"))
(global-set-key (kbd "M-c") 'scroll-down-command)

(require 'helm-etags+)
(global-set-key "\M-." 'helm-etags+-select)
(global-set-key "\M-*" 'helm-etags+-history-go-back)
;;       `M-.' default use symbol under point as tagname
;;       `C-uM-.' use pattern you typed as tagname


;; Reload files if they changed automatically
;; https://stackoverflow.com/questions/1480572/how-to-have-emacs-auto-refresh-all-buffers-when-files-have-changed-on-disk
(global-auto-revert-mode t)


;; AutoSave on focus loss
;; http://stackoverflow.com/questions/1230245/how-to-automatically-save-files-on-lose-focus-in-emacs
(defun save-all ()
  (interactive)
  (save-some-buffers t))
(add-hook 'focus-out-hook 'save-all)

;; http://www.flycheck.org/manual/latest/index.html
(require 'flycheck)

;; Add flycheck javascript-eslint checker to web mode
(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'web-mode))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; Avy shortcuts
(global-set-key (kbd "C-j") 'avy-goto-char-timer)

;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
  (if (equal web-mode-content-type "jsx")
      (let ((web-mode-enable-part-face nil))
        ad-do-it)
    ad-do-it))

;; https://emacs.stackexchange.com/questions/21205/flycheck-with-file-relative-eslint-executable
(defun my/use-eslint-from-node-modules ()
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint
          (and root
               (expand-file-name "node_modules/.bin/eslint"
                                 root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)


;; Source: http://www.emacswiki.org/emacs-en/download/misc-cmds.el
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer :ignore-auto :noconfirm))


(setq scroll-conservatively 101)
