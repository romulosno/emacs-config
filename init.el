;;; init.el --- emacs config -*- lexical-binding: t; -*-
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))

(let ((package-list
       '(auto-dark
	 dockerfile-mode
	 exec-path-from-shell
	 groovy-mode
	 go-mode
	 kotlin-mode
	 yaml-mode
	 markdown-mode)))
  (dolist (p package-list)
    (unless (package-installed-p p)
      (package-install p))))

(setq custom-safe-themes t)
(setq auto-dark-themes '((rom-night) (rom-day)))
(auto-dark-mode 1)

(setq initial-major-mode 'fundamental-mode
      inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

(add-hook 'after-init-hook #'exec-path-from-shell-initialize)

(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)

(setq backup-directory-alist
      `((,tramp-file-name-regexp . ,temporary-file-directory)
	("." . ,(locate-user-emacs-file "backups"))))

(setq auto-save-list-file-prefix
      (expand-file-name "auto-save/" user-emacs-directory))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-auto-save/" user-emacs-directory))

(setq scroll-preserve-screen-position t)
(setq fast-but-imprecise-scrolling t)

(setq hscroll-margin 2)
(setq hscroll-step 1)

(setq-default frame-title-format "%b")
(setq frame-resize-pixelwise t)

(setq-default truncate-lines t)
(setq echo-keystrokes 0.02)
(setq use-short-answers t)
(setq kill-whole-line t)
(setq view-read-only t)
(setq ring-bell-function 'ignore)
(setq confirm-nonexistent-file-or-buffer nil)

(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)
(setq delete-by-moving-to-trash t)
(put 'narrow-to-region 'disabled nil)

(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

(setq isearch-lazy-count t)
(setq isearch-allow-scroll t)
(setq isearch-yank-on-move 'shift)
(setq isearch-lazy-highlight 'all-windows)

(setq imenu-flatten 'prefix)
(setq imenu-auto-rescan t)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq read-minibuffer-restore-windows nil)
(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t face minibuffer-prompt))
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)

(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

(setq window-divider-default-bottom-width 0)
(setq window-divider-default-places t)
(setq window-divider-default-right-width 1)
(window-divider-mode 1)

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

(setq display-time-default-load-average nil)
(setq-default mode-line-format
	      '("%e" mode-line-front-space
		(:propertize
		 ("" mode-line-mule-info mode-line-client mode-line-modified mode-line-remote)
		 display (min-width (3.0)))
		(:propertize " %10b " face mode-line-buffer-id)
		project-mode-line-format
		(vc-mode vc-mode)
		mode-line-format-right-align		
		mode-line-misc-info " "
		(flymake-mode flymake-mode-line-counters) " "
		mode-name
		mode-line-process
		" [%l,%c] "
		"  "
		mode-line-end-spaces))

(add-to-list 'display-buffer-alist '("\\*Buffer List\\*" nil (body-function . select-window)))

(global-completion-preview-mode 1)

(setq completion-styles '(basic partial-completion initials substring))
(setq tab-always-indent 'complete)
(setq completions-format 'one-column)
(setq completions-max-height 20)
(setq completion-show-help nil)
(setq completions-header-format nil)

(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)

(setq save-abbrevs 'silently)
(setq abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

(setq savehist-additional-variables
      '(kill-ring
	register-alist
	mark-ring
	global-mark-ring
	search-ring
	regexp-search-ring))
(savehist-mode 1)

(setq save-place-file (expand-file-name "save-place" user-emacs-directory))
(save-place-mode 1)

(global-auto-revert-mode 1)
(global-so-long-mode 1)
(winner-mode 1)

(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-create-destination-dirs 'ask)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-vc-rename-file t)

(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(setq org-agenda-show-log t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-goto-interface 'outline-path-completion)
(setq org-goto-max-level 10)

(setq org-export-with-sub-superscripts nil)
(setq org-return-follows-link t)
(setq org-startup-folded nil)
(setq org-startup-indented t)
(setq org-tags-column 0)
(setq org-use-speed-commands t)

(put 'org-todo-keyword-faces 'safe-local-variable #'stringp)

(setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
(setq tab-bar-select-tab-modifiers '(meta))

(setq vc-git-show-stash 0)
(setq vc-git-print-log-follow t)
(setq vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq read-process-output-max (* 3 1024 1024))

(setq compilation-ask-about-save nil)
(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)
(setq compilation-auto-jump-to-first-error 'if-location-known)

(setq xref-show-definitions-function 'xref-show-definitions-completing-read)
(setq xref-show-xrefs-function 'xref-show-definitions-completing-read)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 0))
      
(keymap-global-set "<remap> <count-words-region>" #'count-words)
(keymap-global-set "<remap> <capitalize-word>" #'capitalize-dwim)
(keymap-global-set "<remap> <downcase-word>" #'downcase-dwim)
(keymap-global-set "<remap> <upcase-word>" #'upcase-dwim)

(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c f" #'find-name-dired)
(keymap-global-set "C-c o" #'find-file-existing)
(keymap-global-set "C-c h" #'hl-line-mode)
(keymap-global-set "C-c k" #'kill-current-buffer)
(keymap-global-set "C-c l" #'org-store-link)
(keymap-global-set "<f5>" #'compile)
(keymap-global-set "C-z" #'repeat)

(keymap-set Buffer-menu-mode-map "q" #'kill-buffer-and-window)
(keymap-set completion-in-region-mode-map "M-v" #'switch-to-completions)

(with-eval-after-load 'org
  (keymap-set org-mode-map "C-M-<return>" #'org-insert-subheading))

(with-eval-after-load 'eglot
  (keymap-set eglot-mode-map "C-c c r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c c f" #'eglot-format)
  (keymap-set eglot-mode-map "C-c c a" #'eglot-code-actions))

(with-eval-after-load 'flymake
  (keymap-set flymake-mode-map "C-c e" #'flymake-show-project-diagnostics)
  (keymap-set flymake-mode-map "M-n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "M-p" #'flymake-goto-prev-error))

(with-eval-after-load 'completion-preview
  (keymap-set completion-preview-active-mode-map "M-n" #'completion-preview-next-candidate)
  (keymap-set completion-preview-active-mode-map "M-p" #'completion-preview-prev-candidate))

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
