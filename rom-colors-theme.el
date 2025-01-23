;;; rom-colors-theme.el --- rom-colors
(deftheme rom-colors
  "My own theme"
  :family 'rom
  :kind 'color-scheme
  :background-mode 'light)

(custom-theme-set-variables
 'rom-colors
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'rom-colors
 '(compilation-error ((t (:foreground "#9e3a3a"))))
 '(compilation-info ((t (:foreground "#466b38"))))
 '(compilation-warning ((t (:foreground "#878335"))))
 '(completions-common-part ((t (:foreground "#2a3d6b"))))
 '(completions-first-difference ((t (:foreground "#1b2c63" :weight bold))))
 '(cursor ((t (:background "#4a58a1"))))
 '(default ((t (:foreground "black" :background "#fbf9f4"))))
 '(diff-added ((t (:background "#deedd5"))))
 '(diff-refine-added ((t :background "#c5dbb6")))
 '(diff-refine-removed ((t :background "#d1a9a9")))
 '(diff-removed ((t (:background "#e3c1c1"))))
 '(flymake-error ((t (:underline (:color "#9e3a3a" :style line)))))
 '(flymake-note ((t ((:underline (:color "#466b38" :style line))))))
 '(flymake-warning ((t (:underline (:color "#878335" :style line)))))
 '(font-lock-builtin-face ((t (:foreground "#184347"))))
 '(font-lock-comment-face ((t (:foreground "#62625c"))))
 '(font-lock-constant-face ((t (:foreground "#59195a"))))
 '(font-lock-function-name-face ((t (:foreground "#2f5c00"))))
 '(font-lock-keyword-face ((t (:foreground "#002b75"))))
 '(font-lock-string-face ((t (:foreground "#005285"))))
 '(font-lock-type-face ((t (:foreground "#4d3b00"))))
 '(font-lock-variable-name-face ((t (:foreground "#615631"))))
 '(font-lock-warning-face ((t (:foreground "#571717" :weight bold))))
 '(fringe ((t (:background "#fcf9f3"))))
 '(highlight ((t (:background "#b8c1d6"))))
 '(hl-line ((t (:background "#b3c2e6"))))
 '(minibuffer-prompt ((t (:foreground "#2f1c49"))))
 '(mode-line ((t (:foreground "black" :background "#c4c4b8" :box "#93938a"))))
 '(region ((t (:background "#d4d4c5"))))
 '(secondary-selection ((t (:background "#e6e6c2"))))
 '(tab-bar ((t (:foreground "black" :background "#c4c4b8"))))
 '(tab-bar-tab ((t (:foreground "black" :background "#b0b0a5"))))
 '(tab-bar-tab-inactive ((t (:foreground "#525252" :background "#c4c4b8")))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'rom-colors)
;;; rom-colors-theme.el ends here
