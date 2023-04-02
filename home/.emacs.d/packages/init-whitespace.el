;; (use-package whitespace
;;   :config
;;   ;;http://ergoemacs.org/emacs/whitespace-mode.html
;;   ;; The proper space sign was taken from here.
;;   ;; To get documentation type: C-h v whitespace-display-mappings
;;   ;; https://www.codetable.net/unicodecharacters
;;   (setq whitespace-display-mappings
;; 	'((space-mark   ?\    [?\x20]     [?.])	; space
;;           (space-mark   ?\xA0 [?\xA4]     [?_])	; hard space
;;           (newline-mark 10   [?¬ ?\n] [?¬ ?\n])	; end-of-line
;;           )))

;; ;; Delete trailing whitespace on save
;; (defun nuke_traling ()
;;   (add-hook 'before-save-hook #'delete-trailing-whitespace nil t))
;; ;;(add-hook 'focus-out-hook #'nuke_traling)



;;; package --- Whitespace setup
;;; Commentary:
;;; Code:

(require 'whitespace)
(setq whitespace-style '(face tabs lines-tail trailing))
(setq whitespace-action '(cleanup))
(setq whitespace-display-mappings
      '((space-mark   ?\    [?\x20]     [?.]) ; space
        (space-mark   ?\xA0 [?\xA4]     [?_])     ; hard space
        (newline-mark 10   [?¬ ?\n] [?¬ ?\n])     ; end-of-line
        ))

(global-whitespace-mode t)


(provide 'init-whitespace)

