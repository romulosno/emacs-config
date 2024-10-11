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
(setq modus-themes-mixed-fonts t)
(load-theme 'modus-operandi t)

(cond
 ((find-font (font-spec :name "Hack"))
  (set-face-font 'default "Hack-10"))
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
(install-packages company)
(add-hook 'prog-mode-hook #'company-mode)

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
(setq vc-git-show-stash 0)
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
(global-set-key (kbd "<f5>") #'compile)
(add-hook 'prog-mode-hook #'electric-pair-local-mode)

(install-packages (dockerfile-mode go-mode eglot yaml-mode groovy-mode kotlin-mode))

;;;; Java
(add-hook 'java-mode-hook (lambda ()
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

(install-packages eglot-java)
(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "<f5>") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "<f6>") #'eglot-rename)
  (define-key eglot-mode-map (kbd "<f7>") #'eglot-format)
  (add-to-list 'eglot-server-programs
             `((java-mode java-ts-mode) .
               ("jdtls"
                :initializationOptions
                (:bundles
		 ["/home/romulo/Libs/java-debug/com.microsoft.java.debug.plugin/target/com.microsoft.java.debug.plugin-0.53.0.jar"])))))

;;; DAP
(install-packages dape)
(setq dape-buffer-window-arrangement 'right)

(with-eval-after-load 'dape
  (dape-breakpoint-global-mode)
  (add-hook 'kill-emacs-hook #'dape-breakpoint-save)
  (add-hook 'after-init #'dape-breakpoint-load))

(add-hook 'dape-display-source-hook #'pulse-momentary-highlight-one-line)

;;; Display buffer
(global-set-key (kbd "C-c w") #'window-toggle-side-windows)

(defun fit-window-to-buffer-max-one-third-frame (&optional window)
  "fit window to buffer size, but use max one third of current frame height."
  (interactive)
  (let ((wnd (or window (selected-window)))
        (max-height (/ (frame-height) 3)))
    (fit-window-to-buffer window max-height)))
  
(add-to-list 'display-buffer-alist
	     '("\\*Completions\\*"
	       (display-buffer-reuse-mode-window
	       display-buffer-in-side-window)
	       (mode completion-list-mode)
	       (side . bottom)
	       (slot . -1)
	       (dedicated . t)
	       (window-height . fit-window-to-buffer-max-one-third-frame)))

(add-to-list 'display-buffer-alist
	     '("\\*e?shell\\*"
	       display-buffer-in-side-window
	       (side . bottom)
	       (dedicated . t)
	       (slot . 1)
	       (window-parameters . ((no-delete-other-windows . t)))
	       (window-height . 0.33)))

;;; Tab bar
(setq tab-bar-select-tab-modifiers '(meta))
(setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
(setq tab-bar-show 1)

;;; Custom
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

;; Local Variables:
;; page-delimiter: ";;;"
;; eval: (outline-minor-mode 1)
;; End:
