;;; init.el --- Emacs config -*- lexical-binding: t; -*-
(setq package-archives '(("gnu" . "https://elpa.gnu.org/packages/")
                         ("nongnu" . "https://elpa.nongnu.org/nongnu/")
                         ("melpa" . "https://melpa.org/packages/")))

;; UI
(when (find-font (font-spec :name "Hack"))
  (add-to-list 'default-frame-alist '(font . "Hack-11")))

(load-theme 'rom-day t)
(load-theme 'rom-night t t)

(add-to-list 'display-buffer-alist
             '("\\*Buffer List\\*" nil (body-function . select-window)))

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
(setq-default indent-tabs-mode nil)
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
      `((".*" ,(expand-file-name "auto-save/" user-emacs-directory))))
(setq tramp-auto-save-directory
      (expand-file-name "tramp-auto-save/" user-emacs-directory))

(save-place-mode 1)

;; Isearch
(setq isearch-lazy-count t)
(setq isearch-allow-scroll t)
(setq isearch-yank-on-move 'shift)
(setq isearch-lazy-highlight 'all-windows)

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

;; JIT
(when (> (buffer-size) (* 2 1024 1024))
  (setq-local jit-lock-defer-time 0.1)
  (setq-local jit-lock-stealth-time 0.1))

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

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 0))
(setq read-process-output-max (* 3 1024 1024))

(with-eval-after-load 'eglot
  (keymap-set eglot-mode-map "C-c c r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c c f" #'eglot-format)
  (keymap-set eglot-mode-map "C-c c a" #'eglot-code-actions))

(with-eval-after-load 'flymake
  (keymap-set flymake-mode-map "C-c e" #'flymake-show-project-diagnostics)
  (keymap-set flymake-mode-map "M-n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "M-p" #'flymake-goto-prev-error))

;; Completions
(setq completion-styles '(basic partial-completion substring))
(setq tab-always-indent 'complete)
(setq dabbrev-case-fold-search nil)
(setq completions-format 'vertical)
(setq completions-max-height 20)
(setq completion-show-help nil)
(setq completion-category-overrides
      '((file         (styles . (basic partial-completion substring flex)))
        (project-file (styles . (basic flex initials)))))

(setq completion-ignore-case t)
(setq read-file-name-completion-ignore-case t)
(setq read-buffer-completion-ignore-case t)

(add-to-list 'completion-ignored-extensions ".exe")

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

;; Tab bar
(setq tab-bar-close-last-tab-choice 'tab-bar-mode-disable)
(setq tab-bar-select-tab-modifiers '(meta))

(require 'tab-bar)

(defun maybe-disable-tab-bar (&rest _)
  (when (= (length (tab-bar-tabs)) 2) 	;tab-bar eh bugado, num de tabs -1
    (tab-bar-mode -1)))
(setq tab-bar-tab-post-select-functions'(maybe-disable-tab-bar))

;; Utils functions

(defun multi-occur-match-in-all-buffers ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively #'multi-occur-in-matching-buffers)))

(defun delete-multi-empty-lines ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\n\\{2,\\}" "\n\n")))

;; Outline
(add-to-list 'load-path (locate-user-emacs-file "lisp"))
(require 'outline-imenu-sync)

(global-outline-imenu-sync-mode 1)

;; Keymaps
(keymap-global-set "<remap> <count-words-region>" #'count-words)
(keymap-global-set "<remap> <capitalize-word>" #'capitalize-dwim)
(keymap-global-set "<remap> <downcase-word>" #'downcase-dwim)
(keymap-global-set "<remap> <upcase-word>" #'upcase-dwim)
(keymap-global-set "<remap> <zap-to-char>" #'zap-up-to-char)

(keymap-global-set "M-o" #'other-window)
(keymap-global-set "C-c t" #'transpose-regions)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c n" #'find-name-dired)
(keymap-global-set "C-c o" #'multi-occur-match-in-all-buffers)
(keymap-global-set "C-c f" #'find-file-existing)
(keymap-global-set "C-c h" #'hl-line-mode)
(keymap-global-set "C-c k" #'kill-current-buffer)
(keymap-global-set "C-c l" #'org-store-link)
(keymap-global-set "C-c m" #'point-to-register)
(keymap-global-set "C-c '" #'jump-to-register)
(keymap-global-set "<f5>" #'compile)
(keymap-global-set "C-z" #'repeat)

(keymap-set Buffer-menu-mode-map "q" #'kill-buffer-and-window)
(keymap-set completion-in-region-mode-map "C-<return>" #'switch-to-completions)

(with-eval-after-load 'org
  (keymap-set org-mode-map "C-M-<return>" #'org-insert-subheading))

;; Custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
