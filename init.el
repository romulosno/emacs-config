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

(setq auto-dark-themes '((modus-vivendi) (modus-operandi)))
(auto-dark-mode 1)

(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)

(setq backup-directory-alist
      `((,tramp-file-name-regexp . ,temporary-file-directory)
	("." . ,(locate-user-emacs-file "backups"))))

(setq initial-major-mode 'fundamental-mode
      inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

(add-hook 'after-init-hook #'exec-path-from-shell-initialize)

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
(setq find-file-visit-truename t)
(setq repeat-exit-key "RET")

(put 'narrow-to-region 'disabled nil)

(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

(setq isearch-lazy-count t)
(setq isearch-allow-scroll t)
(setq isearch-yank-on-move 'shift)
(setq isearch-lazy-highlight 'all-windows)

(setq imenu-flatten 'prefix)
(setq imenu-auto-rescan t)

(setq tab-always-indent 'complete)
(setq completion-show-help nil)
(setq completions-header-format nil)
(setq completions-max-height 20)
(setq completions-format 'one-column)
(setq completion-styles '(basic partial-completion initials substring))

(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)

(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs 'silently)
(setq abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

(with-eval-after-load 'completion-preview
  (define-key completion-preview-active-mode-map (kbd "M-n") #'completion-preview-next-candidate)
  (define-key completion-preview-active-mode-map (kbd "M-p") #'completion-preview-prev-candidate))

(require 'dired-aux)
(require 'dired-x)
(require 'ls-lisp)

(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(setq delete-by-moving-to-trash t)
(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(setq org-agenda-show-log t)
(setq org-export-with-sub-superscripts nil)
(setq org-goto-interface 'outline-path-completion)
(setq org-goto-max-level 10)
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-return-follows-link t)
(setq org-startup-folded nil)
(setq org-startup-indented t)
(setq org-tags-column 0)
(setq org-use-speed-commands t)

(put 'org-todo-keyword-faces 'safe-local-variable #'stringp)

(add-hook 'latex-mode-hook #'visual-line-mode)
(add-hook 'latex-mode-hook #'electric-pair-mode)

(setq vc-git-show-stash 0)
(setq vc-follow-symlinks t)
(setq vc-git-print-log-follow t)
(setq vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

(when (fboundp 'completion-preview-mode)
  (add-hook 'prog-mode-hook #'completion-preview-mode))

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)
(setq compilation-auto-jump-to-first-error 'if-location-known)
(setq compilation-ask-about-save nil)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 2)

(setq read-process-output-max (* 3 1024 1024))
(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 0))
      
(add-to-list 'display-buffer-alist '("\\*Buffer List\\*" nil (body-function . select-window)))
(define-key Buffer-menu-mode-map "q" #'kill-buffer-and-window)

(column-number-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(winner-mode 1)
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

(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)
;;; init.el ends here
