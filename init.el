;; Config
;;; Packages config
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archive-priorities '(("elpa" . 3)
				   ("melpa" . 2)
				   ("nongnu" . 1)))

(defmacro install-packages (packages)
  "Install one or a list of PACKAGES without needing to quote."
  (let ((pkg-list (if (listp packages)
                      packages
                    (list packages))))
    `(progn
       ,@(mapcar (lambda (pkg)
                   `(unless (package-installed-p ',pkg)
                      (package-install ',pkg)))
                 pkg-list))))

;;; Server
(require 'server)
(unless (server-running-p)
  (server-start))

;;; Global modes
(column-number-mode 1)
(savehist-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)

;;; Font and theme
(install-packages modus-themes)
(load-theme 'modus-operandi t)

(cond
 ((find-font (font-spec :name "Julia Mono"))
  (set-face-font 'default "Julia Mono-10"))
 ((find-font (font-spec :name "Ubuntu Mono"))
  (set-face-font 'default "Ubuntu Mono-11"))
 ((find-font (font-spec :name "DejaVu Sans Mono"))
  (set-face-font 'default "DejaVu Sans Mono-10")))

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

(install-packages markdown-mode)

;;; Version Control
(install-packages git-timemachine)
(setq vc-git-show-stash nil)
(setq make-backup-files nil)
(setq smerge-command-prefix "\e")

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)

;; Case control
(global-set-key (kbd "M-c") #'capitalize-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-u") #'upcase-dwim)

;; Search
(global-set-key (kbd "C-c f") #'find-name-dired)
(global-set-key (kbd "C-c g") #'grep)
(global-set-key (kbd "C-c r") #'rgrep)

;; Outline
(global-set-key (kbd "C-c o") #'outline-minor-mode)

(setq outline-minor-mode-prefix (kbd "M-o"))
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)

(add-hook 'outline-minor-mode-hook
	  (lambda ()
	    (if outline-minor-mode
		(reveal-mode 1)
	      (reveal-mode 0))))

;;; Code
(define-key prog-mode-map (kbd "<f5>") #'compile)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

(install-packages (dockerfile-mode go-mode eglot yaml-mode))

;;; Compilation
(setq compilation-max-output-line-length nil)
(setq compilation-auto-jump-to-first-error 'if-location-known)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

;; Command compile buffer name
(setq compilation-buffer-name-function
      (lambda (name-of-mode)
	(format "*%s<%s>*" (car compile-history) default-directory)))

;;; Eldoc
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;; LSP
(setq read-process-output-max (* 3 1024 1024))
(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "C-c e p") #'flymake-goto-prev-error)
  (define-key flymake-mode-map (kbd "C-c e l") #'flymake-show-buffer-diagnostics)
  (define-key flymake-mode-map (kbd "C-c e L") #'flymake-show-project-diagnostics))

;;; DAP
(install-packages dape)
(setq dape-buffer-window-arrangement 'right)

(with-eval-after-load 'dape
  (dape-breakpoint-global-mode)
  (add-hook 'kill-emacs-hook #'dape-breakpoint-save)
  (add-hook 'after-init #'dape-breakpoint-load))

(add-hook 'dape-display-source-hook #'pulse-momentary-highlight-one-line)

;;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Local Variables:
;; page-delimiter: ";;;"
;; eval: (outline-minor-mode 1)
;; End:
