;;; rom-day-theme.el --- rom-day  -*- lexical-binding: t; -*-
(deftheme rom-day
  "My light theme"
  :family 'rom
  :kind 'color-scheme
  :background-mode 'light)

(custom-theme-set-variables
 'rom-day
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'rom-day
 '(compilation-error ((t (:foreground "#9e3a3a"))))
 '(compilation-info ((t (:foreground "#466b38"))))
 '(compilation-warning ((t (:foreground "#878335"))))
 '(completions-common-part ((t (:foreground "#2a3d6b"))))
 '(completions-first-difference ((t (:foreground "#1b2c63" :weight bold))))
 '(cursor ((t (:background "#000000"))))
 '(default ((t (:foreground "#111111" :background "#fdfdfd"))))
 '(diary ((t (:foreground "dark magenta"))))
 '(diff-added ((t (:background "#deedd5"))))
 '(diff-refine-added ((t :background "#c5dbb6")))
 '(diff-refine-removed ((t :background "#d1a9a9")))
 '(diff-removed ((t (:background "#e3c1c1"))))
 '(flymake-error ((t (:underline (:color "#9e3a3a" :style line)))))
 '(flymake-note ((t ((:underline (:color "#466b38" :style line))))))
 '(flymake-warning ((t (:underline (:color "#878335" :style line)))))
 '(font-lock-builtin-face ((t (:foreground "#65073d"))))
 '(font-lock-comment-face ((t (:foreground "#515151"))))
 '(font-lock-constant-face ((t (:foreground "#773603"))))
 '(font-lock-function-name-face ((t (:foreground "#5c0051"))))
 '(font-lock-keyword-face ((t (:foreground "#65003a"))))
 '(font-lock-string-face ((t (:foreground "#0a359e"))))
 '(font-lock-type-face ((t (:foreground "#040d3c"))))
 '(font-lock-variable-name-face ((t (:foreground "#06324d"))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#fdfdfd"))))
 '(highlight ((t (:background "#b8c1d6"))))
 '(hl-line ((t (:background "#daebed"))))
 '(minibuffer-prompt ((t (:foreground "#080c53"))))
 '(minibuffer-prompt ((t (:foreground "#7299ff" :bold t))))
 '(mode-line ((t (:foreground "#111111" :background "#c4c4bf"))))
 '(region ((t (:background "#dfe1eb"))))
 '(secondary-selection ((t (:background "#ddcdea"))))
 '(tab-bar ((t (:foreground "#111111" :background "#c1c4d4"))))
 '(tab-bar-tab ((t (:foreground "#111111" :background "#b1b5cc"))))
 '(tab-bar-tab-inactive ((t (:foreground "#525252" :background "#b1b5cc")))))

;;;###autoload
(and load-file-name
    (boundp 'custom-theme-load-path)
    (add-to-list 'custom-theme-load-path
                 (file-name-as-directory
                  (file-name-directory load-file-name))))

(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
