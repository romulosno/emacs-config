;;; core.el --- Core settings -*- lexical-binding: t; -*-

;; Packages
(require 'package)
(setq package-archives
      '(("gnu"    . "https://elpa.gnu.org/packages/")
        ("nongnu" . "https://elpa.nongnu.org/nongnu/")
        ("melpa"  . "https://melpa.org/packages/")))

(package-initialize)

(let ((package-list
       '(dockerfile-mode
         exec-path-from-shell
         go-mode
         kotlin-mode
         yaml-mode
         markdown-mode)))
  (dolist (p package-list)
    (unless (package-installed-p p)
      (package-install p))))

;; Startup / Init
(setq initial-major-mode 'fundamental-mode
      inhibit-startup-screen t
      inhibit-splash-screen t
      initial-scratch-message nil)

(when (eq system-type 'gnu/linux)
  (add-hook 'after-init-hook #'exec-path-from-shell-initialize))

;; Files / Backup / Autosave
(setq backup-by-copying t
      delete-old-versions t
      version-control t)

(setq backup-directory-alist
      `((,tramp-file-name-regexp . ,temporary-file-directory)
        ("." . ,(locate-user-emacs-file "backups"))))

(setq auto-save-list-file-prefix
      (expand-file-name "auto-save/" user-emacs-directory))

(setq tramp-auto-save-directory
      (expand-file-name "tramp-auto-save/" user-emacs-directory))

(setq save-place-file
      (expand-file-name "save-place" user-emacs-directory))
(save-place-mode 1)

(setq read-process-output-max (* 3 1024 1024))
(setq use-short-answers t)

(setq delete-by-moving-to-trash t)

(when (eq system-type 'windows-nt)
  (let ((grep-path "c:/Users/romul/Programas/grep/bin")
        (find-path "c:/Users/romul/Programas/find/bin"))

    (setenv "PATH" (concat grep-path ";" find-path ";" (getenv "PATH")))
    (add-to-list 'exec-path grep-path)
    (add-to-list 'exec-path find-path)

    (setq find-program (expand-file-name "find.exe" find-path))
    (setq grep-program (expand-file-name "grep.exe" grep-path))))

(provide 'rom-core)
