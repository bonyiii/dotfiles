;;; package --- Summary
;;; Commentary:
;; https://github.com/glynnforrest/emacs.d/blob/master/site-lisp/setup-web-mode.el

;;; Code:
(use-package web-mode
  :mode (
	 ".js$"
	 ".ts$"
	 ".vue$"
	 ".jsx$"
	 ".s?css$"
	 ".erb$"
	 )
  :init
  (add-hook 'prog-mode-hook (lambda () (flycheck-mode) (company-mode) (whitespace-mode)))
  :hook(
	;; This is the magic connecting the derived mode with lsp.
	;; Actually do we need derived mode at all, in this case?
	(web-react-mode . tide-setup))
  :config
  (setq
   web-mode-markup-indent-offset 2
   web-mode-css-indent-offset 2
   web-mode-code-indent-offset 2
   web-mode-style-padding 0
   web-mode-script-padding 0

   web-mode-enable-auto-closing t
   web-mode-enable-auto-opening t
   web-mode-enable-auto-pairing t
   web-mode-enable-auto-indentation t

   web-mode-enable-css-colorization t
   web-mode-enable-current-column-highlight t
   web-mode-enable-current-element-highlight t)

  ;; Let smartparens handle auto closing brackets, e.g. {{ }} or {% %}
  ;; https://github.com/hlissner/doom-emacs/blob/develop/modules/lang/web/%2Bhtml.el#L56
  (dolist (alist web-mode-engines-auto-pairs)
    (setcdr alist
            (cl-loop for pair in (cdr alist)
                     unless (string-match-p "^[a-z-]" (cdr pair))
                     collect (cons (car pair)
                                   (string-trim-right (cdr pair)
                                                      "\\(?:>\\|]\\|}\\)+\\'")))))
  )


(define-derived-mode web-react-mode web-mode "web-react"
  "A major mode derived from web-mode, for editing .ts .tsx .js .jsx files with LSP support.")
(add-to-list 'auto-mode-alist '("\\.ts\\'" . web-react-mode))
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-react-mode))
(add-to-list 'auto-mode-alist '("\\.js$" . web-react-mode))
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-react-mode))


;; Or alternatively tide mode
;; https://willschenk.com/articles/2021/setting_up_emacs_for_typescript_development/

(provide 'init-web-mode)
;;; init-web-mode.el ends here
