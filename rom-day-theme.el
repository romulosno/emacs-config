;;; rom-day-theme.el --- rom-day
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
 '(default ((t (:foreground "#000000" :background "#fafafa"))))
 '(diff-added ((t (:background "#deedd5"))))
 '(diff-refine-added ((t :background "#c5dbb6")))
 '(diff-refine-removed ((t :background "#d1a9a9")))
 '(diff-removed ((t (:background "#e3c1c1"))))
 '(flymake-error ((t (:underline (:color "#9e3a3a" :style line)))))
 '(flymake-note ((t ((:underline (:color "#466b38" :style line))))))
 '(flymake-warning ((t (:underline (:color "#878335" :style line)))))
 '(font-lock-builtin-face ((t (:foreground "#0b3d52"))))
 '(font-lock-comment-face ((t (:foreground "#2f584a"))))
 '(font-lock-constant-face ((t (:foreground "#472903"))))
 '(font-lock-function-name-face ((t (:foreground "#090440"))))
 '(font-lock-keyword-face ((t (:foreground "#251380"))))
 '(font-lock-string-face ((t (:foreground "#162980"))))
 '(font-lock-type-face ((t (:foreground "#3c2f58"))))
 '(font-lock-variable-name-face ((t (:foreground "#2b4233"))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#f2f2f2"))))
 '(highlight ((t (:background "#b8c1d6"))))
 '(hl-line ((t (:background "#f2efcb"))))
 '(minibuffer-prompt ((t (:foreground "#0f1e63"))))
 '(mode-line ((t (:foreground "#000000" :background "#dedede" :box "#696969"))))
 '(region ((t (:background "#cecece"))))
 '(secondary-selection ((t (:background "#d5e1f0"))))
 '(tab-bar ((t (:foreground "black" :background "#c5c5c5" :box "#5c5c5c"))))
 '(tab-bar-tab ((t (:foreground "black" :background "#c5c5c5"))))
 '(tab-bar-tab-inactive ((t (:foreground "#525252" :background "#c5c5c5")))))

(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
