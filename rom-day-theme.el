;;; rom-day-theme.el --- rom-day

(deftheme rom-day)

(custom-theme-set-variables
 'rom-day
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'rom-day
 '(cursor ((t (:background "#000000"))))
 '(default ((t (:foreground "#000000" :background "#ebe9e6"))))
 '(diff-added ((t (:background "#daebda"))))
 '(diff-refine-added ((t (:background "#bce2be"))))
 '(diff-refine-removed ((t (:background "#f1caca"))))
 '(diff-removed ((t (:background "#f1dede"))))
 '(error ((t (:foreground "#961818"))))
 '(flymake-error ((t (:underline "#961818"))))
 '(flymake-note ((t (:underline "#1c6625"))))
 '(flymake-warning ((t (:underline "#805801"))))
 '(font-lock-builtin-face ((t (:foreground "#0f3d6b"))))
 '(font-lock-comment-face ((t (:foreground "#7d827d"))))
 '(font-lock-constant-face ((t (:foreground "#284d2b"))))
 '(font-lock-function-name-face ((t (:foreground "#004c6f"))))
 '(font-lock-keyword-face ((t (:foreground "#003947"))))
 '(font-lock-string-face ((t (:foreground "#3b2b52"))))
 '(font-lock-type-face ((t (:foreground "#08336e"))))
 '(font-lock-variable-name-face ((t (:foreground "#1d3759"))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#e4e3e1"))))
 '(isearch ((t (:foreground "#b0e2ff" :background "#4682b4"))))
 '(minibuffer-prompt ((t (:foreground "#171f34"))))
 '(mode-line ((t (:box (:line-width (1 . 1) :color "#969696" :style nil) :foreground "#000000" :background "#bbbbbb"))))
 '(region ((t (:background "#c2cbd3"))))
 '(secondary-selection ((t (:background "#c3c3c3"))))
 '(success ((t :foreground "#1c6625")))
 '(tab-bar ((t (:foreground "#000000" :background "#d4d8d9"))))
 '(tab-bar-tab ((t (:box (:line-width (2 . 2) :color "#f7f7f7" :style nil) :foreground "#000000" :background "#f7f7f7"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :italic t))))
 '(warning ((t (:foreground "#805801")))))


(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
