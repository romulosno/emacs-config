;;; rom-day-theme.el --- rom-day

(deftheme rom-day)

(custom-theme-set-variables
 'rom-day
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'rom-day
 '(cursor ((t (:background "#cf8300"))))
 '(completions-common-part ((t (:foreground "#4f4941"))))
 '(default ((t (:foreground "#000000" :background "#f7f7f7"))))
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
 '(font-lock-function-name-face ((t (:foreground "#8c3a00"))))
 '(font-lock-keyword-face ((t (:foreground "#003947")))) ;#5c0a5c
 '(font-lock-string-face ((t (:foreground "#00332a"))))
 '(font-lock-type-face ((t (:foreground "#4a005c"))))
 '(font-lock-variable-name-face ((t (:foreground "#1d3759"))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#f2f2f2"))))
 '(highlight ((t (:background "#c2cbd3"))))
 '(isearch ((t (:foreground "#b0e2ff" :background "#4682b4"))))
 '(minibuffer-prompt ((t (:foreground "#171f34"))))
 '(mode-line ((t (:foreground "#000000" :background "#b2c9d6"))))
 '(region ((t (:background "#c4c4c4"))))
 '(secondary-selection ((t (:background "#cad8db"))))
 '(success ((t :foreground "#1c6625")))
 '(tab-bar ((t (:foreground "#000000" :background "#c7c3bf"))))
 '(tab-bar-tab ((t (:foreground "#000000" :background "#ebe9e6"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :italic t))))
 '(warning ((t (:foreground "#805801")))))


(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
