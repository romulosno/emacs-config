;;; init.el --- Emacs config -*- lexical-binding: t; -*-
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

;; UI
(when (find-font (font-spec :name "RecMono Linear"))
  (add-to-list 'default-frame-alist '(font . "RecMono Linear-11")))

(load-theme 'rom-day t)
(load-theme 'rom-night t t)

;; Init screen
(setq initial-major-mode 'fundamental-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)

;; Mode line
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                (:propertize ("" mode-line-mule-info mode-line-modified)
                             display (min-width (6.0)))
                " " mode-line-buffer-identification
                " " mode-line-modes
                mode-line-format-right-align
                (project-mode-line project-mode-line-format)
                (vc-mode vc-mode)
                "  "
                mode-line-misc-info
                "[L:%l/C:%c] "
                mode-line-percent-position " "
                mode-line-end-spaces))

;; Indentation
(setq-default tab-width 4)
(setq c-basic-offset 2)
(setq js-indent-level 2)

;; Misc
(setq frame-resize-pixelwise t)
(setq frame-inhibit-implied-resize t)

(setq echo-keystrokes 0.02)
(setq use-short-answers t)
(setq kill-whole-line t)
(setq view-read-only t)
(setq ring-bell-function 'ignore)
(setq confirm-nonexistent-file-or-buffer nil)
(setq sentence-end-double-space nil)
(setq uniquify-buffer-name-style 'forward)
(setq delete-by-moving-to-trash t)
(setq save-interprogram-paste-before-kill t)
(setq require-final-newline t)

;; Files / Backup / Autosave
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)
(setq backup-directory-alist
      `((,tramp-file-name-regexp . ,temporary-file-directory)
        ("." . ,(locate-user-emacs-file "backups"))))
(setq auto-save-file-name-transforms
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory) t)))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-auto-save/" user-emacs-directory))

(save-place-mode 1)

;; Isearch
(setq isearch-lazy-count t)
(setq isearch-allow-scroll t)
(setq isearch-yank-on-move 'shift)
(setq isearch-lazy-highlight 'all-windows)
(setq search-upper-case t)

;; Imenu
(setq imenu-flatten 'prefix)
(setq imenu-auto-rescan t)

;; Scroll
(setq scroll-preserve-screen-position t)
(setq fast-but-imprecise-scrolling t)
(setq scroll-conservatively 1)

(setq hscroll-margin 2)
(setq hscroll-step 1)

;; Window divider
(setq window-divider-default-bottom-width 0)
(setq window-divider-default-places t)
(setq window-divider-default-right-width 1)
(window-divider-mode 1)

;; Buffer menu
(add-to-list 'display-buffer-alist
             '("\\*Buffer List\\*" nil (body-function . select-window)))

(define-key Buffer-menu-mode-map (kbd "q") #'kill-buffer-and-window)
(define-key Buffer-menu-mode-map (kbd "O") #'Buffer-menu-multi-occur)

;; JIT
(defun optimize-large-files ()
  (when (> (buffer-size) (* 2 1024 1024))
  (setq-local jit-lock-defer-time 0.1)
  (setq-local jit-lock-stealth-time 0.1)))

(add-hook 'find-file-hook #'optimize-large-files)

(setq jit-lock-chunk-size 3500)
(setq font-lock-maximum-decoration '((c-mode . 2) (c++-mode . 2) (t . t)))

;; Prog
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq tags-revert-without-query t)

(setq compilation-ask-about-save nil)
(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)
(setq compilation-auto-jump-to-first-error 'if-location-known)
(global-set-key (kbd "<f5>") #'compile)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 0))
(setq read-process-output-max (* 3 1024 1024))
(setq eglot-ignored-server-capabilities '(:hoverProvider :documentHighlightProvider))

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c e") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

;; Completions
(setq completion-styles '(basic partial-completion substring))
(setq tab-always-indent 'complete)
(setq completions-format 'vertical)
(setq completions-max-height 20)
(setq completion-show-help nil)
(setq completion-category-overrides
      '((project-file (styles . (basic flex initials)))))

(add-to-list 'completion-ignored-extensions ".exe")

(define-key completion-in-region-mode-map (kbd "C-<return>") #'switch-to-completions)

;; Repeat
(setq repeat-exit-key "RET")
(repeat-mode 1)

;; Minibuffer
(setq enable-recursive-minibuffers t)
(setq read-minibuffer-restore-windows nil)
(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(minibuffer-depth-indicate-mode 1)

;; Savehist
(setq savehist-additional-variables '(kill-ring
                                      register-alist
                                      mark-ring
                                      global-mark-ring
                                      search-ring
                                      regexp-search-ring))
(savehist-mode 1)

;; Eval expression
(setq eval-expression-print-level nil)
(setq eval-expression-print-length nil)

;; Dired
(require 'dired-aux)
(require 'dired-x)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-create-destination-dirs 'ask)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-vc-rename-file t)

(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

(defun dired-goto-existing-file (filename)
  (interactive (nbutlast (find-file-read-args "Find existing file: " t)))
  (dired-goto-file (expand-file-name filename)))

(define-key dired-mode-map (kbd "j") #'dired-goto-existing-file)
(global-set-key (kbd "C-c n") #'find-name-dired)
(global-set-key (kbd "C-c f") #'find-file-existing)

;; Symlinks
(setq find-file-visit-truename t)
(setq vc-follow-symlinks t)

;; Version Control
(setq vc-git-show-stash 0)
(setq vc-git-print-log-follow t)
(setq vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq diff-default-read-only t)
(setq smerge-command-prefix "\e")

;; Org
(setq org-use-speed-commands t)
(setq org-log-into-drawer t)
(setq org-hide-emphasis-markers t)
(setq org-return-follows-link t)

(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)

(with-eval-after-load 'org
  (define-key org-mode-map (kbd "C-M-<return>") #'org-insert-subheading))

;; Tab bar
(setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
(setq tab-bar-select-tab-modifiers '(meta))
(setq tab-bar-show 1)

;; Empty lines
(defun delete-multi-empty-lines ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\n\\{2,\\}" "\n\n")))

;; Keybindings
(global-set-key (kbd "<remap> <count-words-region>") #'count-words)
(global-set-key (kbd "<remap> <capitalize-word>") #'capitalize-dwim)
(global-set-key (kbd "<remap> <downcase-word>") #'downcase-dwim)
(global-set-key (kbd "<remap> <upcase-word>") #'upcase-dwim)
(global-set-key (kbd "<remap> <zap-to-char>") #'zap-up-to-char)

(global-set-key (kbd "M-o") #'other-window)
(global-set-key (kbd "C-c h") #'hl-line-mode)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c m") #'point-to-register)
(global-set-key (kbd "C-c '") #'jump-to-register)
(global-set-key (kbd "C-z") #'repeat)

;; Custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
