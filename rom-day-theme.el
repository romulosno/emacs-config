;;; rom-day-theme.el --- rom-day

(deftheme rom-day)

(custom-theme-set-variables
 'rom-day
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'rom-day
 '(cursor ((t (:background "#cf8300"))))
 '(completions-common-part ((t (:foreground "#4f4941"))))
 '(default ((t (:background "#fafafa" :foreground "#00001f"))))
 '(diff-added ((t (:background "#daebda"))))
 '(diff-refine-added ((t (:background "#bce2be"))))
 '(diff-refine-removed ((t (:background "#f1caca"))))
 '(diff-removed ((t (:background "#f1dede"))))
 '(error ((t (:foreground "#961818"))))
 '(flymake-error ((t (:underline "#961818"))))
 '(flymake-note ((t (:underline "#1c6625"))))
 '(flymake-warning ((t (:underline "#805801"))))
 '(font-lock-builtin-face ((t (:foreground "#4d3396"))))
 '(font-lock-comment-face ((t (:foreground "#606150" :background "#dbdbd3"))))
 '(font-lock-constant-face ((t (:foreground "#284d2b"))))
 '(font-lock-function-name-face ((t (:foreground "#004747"))))
 '(font-lock-keyword-face ((t (:foreground "#7d0e22"))))
 '(font-lock-string-face ((t (:foreground "#244700"))))
 '(font-lock-type-face ((t (:foreground "#4a005c"))))
 '(font-lock-variable-name-face ((t (:foreground "#1d3759"))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#f7f7f7"))))
 '(highlight ((t (:background "#c2cbd3"))))
 '(isearch ((t (:foreground "#b0e2ff" :background "#4682b4"))))
 '(minibuffer-prompt ((t (:foreground "#171f34"))))
 '(mode-line ((t (:foreground "#000000" :background "#d4d4d4" :box "#a3a3a3"))))
 '(outline-4 ((t (:foreground "#666f2d"))))
 '(region ((t (:background "#cccccc"))))
 '(secondary-selection ((t (:background "#cad8db"))))
 '(success ((t :foreground "#1c6625")))
 '(tab-bar ((t (:foreground "#000000" :background "#e1e0e0"))))
 '(tab-bar-tab ((t (:foreground "#000000" :background "#d4d4d4" :box "#a3a3a3"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :italic t :foreground "#959292"))))
 '(warning ((t (:foreground "#805801")))))


(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
