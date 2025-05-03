(deftheme rom-night)

(custom-theme-set-variables
 'rom-night
 '(frame-background-mode 'dark))

(custom-theme-set-faces
 'rom-night
 '(default ((t (:foreground "#edece8" :background "#1c1c20"))))
 '(cursor ((t (:background "#2f7e90"))))
 '(fringe ((t (:background "#1d1d20"))))
 '(mode-line ((t (:box (:line-width (1 . 1) :color "#5c6378" :style nil) :foreground "#edece8" :background "#42485d"))))
 '(region ((t (:background "#474747"))))
 '(secondary-selection ((t (:background "#3e3834"))))
 '(font-lock-builtin-face ((t (:foreground "#c5dcff"))))
 '(font-lock-comment-face ((t (:foreground "#a09b97"))))
 '(font-lock-function-name-face ((t (:foreground "#a7caf9"))))
 '(font-lock-keyword-face ((t (:foreground "#c7c5ff"))))
 '(font-lock-string-face ((t (:foreground "#a9cea4"))))
 '(font-lock-type-face ((t (:foreground "#a2c9ff"))))
 '(font-lock-constant-face ((t (:foreground "#4fd8cf"))))
 '(font-lock-variable-name-face ((t (:foreground "#8ebdc0"))))
 '(minibuffer-prompt ((t (:foreground "#cae3f2"))))
 '(font-lock-warning-face ((t (:foreground "#90812f" :bold t))))
 '(tab-bar ((t (:foreground "#edece8" :background "#42485d"))))
 '(tab-bar-tab ((t (:box (:line-width (1 . 1) :color "#5c6378" :style nil) :foreground "#edece8" :background "#474d62"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar-tab :foreground "#ababab")))))

(provide-theme 'rom-night)
