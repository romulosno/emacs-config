;;; rom-day-theme.el --- rom-day

(deftheme rom-day)

(custom-theme-set-variables
 'rom-night
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'rom-day
 '(default ((t (:foreground "#000000" :background "#f5f5f5"))))
 '(cursor ((t (:background "#000000"))))
 '(diff-added ((t (:background "#daebda"))))
 '(diff-refine-added ((t (:background "#bce2be"))))
 '(diff-refine-removed ((t (:background "#f1caca"))))
 '(diff-removed ((t (:background "#f1dede"))))
 '(fringe ((t (:background "#eef0f0"))))
 '(isearch ((t (:foreground "#b0e2ff" :background "#4682b4"))))
 '(mode-line ((t (:box (:line-width (1 . 1) :color "#969696" :style nil) :foreground "#000000" :background "#cacaca"))))
 '(region ((t (:background "#cccccc"))))
 '(secondary-selection ((t (:background "#cddbec"))))
 '(font-lock-builtin-face ((t (:foreground "#1b477e"))))
 '(font-lock-comment-face ((t (:foreground "#626d62"))))
 '(font-lock-function-name-face ((t (:foreground "#67078f"))))
 '(font-lock-keyword-face ((t (:foreground "#770829"))))
 '(font-lock-string-face ((t (:foreground "#085f77"))))
 '(font-lock-type-face ((t (:foreground "#630865"))))
 '(font-lock-constant-face ((t (:foreground "#250c55"))))
 '(font-lock-variable-name-face ((t (:foreground "#573170"))))
 '(minibuffer-prompt ((t (:foreground "#323d5b"))))
 '(font-lock-warning-face ((t (:foreground "#805801" :bold t))))
 '(tab-bar ((t (:foreground "#000000" :background "#cacaca")))) 
 '(tab-bar-tab ((t (:box (:line-width (1 . 1) :color "#969696" :style nil) :foreground "#000000" :background "#cacaca"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :foreground "#4d4d4d"))))
 '(warning ((t (:foreground "#805801")))))


(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
