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
 '(completions-first-difference ((t (:foreground "#1b2c63" :bold t))))
 '(cursor ((t (:background "#000000"))))
 '(default ((t (:foreground "#14262e" :background "#f5f5f5" ))))
 '(diary ((t (:foreground "dark magenta"))))
 '(diff-added ((t (:background "#deedd5"))))
 '(diff-refine-added ((t :background "#c5dbb6")))
 '(diff-refine-removed ((t :background "#d1a9a9")))
 '(diff-removed ((t (:background "#e3c1c1"))))
 '(flymake-error ((t (:underline (:color "#9e3a3a" :style line)))))
 '(flymake-note ((t ((:underline (:color "#466b38" :style line))))))
 '(flymake-warning ((t (:underline (:color "#878335" :style line)))))
 '(font-lock-builtin-face ((t (:foreground "#630352"))))
 '(font-lock-comment-face ((t (:foreground "#4f4f4f"))))
 '(font-lock-constant-face ((t (:foreground "#005940"))))
 '(font-lock-function-name-face ((t (:foreground "#003274"))))
 '(font-lock-keyword-face ((t (:foreground "#460475"))))
 '(font-lock-string-face ((t (:foreground"#0c158a"))))
 '(font-lock-type-face ((t (:foreground "#4200a6"))))
 '(font-lock-variable-name-face ((t (:foreground "#002056"))))
 '(font-lock-warning-face ((t (:foreground "#780a00" :bold t))))
 '(fringe ((t (:background "#f2f2f2"))))
 '(highlight ((t (:background "#b8c1d6"))))
 '(hl-line ((t (:background "#daebed"))))
 '(minibuffer-prompt ((t (:foreground "#041644"))))
 '(mode-line ((t (:foreground "#000000" :background "#d3d3d3" :box "#a3a3a3"))))
 '(mode-line-inactive ((t (:foreground "#4d4d4d" :background "#d6d6d6" :box "#cccccc"))))
 '(region ((t (:background "#cccccc"))))
 '(secondary-selection ((t (:background "#cddbec"))))
 '(tab-bar ((t (:background "#d1d1d1"))))
 '(tab-bar-tab ((t (:foreground "#000000" :background "#d3d3d3" :box "#a3a3a3"))))
 '(tab-bar-tab-inactive ((t (:foreground "#4d4d4d" :inherit tab-bar-tab)))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
