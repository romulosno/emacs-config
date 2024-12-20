(deftheme cores-claras
  "Light theme.")

(custom-theme-set-variables
 'cores-claras
 '(frame-background-mode 'light))

(custom-theme-set-faces
 'cores-claras
 '(cursor ((t (:background "#162d73"))))
 '(default ((t (:foreground "black" :background "gray95"))))
 '(diff-added ((t (:background "#d3ebc3"))))
 '(diff-removed ((t (:background "#e8c1c1"))))
 '(diff-refine-added ((t (:background "#bae09f"))))
 '(diff-refine-removed ((t (:background "#edabab"))))
 '(fringe ((t (:foreground "black" :background "gray95"))))
 '(mode-line ((t (:foreground "black" :background "gray80" :box (:line-width (-1 . 1) :color "gray60")))))
 '(tab-bar ((t (:foreground "black" :background "gray80"))))
 '(tab-bar-tab ((t (:box (:line-width (-1 . 1) :color "gray60")))))
 '(font-lock-comment-face ((t (:foreground "gray33"))))
 '(font-lock-constant-face ((t (:foreground "#235161"))))
 '(font-lock-function-name-face ((t (:foreground "#69440c"))))
 '(font-lock-keyword-face ((t (:foreground "#042d7a"))))
 '(font-lock-string-face ((t (:foreground "#0b4d0b"))))
 '(font-lock-type-face ((t (:foreground "#0a3078"))))
 '(font-lock-variable-name-face ((t (:foreground "dark slate gray"))))
 '(minibuffer-prompt ((t (:foreground "dark slate blue"))))
 '(region ((t (:background "gray75"))))
 '(error ((t (:foreground "Firebrick" :weight bold))))
 '(success ((t (:foreground "dark green" :weight bold))))
 '(warning ((t (:foreground "Goldenrod4" :weight bold)))))

(provide-theme 'cores-claras)
