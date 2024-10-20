(deftheme cores-claras
  "Light theme.")

(custom-theme-set-variables
 'cores-claras
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'cores-claras
 '(default ((t (:foreground "black" :background "gray95"))))
 '(mode-line ((t (:foreground "black" :background "gray85" :box (:line-width (-1 . 1) :color "gray60")))))
 '(tab-bar ((t (:foreground "black" :background "gray85"))))
 '(tab-bar-tab ((t (:box (:line-width (-1 . 1) :color "gray60")))))
 '(font-lock-comment-face ((t (:foreground "gray33"))))
 '(font-lock-constant-face ((t (:foreground "dark olive green"))))
 '(font-lock-function-name-face ((t (:foreground "#52370d"))))
 '(font-lock-keyword-face ((t (:foreground "#04235c"))))
 '(font-lock-string-face ((t (:foreground "#04525c"))))
 '(font-lock-type-face ((t (:foreground "#394030"))))
 '(font-lock-variable-name-face ((t (:foreground "dark slate gray"))))
 '(minibuffer-prompt ((t (:foreground "dark slate blue")))))

(provide-theme 'cores-claras)
