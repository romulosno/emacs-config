;;; init.el -- init config
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)

(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file t)

(setq use-short-answers t)
(setq kill-whole-line t)
(setq visible-bell t)
(setq view-read-only t)
(setq inhibit-startup-screen t)
(setq isearch-lazy-count t)

(setq backup-directory-alist
      `(("" . ,(expand-file-name "backups" user-emacs-directory))))


(setq tab-always-indent 'complete)
(setq completions-max-height 15)
(setq completion-show-help nil)

(setq-default abbrev-mode t)
(setq save-abbrevs 'silently)

(setq repeat-exit-key "RET")

(setq org-confirm-babel-evaluate nil)
(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (shell . t)
   (python . t)))

(add-hook 'prog-mode-hook #'electric-pair-local-mode)
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)

(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

(setq eglot-sync-connect nil)
(setq eglot-autoshutdown t)

(add-hook 'go-mode-hook #'eglot-ensure)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(add-hook 'go-mode-hook #'eglot-ensure)

(with-eval-after-load 'dired
  (require 'dired-aux)
  (require 'dired-x))

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq delete-by-moving-to-trash t)

(add-hook 'dired-mode-hook #'dired-hide-details-mode)
(add-hook 'dired-mode-hook #'hl-line-mode)

(setq smerge-command-prefix "\e")
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

(setq outline-minor-mode-prefix "\M-o"
      outline-minor-mode-cycle t
      outline-minor-mode-cycle-filter 'bolp)

(savehist-mode 1)
(save-place-mode 1)
(repeat-mode 1)

(global-set-key (kbd "C-z") #'repeat)
(global-set-key (kbd "C-c o") #'outline-minor-mode)
(global-set-key (kbd "C-c s") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
