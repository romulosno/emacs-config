;;; init.el -- init config
(when (< emacs-major-version 27) (package-initialize))
(exec-path-from-shell-initialize)

;;; GUI elements
(when (member "Hack" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Hack-10") t))

(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(when (display-graphic-p)
  (load-theme 'modus-operandi t))

;;; Better defaults
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq-default truncate-lines t)
(setq use-short-answers t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq view-read-only t)
(setq read-process-output-max (* 1024 1024))

(setq backup-directory-alist
      `(("" . ,(expand-file-name "backups" user-emacs-directory))))

;;; Global keys
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c h") #'hl-line-mode)

(global-set-key (kbd "M-u") #'upcase-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-c") #'capitalize-dwim)

;;; Isearch
(setq isearch-lazy-count t)
(setq isearch-allow-scroll 'unlimited)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-motion t)
(setq isearch-motion-changes-direction nil)

;;; Init screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)

;;; Completions
(add-to-list 'completion-styles 'flex t)

(setq-default abbrev-mode t)
(setq save-abbrevs 'silently)

(setq tab-always-indent 'complete)
(setq completions-max-height 15)
(setq completion-show-help nil)

;;;; Repeat
(setq repeat-exit-key "RET")
(global-set-key (kbd "C-z") #'repeat)

;;; Winner
(setq winner-dont-bind-my-keys t)
(define-key ctl-x-x-map (kbd "<right>") #'winner-redo)
(define-key ctl-x-x-map (kbd "<left>") #'winner-undo)

;;; Windmove
(global-set-key (kbd "C-c <left>") #'windmove-left)
(global-set-key (kbd "C-c <right>") #'windmove-right)
(global-set-key (kbd "C-c <up>") #'windmove-up)
(global-set-key (kbd "C-c <down>") #'windmove-down)

;;; Outline
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)
(setq outline-minor-mode-prefix "\M-o")

(global-set-key (kbd "C-c o") #'outline-minor-mode)

;;; Org
(setq org-startup-indented t)
(setq org-use-speed-commands t)
(setq org-return-follows-link t)
(setq org-imenu-depth 7)
(setq org-fontify-done-headline nil)

;;;; Log
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;;;; Tags
(setq org-auto-align-tags nil)
(setq org-tags-column 0)

;;;; Refile
(setq org-refile-use-outline-path t)
(setq org-refile-allow-creating-parent-nodes t)

;;;; Org Babel
(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)
(setq org-src-window-setup 'current-window)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)))

;;;; Keybindings
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c s") #'org-capture)
(global-set-key (kbd "C-c l") #'org-store-link)

;;; Prog
(add-hook 'prog-mode-hook #'electric-indent-local-mode)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

;;;; Flymake
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c c l") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

;;;; Java
(add-hook 'java-mode-hook
	  (lambda ()
	    (setq-local c-basic-offset 4
			tab-width 4
			indent-tabs-mode t)))

;;;; JS
(setq js-indent-level 2)
(setq js-chain-indent t)

;;;; Eldoc
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;;; Eglot
(setq eglot-sync-connect nil)
(setq eglot-autoshutdown t)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(add-hook 'go-mode-hook #'eglot-ensure)

;;; Dired
(with-eval-after-load 'dired
  (require 'dired-aux)
  (require 'dired-x))

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq delete-by-moving-to-trash t)
(setq dired-isearch-filenames 'dwim)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)

;;; VC
(setq smerge-command-prefix "\e")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;;; Global modes
(savehist-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(repeat-mode 1)
(winner-mode 1)
