(deftheme cores-claras
  "Light theme.")

(custom-theme-set-variables
 'cores-claras
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'cores-claras
 '(default ((t (:foreground "black" :background "gray90"))))
 '(diff-added ((t (:background "#d3ebc3"))))
 '(diff-removed ((t (:background "#e8c1c1"))))
 '(diff-refine-added ((t (:background "#bae09f"))))
 '(diff-refine-removed ((t (:background "#edabab"))))
 '(fringe ((t (:foreground "black" :background "gray88"))))
 '(mode-line ((t (:foreground "black" :background "gray75" :box (:line-width (-1 . 1) :color "gray60")))))
 '(tab-bar ((t (:foreground "black" :background "gray85"))))
 '(tab-bar-tab ((t (:box (:line-width (-1 . 1) :color "gray60")))))
 '(font-lock-comment-face ((t (:foreground "gray33"))))
 '(font-lock-constant-face ((t (:foreground "#235161"))))
 '(font-lock-function-name-face ((t (:foreground "#52370d"))))
 '(font-lock-keyword-face ((t (:foreground "#04235c"))))
 '(font-lock-string-face ((t (:foreground "#0a400a"))))
 '(font-lock-type-face ((t (:foreground "#0a3078"))))
 '(font-lock-variable-name-face ((t (:foreground "dark slate gray"))))
 '(minibuffer-prompt ((t (:foreground "dark slate blue"))))
 '(region ((t (:background "gray75")))))

(provide-theme 'cores-claras)
