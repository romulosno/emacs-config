;;; init.el --- emacs config -*- lexical-binding: t; -*-

;;; Packages
(unless package-archives
  (package-refresh-contents))

(let ((package-list '(dockerfile-mode
		      eglot
		      go-mode
		      kotlin-mode
		      yaml-mode
		      markdown-mode)))
  (dolist (p package-list)
    (unless (package-installed-p p)
      (package-install p))))

;;; Theme and font
(load-theme 'modus-operandi t)
(set-face-font 'default "Fira Code-10")

;;; Backups
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)

(setq backup-directory-alist `(("." . ,(locate-user-emacs-file "backups"))))
(setq tramp-backup-directory-alist backup-directory-alist)

;;; Autosave
(setq auto-save-list-file-prefix (locate-user-emacs-file "autosave/"))
(setq tramp-auto-save-directory (locate-user-emacs-file "tramp-autosave/"))

;;; Init screen
(setq initial-major-mode 'fundamental-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;;; Misc
(setq use-short-answers t)
(setq enable-recursive-minibuffers t)
(setq kill-whole-line t)
(setq view-read-only t)
(setq visible-bell t)
(setq read-minibuffer-restore-windows nil)
(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)
(setq find-file-visit-truename t)	

(put 'narrow-to-region 'disabled nil)

;;; Keybindings remap
(global-set-key [remap count-words-region] #'count-words)
(global-set-key [remap capitalize-word] #'capitalize-dwim)
(global-set-key [remap downcase-word] #'downcase-dwim)
(global-set-key [remap upcase-word] #'upcase-dwim)
(global-set-key [remap list-buffers] #'electric-buffer-list)

;; Other keys
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-z") #'repeat)

;;; Isearch
(setq isearch-lazy-count t)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-scroll t)
(setq isearch-lazy-highlight 'all-windows)

;;; Completions
(setq tab-always-indent 'complete)
(setq completion-show-help nil)
(setq completions-header-format nil)
(setq completion-styles '(basic partial-completion emacs22 substring initials))

(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)
(define-key completion-in-region-mode-map (kbd "C-s") #'search-in-completions)

(defun search-in-completions ()
  (interactive)
  (switch-to-completions)
  (beginning-of-buffer)
  (isearch-forward))

;;; Abbrev
(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs 'silently)
(setq abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

;;; Dired
(require 'dired-aux)
(require 'dired-x)
(require 'ls-lisp)

(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(setq delete-by-moving-to-trash t)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)

(global-set-key (kbd "C-c f") #'find-name-dired)

;;; Org
(setq org-tags-column 0)
(setq org-use-speed-commands t)
(setq org-export-with-sub-superscripts nil)
(setq org-return-follows-link t)
(setq org-startup-folded nil)
(setq org-startup-indented t)
(setq org-agenda-show-log t)

(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-goto-interface 'outline-path-completion)
(setq org-goto-max-level 10)

(put 'org-todo-keyword-faces 'safe-local-variable #'stringp)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c l") #'org-store-link)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))

;;; Version Control
(setq vc-git-show-stash 0)
(setq vc-follow-symlinks t)
(setq vc-git-print-log-follow t)
(setq vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

;;; Code
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(global-set-key (kbd "<f5>") #'compile)

(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)
(setq compilation-auto-jump-to-first-error 'if-location-known)
(setq compilation-ask-about-save nil)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;; Eglot
(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 500000))
(setq read-process-output-max (* 3 1024 1024))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

;;; Flymake
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "<f7>") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "<f8>") #'flymake-goto-prev-error))

;;; Global modes
(column-number-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(winner-mode 1)
(minibuffer-depth-indicate-mode 1)
(savehist-mode 1)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(defun fit-window-to-buffer-max-fifth-frame (&optional window)
  "Fit WINDOW to buffer size, but max height is 20% of the frame height."
  (interactive)
  (let ((window (or window (selected-window)))
        (max-height (/ (frame-height) 5)))
    (fit-window-to-buffer window max-height)))

(defun display-completion-buffer (buffer actions)
  "Display completion buffer."
  (if (minibuffer-window-active-p (selected-window))
      (display-buffer-in-direction buffer actions)
    (display-buffer-below-selected buffer actions)))

(defun customize-frame-create ()
  (make-frame '((top . 0.5)
		(left . 0.5)
		(name . "Customize")
		(width . 80)
		(height . 30)
		(auto-hide-function . delete-frame)
		(unsplittable . t))))

(defun display-buffer-customize-frame (buffer actions)
  "Display completion buffer."
  (let ((frame (select-frame (or (cdr (assoc-string "Customize" (make-frame-names-alist)))
				 (customize-frame-create)))))
    (with-selected-frame frame
      (with-selected-window (selected-window)
	(display-buffer-same-window buffer actions)
	(set-window-dedicated-p (selected-window) t)))))

(setq switch-to-buffer-obey-display-actions t)
(setq split-width-threshold nil)

(setq display-buffer-alist
      '(("\\*Completions\\*"
	 (display-completion-buffer)
	 (dedicated . t)
	 (direction . down)
	 (window . root)
	 (window-height . fit-window-to-buffer-max-fifth-frame))

	("\\*\\(Flymake\\|Buffer List\\)"
	 display-buffer-in-side-window
         (side . bottom)
	 (slot . -1)
	 (window-height . 15)
	 (dedicated . t)
	 (preserve-size . (t . nil))
	 (body-function . select-window))

	("\\*Customize*"
	 display-buffer-customize-frame)))

;;; Custom
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)
