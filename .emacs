(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq delete-auto-save-files t)
(setq inhibit-startup-message t)


(fset 'insert-quote
   [C-left ?\" C-right ?\"])

(add-hook 'find-file-hook (lambda () (linum-mode)))

;; Lisp
;; M-x slime
(setq inferior-lisp-program "sbcl")



;;Python
;;(setq load-path (cons "/net/ens/renault/.emacs.d/" load-path))
;;(load "python-mode")
;;(global-set-key (kbd "C-c C-e") 'py-execute-region)


;;(require 'crypt++)

;; Indentation
(setq c-default-style "linux")
(setq c-basic-offset 2)


;;a comment
(show-paren-mode t) ;; show paren mode
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;;
(setq mouse-wheel-progressive-speed nil) ;;
(global-set-key "\M-\"" 'insert-quote)  
(global-set-key "\C-l" 'goto-line)
(global-set-key "\C-c\c" 'comment-region) 
(global-set-key (kbd "C-c u") 'uncomment-region) ;; uncomment region
(global-set-key (kbd "C-C i") 'indent-region) ;;indent
(transient-mark-mode t) ;; set region highlighted
(setq column-number-mode t) ;; column number
(setq line-number-mode t) ;; line number
(global-font-lock-mode t);; font lock mode
(setq font-lock-maximum-decoration t) ;; max decoration
(show-paren-mode t) ;; show parenthesis mode
(message "ok") ;; print ok
