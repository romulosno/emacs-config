;;; rom-night-theme.el --- rom-night
(deftheme rom-night)

(custom-theme-set-variables
 'rom-night
 '(frame-background-mode 'dark))

(custom-theme-set-faces
 'rom-night
 '(default ((t (:foreground "#edece8" :background "#030e20"))))
 '(cursor ((t (:background "#2f7e90"))))
 '(fringe ((t (:background "#030c1c"))))
 '(mode-line ((t (:foreground "#edece8" :background "#363f4f" :box "#5c6378"))))
 '(region ((t (:background "#474747"))))
 '(secondary-selection ((t (:background "#3e3834"))))
 '(font-lock-builtin-face ((t (:foreground "#c5dcff"))))
 '(font-lock-comment-face ((t (:foreground "#030e20" :background "#686f7b"))))
 '(font-lock-function-name-face ((t (:foreground "#a7caf9"))))
 '(font-lock-keyword-face ((t (:foreground "#c7c5ff"))))
 '(font-lock-string-face ((t (:foreground "#a9cea4"))))
 '(font-lock-type-face ((t (:foreground "#a2c9ff"))))
 '(font-lock-constant-face ((t (:foreground "#4fd8cf"))))
 '(font-lock-variable-name-face ((t (:foreground "#8ebdc0"))))
 '(minibuffer-prompt ((t (:foreground "#cae3f2"))))
 '(font-lock-warning-face ((t (:foreground "#90812f" :bold t))))
 '(tab-bar ((t (:foreground "#edece8" :background "#4f5765"))))
 '(tab-bar-tab ((t (:foreground "#edece8" :background "#363f4f" :box "#5c6378"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :italic t :foreground "#ababab")))))

(provide-theme 'rom-night)
;;; rom-night-theme.el ends here
