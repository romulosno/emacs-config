;;; init.el --- emacs config -*- lexical-binding: t; -*-
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))

(let ((package-list
       '(auto-dark
	 dockerfile-mode
	 exec-path-from-shell
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

(setq backup-by-copying t
      delete-old-versions t
      version-control t)

(setq backup-directory-alist
      `((,tramp-file-name-regexp . ,temporary-file-directory)
	("." . ,(locate-user-emacs-file "backups"))))

(setq auto-save-list-file-prefix
      (expand-file-name "auto-save/" user-emacs-directory))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-auto-save/" user-emacs-directory))

(setq initial-major-mode 'fundamental-mode
      inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

(add-hook 'after-init-hook #'exec-path-from-shell-initialize)

(setq-default truncate-lines t)
(setq fast-but-imprecise-scrolling t)
(setq scroll-preserve-screen-position t)

(setq-default frame-title-format "%b")
(setq frame-resize-pixelwise t)

(setq echo-keystrokes 0.02)
(setq use-short-answers t)

(setq enable-recursive-minibuffers t)
(minibuffer-depth-indicate-mode 1)

(setq kill-whole-line t)
(setq view-read-only t)
(setq ring-bell-function 'ignore)
(setq read-minibuffer-restore-windows nil)
(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)
(setq delete-by-moving-to-trash t)

(setq find-file-visit-truename t
      vc-follow-symlinks t)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(put 'narrow-to-region 'disabled nil)

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

(setq isearch-lazy-count t
      isearch-allow-scroll t
      isearch-yank-on-move 'shift
      isearch-lazy-highlight 'all-windows)

(setq imenu-flatten 'prefix
      imenu-auto-rescan t)

(setq tab-always-indent 'complete
      completion-show-help nil
      completions-header-format nil
      completions-max-height 20
      completions-format 'one-column
      completion-styles '(basic partial-completion initials substring))

(global-completion-preview-mode 1)

(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)

(setq save-abbrevs 'silently
      abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

(setq savehist-additional-variables
      '(kill-ring
	register-alist
	mark-ring
	global-mark-ring
	search-ring regexp-search-ring))

(savehist-mode 1)

(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t
      dired-recursive-copies 'always
      dired-recursive-deletes 'always)

(setq ls-lisp-dirs-first t
      ls-lisp-use-insert-directory-program nil)

(setq org-agenda-show-log t
      org-log-done 'time
      org-log-into-drawer t)

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

(setq org-export-with-sub-superscripts nil
      org-return-follows-link t
      org-startup-folded nil
      org-startup-indented t
      org-tags-column 0
      org-use-speed-commands t)

(put 'org-todo-keyword-faces 'safe-local-variable #'stringp)

(add-hook 'latex-mode-hook #'visual-line-mode)
(add-hook 'latex-mode-hook #'electric-pair-mode)

(setq vc-git-show-stash 0
      vc-git-print-log-follow t
      vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-keep-variants nil)

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq read-process-output-max (* 3 1024 1024))

(setq compilation-ask-about-save nil
      compilation-max-output-line-length nil
      compilation-scroll-output 'first-error
      compilation-auto-jump-to-first-error 'if-location-known)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
      eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t
      eglot-sync-connect nil
      eglot-events-buffer-config '(:size 0))
      
(add-to-list 'display-buffer-alist '("\\*Buffer List\\*" nil (body-function . select-window)))

(column-number-mode 1)
(global-auto-revert-mode 1)
(global-so-long-mode 1)
(save-place-mode 1)
(winner-mode 1)

(keymap-set global-map "<remap> <count-words-region>" #'count-words)
(keymap-set global-map "<remap> <capitalize-word>" #'capitalize-dwim)
(keymap-set global-map "<remap> <downcase-word>" #'downcase-dwim)
(keymap-set global-map "<remap> <upcase-word>" #'upcase-dwim)

(keymap-set global-map "C-c a" #'org-agenda)
(keymap-set global-map "C-c f" #'find-name-dired)
(keymap-set global-map "C-c o" #'find-file-existing)
(keymap-set global-map "C-c h" #'hl-line-mode)
(keymap-set global-map "C-c k" #'kill-current-buffer)
(keymap-set global-map "C-c l" #'org-store-link)
(keymap-set global-map "<f5>" #'compile)
(keymap-set global-map "C-z" #'repeat)

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
