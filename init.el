;;; init.el --- Emacs config -*- lexical-binding: t; -*-
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
						 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
						 ("melpa" . "https://melpa.org/packages/")))

(setq my-packages
	  '(dockerfile-mode
		exec-path-from-shell
		go-mode
		markdown-mode
		yaml-mode))

(dolist (pac my-packages)
  (unless (package-installed-p pac)
	(package-install pac)))

;; Themes
(load-theme 'rom-day t)
(load-theme 'rom-night t t)

;; Init screen
(setq initial-major-mode 'fundamental-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; Mode line
(setq-default mode-line-format
			  `("%e"
				mode-line-front-space
				(:propertize ("" mode-line-mule-info mode-line-modified)
							 display (min-width (6.0)))
				" " mode-line-buffer-identification
				" " mode-line-modes
				,(when (boundp 'mode-line-format-right-align)
				   'mode-line-format-right-align)
				(project-mode-line project-mode-line-format)
				(vc-mode vc-mode)
				"  "
				mode-line-misc-info
				"[L:%l/C:%c] "
				mode-line-percent-position " "
				mode-line-end-spaces " "))

;; Indentation
(setq-default tab-width 4)
(setq c-basic-offset 2)
(setq js-indent-level 2)

;; Resize
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)
(setq window-combination-resize t)

;; Short answers
(fset 'yes-or-no-p 'y-or-n-p)
(setq use-short-answers t)

;; Misc
(setq echo-keystrokes 0.02)
(setq kill-whole-line t)
(setq view-read-only t)
(setq ring-bell-function 'ignore)
(setq set-mark-command-repeat-pop t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq sentence-end-double-space nil)
(setq delete-by-moving-to-trash t)
(setq save-interprogram-paste-before-kill t)
(setq require-final-newline t)
(setq reb-re-syntax 'string)
(setq ffap-machine-p-known 'reject)
(setq disabled-command-function nil)

;; Split
(setq split-height-threshold nil)
(setq split-width-threshold 100)

;; Help
(setq help-window-select t)

(add-hook 'help-mode #'visual-line-mode)

(defun display-buffer-from-help-p (&rest _)
  "Check if current buffer is a Help buffer."
  (unless current-prefix-arg
	(with-current-buffer (window-buffer)
	  (derived-mode-p '(help-mode)))))

(add-to-list 'display-buffer-alist
			 '(display-buffer-from-help-p
			   display-buffer-same-window
			   (inhibit-same-window . nil)
			   (window-height . nil)))

;; Uniquify buffer name
(setq uniquify-buffer-name-style 'forward)
(setq uniquify-after-kill-buffer-p t)

;; Backups and Autosave
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq kept-old-versions 4)
(setq kept-new-versions 4)
(setq version-control t)
(setq vc-make-backup-files t)

(let ((backup-dir (expand-file-name "backups/" user-emacs-directory))
      (auto-save-dir (expand-file-name "auto-save/" user-emacs-directory))
      (tramp-dir (expand-file-name "tramp-auto-save/" user-emacs-directory)))

  (dolist (dir (list backup-dir auto-save-dir tramp-dir))
    (unless (file-exists-p dir)
      (make-directory dir t)))

  (setq backup-directory-alist
        `((,tramp-file-name-regexp . ,temporary-file-directory)
          (".*" . ,backup-dir)))
  (setq auto-save-file-name-transforms `((".*" ,auto-save-dir t)))
  (setq tramp-auto-save-directory tramp-dir))

(save-place-mode 1)

;; Grep/Occur buffers
(setq grep-save-buffers nil)
(add-to-list 'display-buffer-alist
			 `(,(rx bos "*"
					(or "grep" "Occur")
					"*" eos)
			   display-buffer-in-side-window
			   (side . bottom)
			   (window-height . 10)
			   (body-function . select-window)))

(dolist (hook '(occur-mode-hook grep-mode-hook))
  (add-hook hook (lambda () (setq truncate-lines t))))

;; Isearch
(setq isearch-lazy-count t)
(setq isearch-allow-scroll t)
(setq isearch-yank-on-move 'shift)
(setq isearch-lazy-highlight 'all-windows)
(setq search-upper-case t)

;; Imenu
(setq imenu-flatten 'prefix)
(setq imenu-auto-rescan t)

;; Scroll
(setq scroll-preserve-screen-position t)
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 1)

(setq hscroll-margin 2)
(setq hscroll-step 1)

;; Window divider
(setq window-divider-default-bottom-width 0)
(setq window-divider-default-places t)
(setq window-divider-default-right-width 1)
(window-divider-mode 1)

;; Recent files
(setq recentf-max-menu-items 25)
(setq recentf-exclude `("~$"
						"/#[^/]*#\\'"
						,(regexp-quote (expand-file-name data-directory))))

(when (boundp 'data-directory)
  (add-to-list 'recentf-exclude (regexp-quote (expand-file-name lisp-directory)) t))

(recentf-mode 1)
(global-set-key (kbd "C-c r") #'recentf-open-files)

;; Buffer menu
(define-key Buffer-menu-mode-map (kbd "q") #'kill-buffer-and-window)
(define-key Buffer-menu-mode-map (kbd "O") #'Buffer-menu-multi-occur)

(advice-add 'Buffer-menu-other-window :after
			(lambda (&rest _) (select-window (get-buffer-window "*Buffer List*"))))

(add-to-list 'display-buffer-alist
			 '("\\*Buffer List\\*"
			   display-buffer-same-window
			   (inhibit-same-window . nil)))

;;; Performance
(setq read-process-output-max (* 3 1024 1024))

;; JIT
(defun optimize-large-files ()
  "Optimize jit configs for large files."
  (when (> (buffer-size) (* 2 1024 1024))
	(setq-local jit-lock-defer-time 0.1)
	(setq-local jit-lock-stealth-time 0.1)))

(add-hook 'find-file-hook #'optimize-large-files)

(setq jit-lock-chunk-size 3500)
(setq font-lock-maximum-decoration '((c-mode . 2) (c++-mode . 2) (t . t)))
(setq redisplay-skip-fontification-on-input t)

;; Bidi
(setq-default bidi-paragraph-direction 'left-to-right)

;; Compilation
(setq compilation-ask-about-save nil)
(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)

(global-set-key (kbd "<f5>") #'compile)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(add-to-list 'display-buffer-alist
			 `(,(rx bos "*"
					(or "compilation")
					"*" eos)
			   display-buffer-in-side-window
			   (side . bottom)
			   (window-height . 10)))

;; Prog
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

(setq tags-revert-without-query t)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 0))
(setq eglot-ignored-server-capabilities '(:hoverProvider :documentHighlightProvider))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

;; Flymake
(setq flymake-mode-line-lighter nil)

(defun flymake-diagnostics-window (window)
  "Return WINDOW if it show a flymake diagnostics buffer."
  (string-prefix-p "*Flymake diagnostics" (buffer-name (window-buffer window))))

(defun toggle-flymake-diagnostics ()
  "Toggle flymake diagnostics buffer."
  (interactive)
  (let ((diagnostics-window (seq-find #'flymake-diagnostics-window (window-list))))
	(if diagnostics-window
		(quit-window t diagnostics-window)
	  (if (project-current)
		  (flymake-show-project-diagnostics)
		(flymake-show-buffer-diagnostics)))))

(with-eval-after-load 'flymake
  (require 'project)
  (define-key flymake-mode-map (kbd "<f6>") #'toggle-flymake-diagnostics)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

(add-to-list 'display-buffer-alist
			 '("\\*Flymake diagnostics"
			   display-buffer-in-side-window
			   (side . bottom)
			   (window-height . (lambda (window) (fit-window-to-buffer window 10)))))

;; Completions
(setq completion-styles '(basic partial-completion substring))
(setq completion-category-overrides '((project-file (styles . (basic flex initials)))))

(setq tab-always-indent 'complete)
(setq completions-format 'vertical)
(setq completions-max-height 10)
(setq completion-show-help nil)

(add-to-list 'completion-ignored-extensions ".exe")

(define-key completion-in-region-mode-map (kbd "S-<return>") #'switch-to-completions)
(define-key minibuffer-local-completion-map (kbd "S-<return>") #'switch-to-completions)

(add-to-list 'display-buffer-alist
			 '("\\*Completions\\*"
			   display-buffer-in-side-window
			   (side . bottom)))

;; Repeat
(setq repeat-exit-key "RET")
(repeat-mode 1)

;; C-x 1
(defvar last-window-config nil)

(defun toggle-single-window ()
  "Toggle single window."
  (interactive)
  (if (and last-window-config
		   (= (length (window-list)) 1))
	  (progn
		(set-window-configuration last-window-config)
		(setq last-window-config nil))
	(setq last-window-config (current-window-configuration))
	(delete-other-windows)))

(global-set-key (kbd "C-x 1") #'toggle-single-window)

;; Minibuffer
(setq enable-recursive-minibuffers t)
(setq read-minibuffer-restore-windows nil)
(setq minibuffer-prompt-properties
	  '(read-only t intangible t cursor-intangible t face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(minibuffer-depth-indicate-mode 1)

;; Savehist
(setq savehist-additional-variables
	  '(kill-ring
		register-alist
		mark-ring
		global-mark-ring
		search-ring
		regexp-search-ring))
(savehist-mode 1)

;; Eval expression
(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;; Dired
(require 'dired-aux)
(require 'dired-x)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-create-destination-dirs 'ask)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-vc-rename-file t)
(setq dired-do-revert-buffer t)

(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(defun dired-goto-existing-file (filename)
  "Dired-jump but checking for existing FILENAME."
  (interactive (nbutlast (find-file-read-args "Find existing file: " t)))
  (dired-goto-file (expand-file-name filename)))

(define-key dired-mode-map (kbd "j") #'dired-goto-existing-file)
(global-set-key (kbd "C-c n") #'find-name-dired)
(global-set-key (kbd "C-c f") #'find-file-existing)

;; Symlinks
(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

;; Version Control
(setq vc-git-show-stash 0)
(setq vc-git-print-log-follow t)
(setq vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq diff-default-read-only t)
(setq smerge-command-prefix "\e")

(defun recenter-top (&rest _) (recenter 0))
(advice-add 'diff-hunk-next :after #'recenter-top)
(advice-add 'diff-hunk-prev :after #'recenter-top)

;; Org
(setq org-use-speed-commands t)
(setq org-log-into-drawer t)
(setq org-hide-emphasis-markers t)
(setq org-return-follows-link t)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))

;; Tab bar
(setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
(setq tab-bar-select-tab-modifiers '(meta))
(setq tab-bar-show 1)
(setq tab-bar-close-button-show nil)
(setq tab-bar-format '(tab-bar-format-tabs))
(setq tab-bar-auto-width-max nil)

;; Empty lines
(defun delete-multi-empty-lines ()
  "Collapse multiple blank lines into one."
  (interactive)
  (save-excursion
	(goto-char (point-min))
	(while (re-search-forward "\n\\{2,\\}" nil t)
	  (replace-match "\n\n"))))

;; Keybindings
(global-set-key (kbd "<remap> <count-words-region>") #'count-words)
(global-set-key (kbd "<remap> <capitalize-word>") #'capitalize-dwim)
(global-set-key (kbd "<remap> <downcase-word>") #'downcase-dwim)
(global-set-key (kbd "<remap> <upcase-word>") #'upcase-dwim)
(global-set-key (kbd "<remap> <zap-to-char>") #'zap-up-to-char)

(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-c h") #'hl-line-mode)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c m") #'point-to-register)
(global-set-key (kbd "C-c j") #'jump-to-register)
(global-set-key (kbd "C-z") #'repeat)

;; Custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
