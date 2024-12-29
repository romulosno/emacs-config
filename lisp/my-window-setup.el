;;; my-window-setup.el --- Window setup configuration  -*- lexical-binding: t; -*-

(add-hook 'org-mode-hook
	  (lambda ()
	    (setq-local beginning-of-defun-function
			(lambda () (org-previous-visible-heading 1)))
	    (setq-local end-of-defun-function
			(lambda () (org-next-visible-heading 1)))))

(add-hook 'diff-mode-hook
            (lambda ()
              (setq-local beginning-of-defun-function #'diff-beginning-of-hunk)
              (setq-local end-of-defun-function	#'diff-end-of-hunk)))

(add-hook 'outline-mode-hook
	  (lambda ()
	    (setq-local beginning-of-defun-function
			(lambda () (outline-previous-visible-heading 1)))
	    (setq-local end-of-defun-function
			(lambda () (outline-next-visible-heading 1)))))

(provide 'my-window-setup)
;;; my-window-setup.el ends here
