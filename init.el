;;; Theme
(load-theme 'cores-claras t)

;;; Packages
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)

(defvar packages-to-install
  '(dockerfile-mode
    eglot
    feature-mode
    go-mode
    groovy-mode
    kotlin-mode
    yaml-mode
    markdown-mode))

(dolist (pac packages-to-install)
  (unless (package-installed-p pac)
    (package-install pac)))

;;; Global modes
(column-number-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)
(winner-mode 1)
(minibuffer-depth-indicate-mode 1)

;;; Recentf
(recentf-mode 1)
(global-set-key (kbd "C-c r") #'recentf)

;;; History
(setq history-delete-duplicates t)
(setq savehist-additional-variables '(kill-ring
				      search-ring
				      regexp-search-ring))
(add-hook 'after-init-hook #'savehist-mode)

;;; Repeat
(setq repeat-exit-key "RET")
(global-set-key (kbd "C-z") #'repeat)
(repeat-mode 1)

;;; Backups
(setq vc-make-backup-files t)
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)

(setq backup-directory-alist
      `(("." . ,(expand-file-name "backups" user-emacs-directory))))
(setq tramp-backup-directory-alist backup-directory-alist)

;;; Autosave
(setq auto-save-list-file-prefix
      (expand-file-name "autosave/" user-emacs-directory))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-autosave/" user-emacs-directory))

;;; Init screen
(setq inhibit-startup-screen t)
(setq inhibit-x-resources t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)
(setq inhibit-splash-screen t)

;;;; Bidi
(setq-default bidi-display-reordering 'left-to-right
              bidi-paragraph-direction 'left-to-right)

;;; Misc
(fset 'yes-or-no-p 'y-or-n-p)
(setq enable-recursive-minibuffers t)
(setq kill-whole-line t)
(setq ring-bell-function #'ignore)
(setq view-read-only t)
(setq visible-bell t)
(setq imenu-auto-rescan t)
(setq read-minibuffer-restore-windows nil)
(setq use-dialog-box nil)
(setq use-file-dialog nil)
(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)

;; Scroll
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 10)
(setq scroll-step 1)
(setq hscroll-margin 2)
(setq hscroll-step 1)

;;; Symlinks
(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

;;; Splits
(setq split-width-threshold 170)
(setq split-height-threshold nil)

;;; Enable commands
(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;;; Smart parens
(setq show-paren-when-point-inside-paren t)
(setq show-paren-when-point-in-periphery t)

;;; Isearch
(setq isearch-lazy-count t)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-scroll t)

;;; Completions
(setq completion-show-help nil)
(setq completions-max-height 20)
(setq tab-always-indent 'complete)

(add-to-list 'completion-styles 'substring t)
(add-to-list 'completion-styles 'flex t)

(setq read-buffer-completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)

;;; Abbrev
(setq-default abbrev-mode t)
(setq dabbrev-case-fold-search nil)
(setq save-abbrevs 'silently)
(setq abbrev-file-name (expand-file-name "abbrev_defs" user-emacs-directory))

;;; Switch to completions
(define-key completion-in-region-mode-map (kbd "M-v") #'switch-to-completions)
(add-hook 'completion-list-mode-hook
	  (lambda () (setq-local truncate-lines t)))

;;; Dired
(require 'dired)
(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq delete-by-moving-to-trash t)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)

;;; Org
(setq org-tags-column 0)
(setq org-use-speed-commands t)
(setq org-export-with-sub-superscripts nil)
(setq org-return-follows-link t)
(setq org-startup-folded nil)
(setq org-agenda-show-log t)

(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-goto-interface 'outline-path-completion)
(setq org-goto-max-level 10)

(setq org-todo-keywords
      '("TODO(t)"
	"WIP(p!)"
	"WAIT(w@/@)"
	"|"
	"DONE(d!)"
	"CANCELED(c@)"))

(setq org-todo-keyword-faces
      '(("TODO" . "firebrick")
	("WIP" . "navy blue")
	("WAIT" . "dark goldenrod")
	("DONE" . "forest green")
	("CANCELED" . "gray30")))

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))

(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c l") #'org-store-link)
(add-hook 'org-mode-hook #'auto-fill-mode)

;;; Outline
(setq outline-minor-mode-prefix "\C-co")
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)

(put 'outline-default-state 'safe-local-variable #'integerp)
(global-set-key (kbd "<f6>") #'outline-minor-mode)
(add-hook 'outline-minor-mode-hook
	  (lambda ()
	    (if outline-minor-mode
		(reveal-mode 1)
	      (reveal-mode -1))))

;;; Version Control
(setq vc-git-show-stash 0)
(setq vc-git-print-log-follow t)
(setq vc-handled-backends '(Git))

(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

;;; Global keys
(global-set-key [remap count-words-region] #'count-words)
(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "M-O") #'other-frame)
(global-set-key (kbd "C-c f") #'find-name-dired)
(global-set-key (kbd "C-c k") #'kill-current-buffer)

;; Case control
(global-set-key [remap capitalize-word] #'capitalize-dwim)
(global-set-key [remap downcase-word] #'downcase-dwim)
(global-set-key [remap upcase-word] #'upcase-dwim)

;;; Code
(global-set-key (kbd "<f5>") #'compile)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

;;; Compilation
(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)
(setq compilation-auto-jump-to-first-error 'if-location-known)
(setq compilation-ask-about-save nil)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

;;; Eldoc
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;; LSP
(setq read-process-output-max (* 3 1024 1024))
(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 500000))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "C-c [") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c ]") #'flymake-goto-next-error))

;;; Window control
(setq-default make-window-start-visible t)
(setq-default truncate-lines t)

(setq frame-resize-pixelwise t)
(setq switch-to-buffer-in-dedicated-window 'pop)
(setq switch-to-buffer-obey-display-actions t)

(add-to-list 'display-buffer-alist
             '("\\*\\(Warnings\\|Compile-Log\\)\\*"
               (display-buffer-no-window)
               (allow-no-window . t)))

(add-to-list 'display-buffer-alist
             '("\\*Buffer List\\*"
               (display-buffer-pop-up-window)
	       (body-function . select-window)))

(add-to-list 'display-buffer-alist
	     '("\\*Occur\\*"
	       (display-buffer-reuse-mode-window
		display-buffer-in-side-window)
	       (side . bottom)
	       (slot . 0)
	       (window-height . 0.3)
	       (dedicated . t)
	       (body-function . select-window)))

;;; Custom
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

