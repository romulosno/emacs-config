(deftheme rom-night
  "My dark theme."
  :family 'rom
  :kind 'color-scheme
  :background-mode 'dark)

(custom-theme-set-variables
 'rom-night
 '(frame-background-mode 'dark))

(custom-theme-set-faces
 'rom-night
 '(cursor ((t (:background "#fdf4c1"))))
 '(default ((t (:foreground "#f7f1d4" :background "#272c30"))))
 '(diff-refine-added ((t (:background "#274527"))))
 '(diff-refine-removed ((t (:background "#452424"))))
 '(font-lock-builtin-face ((t (:foreground "#d1ddde"))))
 '(font-lock-comment-face ((t (:foreground "#c9b4a1"))))
 '(font-lock-constant-face ((t (:foreground "#cfd386"))))
 '(font-lock-function-name-face ((t (:foreground "#b8dbdb"))))
 '(font-lock-keyword-face ((t (:foreground "#a0c0c4"))))
 '(font-lock-string-face ((t (:foreground "#b6bb60"))))
 '(font-lock-type-face ((t (:foreground "#d3c286"))))
 '(font-lock-variable-name-face ((t (:foreground "#9ecbba"))))
 '(font-lock-warning-face ((t (:foregrond "#b35656"))))
 '(font-lock-warning-face ((t (:foreground "red" :bold t))))
 '(fringe ((t (:background "#23272a"))))
 '(minibuffer-prompt ((t (:foreground "#dfe0ca" :bold t))))
 '(mode-line ((t (:foreground "#ededed" :background "#4b5157"))))
 '(region ((t (:background "#343b41"))))
 '(secondary-selection ((t (:background "#2e4744"))))
 '(tab-bar ((t (:foreground "#ededed" :background "#4b5157"))))
 '(tab-bar-tab ((t (:foreground "#ededed" :background "#4b5157"))))
 '(tab-bar-tab-inactive ((t (:foreground "#a3a3a3" :background "#4b5157")))))

(provide-theme 'rom-night)
