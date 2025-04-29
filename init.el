;;; init.el --- emacs config -*- lexical-binding: t; -*-

(setq package-install-upgrade-built-in t)
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
			 ("nongnu" . "https://elpa.nongnu.org/nongnu/")
			 ("melpa" . "https://melpa.org/packages/")))

(unless package-archives
  (package-refresh-contents))

(let ((package-list
       '(auto-dark
	 dockerfile-mode
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

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

(setq auto-dark-themes '((modus-vivendi) (modus-operandi)))
(auto-dark-mode 1)

(setq backup-by-copying t
      delete-old-versions t
      version-control t)

(setq backup-directory-alist
      `((,tramp-file-name-regexp . ,temporary-file-directory)
	("." . ,(locate-user-emacs-file "backups"))))

(setq initial-major-mode 'fundamental-mode
      inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

(add-hook 'after-init-hook #'exec-path-from-shell-initialize)

(setq frame-resize-pixelwise t)
(setq echo-keystrokes 0.02)
(setq use-short-answers t)
(setq enable-recursive-minibuffers t)
(setq kill-whole-line t)
(setq view-read-only t)
(setq ring-bell-function 'ignore)
(setq read-minibuffer-restore-windows nil)
(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)
(setq find-file-visit-truename t)
(setq repeat-exit-key "RET")

(put 'narrow-to-region 'disabled nil)

(setq isearch-lazy-count t
      isearch-allow-scroll t
      isearch-yank-on-move 'shift
      isearch-lazy-highlight 'all-windows)

(setq imenu-flatten 'prefix
      imenu-auto-rescan t)

(setq tab-bar-show 1
      tab-bar-new-button-show nil
      tab-bar-close-last-tab-choice 'tab-bar-mode-disable)

(setq tab-always-indent 'complete
      completion-show-help nil
      completions-header-format nil
      completions-max-height 20
      completions-format 'one-column
      completion-styles '(basic partial-completion initials substring))

(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)

(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs 'silently)
(setq abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

(when (fboundp 'completion-preview-mode)
  (add-hook 'prog-mode-hook #'completion-preview-mode))

(with-eval-after-load 'completion-preview
  (define-key completion-preview-active-mode-map (kbd "M-n") #'completion-preview-next-candidate)
  (define-key completion-preview-active-mode-map (kbd "M-p") #'completion-preview-prev-candidate))

(require 'dired-aux)
(require 'dired-x)
(require 'ls-lisp)

(setq ls-lisp-dirs-first t
      ls-lisp-use-insert-directory-program nil)

(setq delete-by-moving-to-trash t
      dired-kill-when-opening-new-dired-buffer t
      dired-recursive-copies 'always
      dired-recursive-deletes 'always)

(setq org-agenda-show-log t
      org-export-with-sub-superscripts nil
      org-goto-interface 'outline-path-completion
      org-goto-max-level 10
      org-log-done 'time
      org-log-into-drawer t
      org-return-follows-link t
      org-startup-folded nil
      org-startup-indented t
      org-tags-column 0
      org-use-speed-commands t)

(put 'org-todo-keyword-faces 'safe-local-variable #'stringp)

(add-hook 'latex-mode-hook #'visual-line-mode)
(add-hook 'latex-mode-hook #'electric-pair-mode)

(setq vc-git-show-stash 0
      vc-follow-symlinks t
      vc-git-print-log-follow t
      vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-keep-variants nil)

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq compilation-max-output-line-length nil
      compilation-scroll-output 'first-error
      compilation-auto-jump-to-first-error 'if-location-known
      compilation-ask-about-save nil)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly
      eldoc-echo-area-use-multiline-p 3)

(setq read-process-output-max (* 3 1024 1024))
(setq eglot-autoshutdown t
      eglot-sync-connect nil
      eglot-events-buffer-config '(:size 0))
      
(add-to-list 'display-buffer-alist '("\\*Buffer List\\*" nil (body-function . select-window)))
(define-key Buffer-menu-mode-map "q" #'kill-buffer-and-window)

(column-number-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(winner-mode 1)
(minibuffer-depth-indicate-mode 1)
(savehist-mode 1)
(repeat-mode 1)
(global-auto-revert-mode 1)

(global-set-key [remap count-words-region] #'count-words)
(global-set-key [remap capitalize-word] #'capitalize-dwim)
(global-set-key [remap downcase-word] #'downcase-dwim)
(global-set-key [remap upcase-word] #'upcase-dwim)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c f") #'find-name-dired)
(global-set-key (kbd "C-c o") #'find-file-existing)
(global-set-key (kbd "C-c h") #'hl-line-mode)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "<f5>") #'compile)
(global-set-key (kbd "C-z") #'repeat)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

;;; init.el ends here
