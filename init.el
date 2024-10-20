;;; Packages config
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archive-priorities '(("elpa" . 3)
				   ("melpa" . 2)
				   ("nongnu" . 1)))

(defvar packages-to-install
  '(dockerfile-mode
    eglot
    git-timemachine
    go-mode
    groovy-mode
    kotlin-mode
    yaml-mode
    markdown-mode))

(dolist (pac packages-to-install)
  (unless (package-installed-p pac)
    (package-install pac)))

;;; Server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; Global modes
(column-number-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)

;;; Font and faces
(load-theme 'cores-claras t)

(cond
 ((find-font (font-spec :name "Ubuntu Mono"))
  (set-face-font 'default "Ubuntu Mono-11"))
 ((find-font (font-spec :name "JetBrains Mono"))
  (set-face-font 'default "JetBrains Mono-10")))

;;; Init screen
(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

;;; Misc
(setq use-short-answers t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq view-read-only t)
(setq visible-bell t)
(setq imenu-auto-rescan t)

;;; Enable commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; Isearch
(setq isearch-lazy-count t)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-scroll t)

;;; Completions
(add-to-list 'completion-styles 'substring t)
(add-to-list 'completion-styles 'flex t)

(setq completions-format 'one-column)
(setq completion-show-help nil)
(setq completions-max-height 20)
(setq tab-always-indent 'complete)

(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)

(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs 'silently)

;;; Repeat
(setq repeat-exit-key "RET")
(global-set-key (kbd "C-z") #'repeat)
(repeat-mode 1)

;;; Dired
(require 'dired)
(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq delete-by-moving-to-trash t)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

;;; Org And Markdown
(setq org-tags-column 0)
(setq org-use-speed-commands t)
(setq org-startup-indented t)

;;; Version Control
(setq vc-git-show-stash 0)
(setq vc-git-print-log-follow t)

(setq make-backup-files nil)
(setq smerge-command-prefix "\e")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

;; Case control
(global-set-key (kbd "M-c") #'capitalize-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-u") #'upcase-dwim)

;; Other window
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "M-O") #'other-frame)

;; Search
(global-set-key (kbd "C-c f") #'find-name-dired)
(global-set-key (kbd "C-c g") #'grep)
(global-set-key (kbd "C-c r") #'rgrep)

;;; Code
(global-set-key (kbd "<f5>") #'compile)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

;;;; Java
(add-hook 'java-mode-hook
	  (lambda ()
            (setq c-basic-offset 4
                  tab-width 4
                  indent-tabs-mode t)))

;;; Compilation
(setq compilation-max-output-line-length nil)
(setq compilation-auto-jump-to-first-error 'if-location-known)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

;;; Eldoc
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;; LSP
(setq read-process-output-max (* 3 1024 1024))
(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "<f6>") #'eglot-rename)
  (define-key eglot-mode-map (kbd "<f7>") #'eglot-format)
  (define-key eglot-mode-map (kbd "<f8>") #'eglot-code-actions))

(setq tab-bar-new-button-show nil
      tab-bar-close-button-show nil)

;;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)
