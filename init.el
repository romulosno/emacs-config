;;; init.el --- emacs config -*- lexical-binding: t; -*-

;;; Packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(unless package-archives
  (package-refresh-contents))

(let ((package-list
       '(dockerfile-mode
	 eglot
	 exec-path-from-shell
	 go-mode
	 kotlin-mode
	 treesit-auto
	 yaml-mode
	 markdown-mode)))
  (dolist (p package-list)
    (unless (package-installed-p p)
      (package-install p))))

;;; Theme and font
(load-theme 'rom-colors t)

(cond
 ((find-font (font-spec :name "Maple Mono NF"))
  (set-face-font 'default "Maple Mono NF-10"))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (set-face-font 'default "DejaVu Sans Mono-10")))

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
(setq completions-max-height 20)
(setq completion-styles '(basic partial-completion emacs22 substring initials))

(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)
(define-key completion-in-region-mode-map (kbd "C-s") #'search-in-completions)

(defun search-in-completions ()
  "Search forward in completions buffer."
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

(add-hook 'dired-mode-hook
	  (lambda ()
	    (setq truncate-lines t)
	    (dired-hide-details-mode 1)
	    (hl-line-mode 1)))

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

;;; Hl line
(global-set-key (kbd "C-c h") #'hl-line-mode)
(add-hook 'flymake-diagnostics-mode-hook #'hl-line-mode)
(add-hook 'flymake-project-diagnostics-mode-hook #'hl-line-mode)
(add-hook 'occur-mode-hook #'hl-line-mode)

;;; Global modes
(column-number-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(winner-mode 1)
(minibuffer-depth-indicate-mode 1)
(savehist-mode 1)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq switch-to-buffer-obey-display-actions t)
(setq split-height-threshold nil)

(setq display-buffer-alist
      '(("\\*\\(shell\\|*term\\|*eshell\\|Async Shell Command\\|Occur\\|xref\\).*\\*"
         display-buffer-in-side-window
         (body-function . select-window)
         (window-height . 0.3)
	 (slot . -1))

	("\\*\\(Flymake\\|compilation\\).*\\*"
         display-buffer-in-side-window
         (body-function . select-window)
         (window-height . 0.3)
	 (slot . 1))
	
	("\\*Completions\\*"
	 display-buffer-below-selected)))

;;; Custom
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
