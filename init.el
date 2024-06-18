;;; init.el -- emacs config . -*- lexical-binding: t; -*-
(when (< emacs-major-version 27) (package-initialize))

;;; GUI elements
(scroll-bar-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(when (member "Hack" (font-family-list))
  (add-to-list 'default-frame-alist '(font . "Hack-10") t))

(defun set-frame-colors (frame)
  "Set frame colors unless FRAME is not in a terminal."
  (when (display-graphic-p frame)
    (set-face-background 'default "#f0efeb" frame)
    (set-face-background 'fringe "#eae7e1" frame)
    (set-face-background 'mode-line "#e3dfd8" frame)))

(add-hook 'after-make-frame-functions #'set-frame-colors)
(set-frame-colors (selected-frame))


;;; Better defaults
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(setq use-short-answers t)
(setq kill-whole-line t)
(setq disabled-command-function nil)
(setq visible-bell t)
(setq read-process-output-max (* 1024 1024))

;; Server
(require 'server)
(or (server-running-p)
    (server-start))

;;; Global keys
(global-set-key (kbd "C-c k") #'kill-current-buffer)
(global-set-key (kbd "C-c h") #'hl-line-mode)

;;;; Cases
(global-set-key (kbd "M-u") #'upcase-dwim)
(global-set-key (kbd "M-l") #'downcase-dwim)
(global-set-key (kbd "M-c") #'capitalize-dwim)

;;; Isearch
(setq isearch-lazy-count t)
(setq isearch-allow-scroll 'unlimited)
(setq isearch-yank-on-move 'shift)
(setq isearch-allow-motion t)
(setq isearch-motion-changes-direction nil)

;;; Scroll
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-follow-mouse t)
(setq scroll-step 1)
(setq view-read-only t)

;;; Init screen
(setq inhibit-startup-screen t)
(setq initial-scratch-message nil)
(setq initial-major-mode 'text-mode)

;;; Backups
(setq backup-directory-alist
      `(("" . ,(expand-file-name "backups" user-emacs-directory))))

(setq backup-by-copying t)
(setq version-control t)
(setq kept-old-versions 2)
(setq kept-new-versions 5)
(setq delete-old-versions t)

;;; Completions
(add-to-list 'completion-styles 'flex t)
(setq-default abbrev-mode t)
(setq tab-always-indent 'complete)
(setq completions-max-height 15)
(setq completion-show-help nil)

;;; Repeat
(setq repeat-exit-key "RET")
(global-set-key (kbd "C-z") #'repeat)
(repeat-mode 1)

;;; Global modes
(savehist-mode 1)
(save-place-mode 1)
(global-so-long-mode 1)

;;; Winner
(setq winner-dont-bind-my-keys t)
(winner-mode 1)

(define-key ctl-x-x-map (kbd "<right>") #'winner-redo)
(define-key ctl-x-x-map (kbd "<left>") #'winner-undo)

;;; Windmove
(global-set-key (kbd "C-c <left>") #'windmove-left)
(global-set-key (kbd "C-c <right>") #'windmove-right)
(global-set-key (kbd "C-c <up>") #'windmove-up)
(global-set-key (kbd "C-c <down>") #'windmove-down)

;;; Outline
(setq outline-minor-mode-cycle t)
(setq outline-minor-mode-cycle-filter 'bolp)
(setq outline-minor-mode-prefix "\M-o")

(global-set-key (kbd "C-c o") #'outline-minor-mode)

(add-hook 'outline-minor-mode-hook
	  (lambda ()
	    (if outline-minor-mode
		(reveal-mode 1)
	      (reveal-mode -1))))

;;; Org
(setq org-startup-indented t)
(setq org-use-speed-commands t)
(setq org-return-follows-link t)
(setq org-imenu-depth 7)
(setq org-cycle-separator-lines 0)
(setq org-id-link-to-org-use-id 'create-if-interactive-and-no-custom-id)
(setq org-enforce-todo-dependencies t)
(setq org-enforce-todo-checkbox-dependencies t)
(setq org-export-headline-levels 8)
(setq org-fontify-done-headline nil)

;;;; Log
(setq org-log-done 'time)
(setq org-log-into-drawer t)

;;;; Tags
(setq org-auto-align-tags nil)
(setq org-tags-column 0)

;;;; Refile
(setq org-refile-use-outline-path t)
(setq org-refile-allow-creating-parent-nodes t)

;;;; Org Babel
(setq org-babel-python-command "python3")
(setq org-confirm-babel-evaluate nil)
(setq org-src-window-setup 'current-window)
(setq org-src-preserve-indentation t)
(setq org-edit-src-content-indentation 0)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((emacs-lisp . t)
   (python . t)))

;;;; Keybindings
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c s") #'org-capture)
(global-set-key (kbd "C-c l") #'org-store-link)

;;; Prog
(add-hook 'prog-mode-hook (lambda ()
			    (electric-indent-local-mode)
			    (electric-pair-local-mode)
			    (display-line-numbers-mode)))

;;;; Compilation
(add-hook 'compilation-filter-hook #'ansi-color-compilation-filter)
(add-hook 'compilation-mode-hook #'rename-uniquely)

;;;; Flymake
(setq flymake-suppress-zero-counters t)
(setq flymake-mode-line-format
      '("" flymake-mode-line-exception flymake-mode-line-counters))
(setq flymake-mode-line-counter-format
      '(" " flymake-mode-line-error-counter
        flymake-mode-line-warning-counter
        flymake-mode-line-note-counter " "))

(with-eval-after-load 'flymake
  (define-key flymake-mode-map (kbd "C-c c l") #'flymake-show-project-diagnostics)
  (define-key flymake-mode-map (kbd "M-n") #'flymake-goto-next-error)
  (define-key flymake-mode-map (kbd "M-p") #'flymake-goto-prev-error))

;;;; Java
(add-hook 'java-mode-hook (lambda ()
			    (setq c-basic-offset 4)
                            (setq tab-width 4)
                            (setq indent-tabs-mode t)))

;;;; JS
(setq js-indent-level 2)
(setq js-chain-indent t)

;;;; Eldoc
(setq eldoc-documentation-strategy 'eldoc-documentation-compose-eagerly)
(setq eldoc-echo-area-use-multiline-p 3)

;;;; Eglot
(setq eglot-sync-connect nil)
(setq eglot-autoshutdown t)

(with-eval-after-load 'eglot
  (define-key eglot-mode-map (kbd "C-c c a") #'eglot-code-actions)
  (define-key eglot-mode-map (kbd "C-c c f") #'eglot-format)
  (define-key eglot-mode-map (kbd "C-c c r") #'eglot-rename))

(add-hook 'go-mode-hook #'eglot-ensure)
(add-hook 'java-mode-hook #'eglot-java-mode)

;;; Dired
(with-eval-after-load 'dired
  (require 'dired-aux)
  (require 'dired-x))

(setq dired-recursive-deletes 'always)
(setq dired-recursive-copies 'always)
(setq delete-by-moving-to-trash t)
(setq dired-auto-revert-buffer #'dired-directory-changed-p)
(setq dired-listing-switches
      "-AGFhlv --group-directories-first --time-style=long-iso")

(add-hook 'dired-mode-hook
	  (lambda ()
	    (setq truncate-lines t)
	    (setq dired-isearch-filenames 'dwim)
	    (dired-hide-details-mode)
	    (hl-line-mode)))

;;; VC
(setq vc-handled-backends '(Git))
(setq vc-git-revision-complete-only-branches t)

(with-eval-after-load 'vc-dir
  (define-key vc-dir-mode-map (kbd "e") #'vc-ediff))

;;;; Diff
(setq diff-default-read-only t)
(setq diff-font-lock-syntax nil)

(setq smerge-command-prefix "\e")

;;;; Ediff
(setq ediff-window-setup-function 'ediff-setup-windows-plain)
(setq ediff-split-window-function 'split-window-horizontally)
(setq ediff-keep-variants nil)

;;; Local vars
;; Local Variables:
;; outline-regexp: "\\;;;\\|;;;;\\|;; Local"
;; End:
