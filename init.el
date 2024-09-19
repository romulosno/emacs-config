(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar my-package-list '(dockerfile-mode
			  go-mode
			  eglot
			  modus-themes
			  yaml-mode))

(dolist (pac my-package-list)
  (unless (package-installed-p pac)
	  (package-install pac)))

(require 'server)
(unless (server-running-p)
  (server-start))

(column-number-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(repeat-mode 1)

(when (find-font (font-spec :name "Hack"))
  (set-face-font 'default "Hack-10"))

(load-theme 'modus-operandi-tinted t)

(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

(setq use-short-answers t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq view-read-only t)
(setq visible-bell t)
(setq imenu-auto-rescan t)
(setq make-backup-files nil)

(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq isearch-lazy-count t)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-scroll t)

(add-to-list 'completion-styles 'substring t)
(setq completions-format 'one-column)
(setq completion-show-help nil)
(setq completions-max-height 20)
(setq tab-always-indent 'complete)

(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(setq dabbrev-case-fold-search nil)
(setq-default abbrev-mode t)
(setq save-abbrevs 'silently)

(global-set-key (kbd "C-z") #'repeat)
(setq repeat-exit-key "RET")

(define-key prog-mode-map (kbd "<f5>") #'compile)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)
(setq read-process-output-max (* 3 1024 1024))

(require 'dired)
(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq delete-by-moving-to-trash t)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(setq smerge-command-prefix "\e")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(global-set-key (kbd "M-c") #'capitalize-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-u") #'upcase-dwim)
(global-set-key (kbd "C-c f") #'find-name-dired)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "C-c e p") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c e l") #'flymake-show-buffer-diagnostics)
  (define-key flymake-mode-map (kbd "C-c e L") #'flymake-show-project-diagnostics))

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)
