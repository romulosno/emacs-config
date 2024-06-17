;;; init.el -- emacs config . -*- lexical-binding: t; -*-
(when (< emacs-major-version 27) (package-initialize))

;;; GUI elements
(when (member "Hack" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Hack-10") t))
(add-to-list 'default-frame-alist '(background-color . "#f0efeb") t)
(add-to-list 'default-frame-alist '(foreground-color . "#000000") t)

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

;;;; Faces
(set-face-attribute 'fringe nil :background "#eae7e1")
(set-face-attribute 'mode-line nil :background "#e3dfd8")

;;; Better defaults
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq use-short-answers t)
(setq kill-whole-line t)
(setq delete-by-moving-to-trash t)
(setq disabled-command-function nil)
(setq repeat-exit-key "RET")
(setq visible-bell t)
(setq read-process-output-max (* 1024 1024))

;;;; Isearch
(setq isearch-lazy-count t
      isearch-allow-scroll 'unlimited
      isearch-yank-on-move 'shift
      isearch-allow-motion t
      isearch-motion-changes-direction nil)

;;;; Scroll
(setq mouse-wheel-progressive-speed nil
      mouse-wheel-follow-mouse 't
      scroll-step 1)
(setq view-read-only t)

;;;; Init screen
(setq inhibit-startup-screen t
      initial-scratch-message nil
      initial-major-mode 'text-mode)

;;;; Backups
(setq backup-directory-alist
      `(("" . ,(expand-file-name "backups" user-emacs-directory))))

(setq backup-by-copying t
      version-control t
      kept-old-versions 2
      kept-new-versions 5
      delete-old-versions t)

;;;; Completions
(add-to-list 'completion-styles 'flex t)

(setq-default abbrev-mode t)
(setq tab-always-indent 'complete)
(setq completions-max-height 15)
(setq completion-show-help nil)

;;;; Global
(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "C-c h") #'hl-line-mode)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c s") #'org-capture)
(global-set-key (kbd "C-c l") #'org-store-link)

(global-set-key (kbd "M-u") #'upcase-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-c") #'capitalize-dwim)

(global-set-key (kbd "C-c <left>") #'windmove-left)
(global-set-key (kbd "C-c <right>") #'windmove-right)
(global-set-key (kbd "C-c <up>") #'windmove-up)
(global-set-key (kbd "C-c <down>") #'windmove-down)

(repeat-mode 1)
(savehist-mode 1)
(save-place-mode 1)

;;; Outline
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)
(setq outline-minor-mode-prefix "\M-o")

(add-hook 'outline-minor-mode-hook
	  (lambda ()
	    (if outline-minor-mode
		(reveal-mode 1)
	      (reveal-mode -1))))

;;; Org Mode
(setq org-startup-indented t)
(setq org-use-speed-commands t)
(setq org-return-follows-link t)

;;;; Org Babel
(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

;;; Prog
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
(add-hook 'compilation-mode-hook #'rename-uniquely)

(add-hook 'prog-mode-hook (lambda ()
			    (electric-pair-local-mode)
			    (display-line-numbers-mode)))

;;;; Flymake
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c l") #'flymake-diagnostic-buffer)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

;;;; Java
(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4
                                  tab-width 4
                                  indent-tabs-mode t)))

;;;; JS
(setq js-indent-level 2)
(setq js-chain-indent t)

;;;; Eldoc
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;;; Eglot
(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(add-hook 'go-mode-hook #'eglot)
(add-hook 'java-mode-hook #'eglot-java-mode)

;;; Dired
(with-eval-after-load 'dired
  (require 'dired-aux)
  (require 'dired-x))

(setq dired-recursive-deletes 'always)

(add-hook 'dired-mode-hook
	  (lambda ()
	    (setq truncate-lines t)
	    (hl-line-mode)
	    (dired-isearch-filenames-mode)))

;;; Diff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq diff-font-lock-syntax nil)
(setq smerge-command-prefix "\e")
