(setq gc-cons-threshold 3200000)

(add-to-list 'default-frame-alist '(width . 100))
(add-to-list 'default-frame-alist '(height . 40))

(cond
 ((find-font (font-spec :name "Ubuntu Mono"))
  (set-face-font 'default "Ubuntu Mono-12"))
 ((find-font (font-spec :name "Liberation Mono"))
  (set-face-font 'default "Liberation Mono-10")))

(set-face-attribute 'default nil :background "#f5f3ef" :foreground "#0a0c10")
(set-face-attribute 'fringe nil :background "#f5f3ef" :foreground "#0a0c10")
(set-face-attribute 'mode-line nil :background "#cfcdca" :foreground "#0a0c10" :box nil)
(set-face-attribute 'font-lock-comment-face nil :foreground "gray30")

(setq frame-background-mode 'light)

(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(savehist-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)

(setq inhibit-startup-screen t)
(setq initial-major-mode 'fundamental-mode)
(setq initial-scratch-message nil)

(setq use-short-answers t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq view-read-only t)

(put 'dired-find-alternate-file 'disabled nil)
(put 'narrow-to-region 'disabled nil)

(setq backup-directory-alist `(("" . ,(expand-file-name "backups" user-emacs-directory))))

(global-set-key (kbd "M-c") #'capitalize-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-u") #'upcase-dwim)

(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c b") #'ibuffer)
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c f") #'find-name-dired)

(setq isearch-lazy-count t)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-scroll t)

(setq completion-show-help nil)
(setq-default abbrev-mode t)
(setq save-abbrevs 'silently)

(setq ibuffer-use-other-window t)

(setq repeat-exit-key "RET")
(repeat-mode 1)

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
(define-key prog-mode-map (kbd "<f5>") #'compile)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

(setq eglot-sync-connect nil)
(setq eglot-autoshutdown t)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(with-eval-after-load 'dired
  (require 'dired-aux)
  (require 'dired-x))

(setq dired-kill-when-opening-new-dired-buffer t)
(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq delete-by-moving-to-trash t)
(add-hook 'dired-mode-hook #'dired-hide-details-mode)

(setq smerge-command-prefix "\e")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq diff-font-lock-syntax nil)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)
