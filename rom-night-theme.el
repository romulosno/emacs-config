;;; rom-night-theme.el --- rom-night
(deftheme rom-night
  "Dark theme."
  :kind 'color-scheme
  :family 'rom
  :background-mode 'dark)

(custom-theme-set-faces
 'rom-night
 '(cursor ((t (:background "#f7caa6"))))
 '(default ((t (:foreground "#edece8" :background "#0f192a"))))
 '(font-lock-builtin-face ((t (:foreground "#c5dcff"))))
 '(font-lock-comment-face ((t (:foreground  "#686f7b"))))
 '(font-lock-constant-face ((t (:foreground "#4fd8cf"))))
 '(font-lock-function-name-face ((t (:foreground "#a7caf9"))))
 '(font-lock-keyword-face ((t (:foreground "#ffee80"))))
 '(font-lock-string-face ((t (:foreground "#a9cea4"))))
 '(font-lock-type-face ((t (:foreground "#c7c5ff"))))
 '(font-lock-variable-name-face ((t (:foreground "#8ebdc0"))))
 '(font-lock-warning-face ((t (:foreground "#90812f" :bold t))))
 '(fringe ((t (:background "#0c1524"))))
 '(minibuffer-prompt ((t (:foreground "#cae3f2"))))
 '(mode-line ((t (:foreground "#edece8" :background "#363f4f" :box "#5c6378"))))
 '(region ((t (:background "#474747"))))
 '(secondary-selection ((t (:background "#3e3834"))))
 '(tab-bar ((t (:foreground "#edece8" :background "#363f4f" :box "#5c6378"))))
 '(tab-bar-tab ((t (:foreground "#edece8" :background "#202d42"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :italic t :foreground "#ababab")))))

(provide-theme 'rom-night)
;;; rom-night-theme.el ends here
