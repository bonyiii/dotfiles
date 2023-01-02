;; store all backup and autosave files in the tmp dir

;;; Code:

;; Make sure emacs first frame starts up maximized
;; https://emacs.stackexchange.com/questions/2999/how-to-maximize-my-emacs-frame-on-start-up
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

;; Show line numbers
(global-display-line-numbers-mode t)
;; Disable line numbers for some modes
(dolist (mode '(org-mode-hook
		term-mode-hook
		shell-mode-hook
		eshell-mode-hook))
  (add-hook mode (lambda () (display-line-numbers-mode 0))))


;; Show cursor position (row, col) in brackets on the status line
(column-number-mode)


;; Make esc quit prompts
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)


;; store all backup and autosave files in the tmp dir
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))


;; Cursor
(setq blink-cursor-delay 1.0)
(setq blink-cursor-interval 0.75)
(blink-cursor-mode 1)
(setq-default cursor-in-non-selected-windows nil)


;; Automatically reload updated file
(global-auto-revert-mode 1)


;; Reload file under version control system
(setq auto-revert-check-vc-info t)


;; http://stackoverflow.com/questions/1230245/how-to-automatically-save-files-on-lose-focus-in-emacs
(defun save-all ()
  (interactive)
  (save-some-buffers t))

(add-hook 'focus-out-hook 'save-all)


;; Beep
(setq visible-bell t)
(setq ring-bell-function 'ignore)

;;(set-face-attribute 'default nil :font "Fira Code Retina" :height 280)


;; Scrolling
;; Taken from here: https://github.com/yusekiya/dotfiles/blob/master/.emacs.d/config/core_config.el
;; previously I only (setq scroll-conservatively 101)
(setq scroll-conservatively 35
      scroll-margin 3
      ;; scroll-step 1
      )
(setq comint-scroll-show-maximum-output t) ;; for shell-mode

(provide 'init-global)
