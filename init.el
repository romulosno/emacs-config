;;; init.el --- emacs config -*- lexical-binding: t; -*-

;;; Packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar packages-to-install
  '(dockerfile-mode
    eglot
    go-mode
    kotlin-mode
    yaml-mode
    markdown-mode))

(unless package-archives
  (package-refresh-contents))

(dolist (pac packages-to-install)
  (unless (package-installed-p pac)
    (package-install pac)))

;;; History
(setq history-delete-duplicates t)
(setq savehist-additional-variables
      '(kill-ring
	search-ring
	regexp-search-ring))

;;; Repeat
(setq repeat-exit-key "RET")

;;; Backups
(setq vc-make-backup-files t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)

(setq backup-directory-alist `(("." . ,(locate-user-emacs-file "backups"))))
(setq tramp-backup-directory-alist backup-directory-alist)

;;; Autosave
(setq auto-save-list-file-prefix (locate-user-emacs-file "autosave/"))
(setq tramp-auto-save-directory (locate-user-emacs-file "tramp-autosave/"))

;;; Init screen
(setq initial-major-mode 'fundamental-mode
      inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

;;; Misc
(load-theme 'cores-claras t)

(setq use-short-answers t)
(setq enable-recursive-minibuffers t)
(setq kill-whole-line t)
(setq view-read-only t)
(setq visible-bell t)
(setq imenu-auto-rescan t)
(setq read-minibuffer-restore-windows nil)
(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)

;; Visit symlink
(setq find-file-visit-truename t)	

;; Scroll
(setq fast-but-imprecise-scrolling t)
(setq jit-lock-defer-time 0)

;; Enable commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; Smart parens
(setq show-paren-when-point-inside-paren t
      show-paren-when-point-in-periphery t)

;;; Isearch
(setq isearch-lazy-count t
      isearch-yank-on-move 'shift
      isearch-allow-scroll t)

;;; Completions
(setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t)

(setq tab-always-indent 'complete
      completion-show-help nil
      completions-max-height 20)

(setq completion-styles
      '(basic partial-completion emacs22 substring flex))

;;; Abbrev
(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs 'silently)
(setq abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

;;; Dired
(require 'dired)
(require 'dired-aux)
(require 'dired-x)

(setq delete-by-moving-to-trash t
      dired-kill-when-opening-new-dired-buffer t
      dired-recursive-copies 'always
      dired-recursive-deletes 'always)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)

;;; Outline
(setq outline-minor-mode-prefix "\C-co")
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)

(put 'outline-default-state 'safe-local-variable #'integerp)
(put 'outline-default-state 'safe-local-variable #'symbolp)

(add-hook 'outline-minor-mode-hook
	  (lambda ()
	    (if outline-minor-mode
		(reveal-mode 1)
	      (reveal-mode -1))))

;;; Org
(add-hook 'org-mode-hook 'auto-fill-mode)

(setq org-tags-column 0
      org-use-speed-commands t
      org-export-with-sub-superscripts nil
      org-return-follows-link t
      org-startup-folded nil)

(setq org-agenda-show-log t
      org-log-done 'time
      org-log-into-drawer t)

(setq org-goto-interface 'outline-path-completion
      org-goto-max-level 10)

(setq org-todo-keywords
      '("TODO(t)"
	"WIP(p!)"
	"WAIT(w@/@)"
	"|"
	"DONE(d!)"
	"CANCELED(c@)"))

(put 'org-todo-keyword-faces 'safe-local-variable #'stringp)

;;; Version Control
(setq vc-git-show-stash 0
      vc-follow-symlinks t
      vc-git-print-log-follow t
      vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-keep-variants nil)

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

;;; Code
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'prog-mode-hook (lambda()
			    (hs-minor-mode 1)
			    (hs-hide-initial-comment-block)))
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
      eglot-events-buffer-config '(:size 500000))

;;; Global modes
(column-number-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(winner-mode 1)
(minibuffer-depth-indicate-mode 1)
(recentf-mode 1)
(savehist-mode 1)
(repeat-mode 1)

;;; Keybindings

;;;; Remaps
(global-set-key [remap count-words-region] #'count-words)
(global-set-key [remap capitalize-word] #'capitalize-dwim)
(global-set-key [remap downcase-word] #'downcase-dwim)
(global-set-key [remap upcase-word] #'upcase-dwim)
(global-set-key [remap list-buffers] #'electric-buffer-list)

;;;; Ctrl-c prefix
(global-set-key (kbd "C-c f") #'find-name-dired)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c r") #'recentf)

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c l") #'org-store-link)

(global-set-key (kbd "C-z") #'repeat)

(global-set-key (kbd "<f6>") #'outline-minor-mode)
(global-set-key (kbd "<f5>") #'compile)

;;;; Completions
(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)

;;;; Eglot
(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

;;;; Flymake
(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "<f7>") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "<f8>") #'flymake-goto-prev-error))

;;;; Org
(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))


;;; Custom
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; Local
;; Local Variables:
;; outline-default-state: outline-show-only-headings
;; End:
