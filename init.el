;;; init.el --- Emacs config -*- lexical-binding: t; -*-
(setq initial-major-mode 'fundamental-mode)
(setq inhibit-startup-screen t)
(setq inhibit-splash-screen t)
(setq initial-scratch-message nil)
(setq read-process-output-max (* 3 1024 1024))
(setq use-short-answers t)

(load-theme 'rom-day t)

;; Files / Backup / Autosave
(setq backup-by-copying t)
(setq delete-old-versions t)
(setq version-control t)
(setq backup-directory-alist `((,tramp-file-name-regexp . ,temporary-file-directory)
			       ("." . ,(locate-user-emacs-file "backups"))))

(setq auto-save-list-file-prefix (expand-file-name "auto-save/" user-emacs-directory))
(setq tramp-auto-save-directory (expand-file-name "tramp-auto-save/" user-emacs-directory))
(setq save-place-file (expand-file-name "save-place" user-emacs-directory))
(save-place-mode 1)

;; Prog
(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq compilation-ask-about-save nil)
(setq compilation-max-output-line-length nil)
(setq compilation-scroll-output 'first-error)
(setq compilation-auto-jump-to-first-error 'if-location-known)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 2)

(setq eglot-autoshutdown t)
(setq eglot-sync-connect nil)
(setq eglot-events-buffer-config '(:size 0))

(with-eval-after-load 'eglot
  (keymap-set eglot-mode-map "C-c c r" #'eglot-rename)
  (keymap-set eglot-mode-map "C-c c f" #'eglot-format)
  (keymap-set eglot-mode-map "C-c c a" #'eglot-code-actions))

(with-eval-after-load 'flymake
  (keymap-set flymake-mode-map "C-c e" #'flymake-show-project-diagnostics)
  (keymap-set flymake-mode-map "M-n" #'flymake-goto-next-error)
  (keymap-set flymake-mode-map "M-p" #'flymake-goto-prev-error))

;; Completions
(completion-preview-mode 1)
(setq completion-styles '(basic partial-completion substring))
(setq tab-always-indent 'complete)
(setq completions-format 'one-column)
(setq completions-max-height 20)
(setq completion-show-help nil)
(setq completions-header-format nil)
(setq completion-category-overrides
      '((file         (styles . (basic partial-completion substring flex)))
        (project-file (styles . (basic flex initials)))))

(setq repeat-exit-key "RET")
(repeat-mode 1)

;; Minibuffer
(setq enable-recursive-minibuffers t)
(setq read-minibuffer-restore-windows nil)
(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t face minibuffer-prompt))

(set-window-scroll-bars (minibuffer-window) nil nil nil nil 1)
(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(minibuffer-depth-indicate-mode 1)
(savehist-mode 1)

;; Dired
(require 'dired-aux)
(require 'dired-x)

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-create-destination-dirs 'ask)
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)
(setq dired-vc-rename-file t)
(setq ls-lisp-dirs-first t)
(setq ls-lisp-use-insert-directory-program nil)

;; Version Control
(setq vc-git-show-stash 0)
(setq vc-git-print-log-follow t)
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-keep-variants nil)
(setq smerge-command-prefix "\e")
(setq diff-default-read-only t)

;; Keymaps
(keymap-global-set "<remap> <count-words-region>" #'count-words)
(keymap-global-set "<remap> <capitalize-word>" #'capitalize-dwim)
(keymap-global-set "<remap> <downcase-word>" #'downcase-dwim)
(keymap-global-set "<remap> <upcase-word>" #'upcase-dwim)
(keymap-global-set "M-o" #'other-window)
(keymap-global-set "C-c t" #'transpose-regions)
(keymap-global-set "C-c a" #'org-agenda)
(keymap-global-set "C-c n" #'find-name-dired)
(keymap-global-set "C-c o" #'multi-occur-match-in-all-buffers)
(keymap-global-set "C-c f" #'find-file-existing)
(keymap-global-set "C-c h" #'hl-line-mode)
(keymap-global-set "C-c k" #'kill-current-buffer)
(keymap-global-set "C-c l" #'org-store-link)
(keymap-global-set "<f5>" #'compile)
(keymap-global-set "C-z" #'repeat)
(keymap-global-set "C-c m" #'point-to-register)
(keymap-global-set "C-c '" #'jump-to-register)
(keymap-set Buffer-menu-mode-map "q" #'kill-buffer-and-window)

;; Custom file
(setq custom-file (locate-user-emacs-file "custom.el"))
(load custom-file t)

;;; init.el ends here
