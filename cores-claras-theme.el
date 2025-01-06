(deftheme cores-claras
  "Light theme."
  :family 'cores
  :kind 'color-scheme
  :background-mode 'light)

(custom-theme-set-faces
 'cores-claras
 '(cursor ((t (:background "#162d73"))))
 '(default ((t (:foreground "black" :background "gray95"))))
 '(diff-added ((t (:background "#d3ebc3"))))
 '(diff-removed ((t (:background "#e8c1c1"))))
 '(diff-refine-added ((t (:background "#bae09f"))))
 '(diff-refine-removed ((t (:background "#edabab"))))
 '(fringe ((t (:foreground "black" :background "gray95"))))
 '(mode-line ((t (:foreground "black" :background "gray75" :box (:line-width (-1 . 1) :color "gray50")))))
 '(tab-bar ((t (:foreground "black" :background "gray80"))))
 '(tab-bar-tab ((t (:box (:line-width (-1 . 1) :color "gray60")))))
 '(tab-bar-tab-inactive ((t (:foreground "gray30" :inherit tab-bar-tab))))
 '(font-lock-builtin-face ((t (:foreground "#0b49ba"))))
 '(font-lock-comment-face ((t (:foreground "gray35"))))
 '(font-lock-constant-face ((t (:foreground "DarkSlateGray"))))
 '(font-lock-function-name-face ((t (:foreground "#1248bd"))))
 '(font-lock-keyword-face ((t (:foreground "#170675"))))
 '(font-lock-string-face ((t (:foreground "#001d52"))))
 '(font-lock-type-face ((t (:foreground "#0a3078"))))
 '(font-lock-variable-name-face ((t (:foreground "DodgerBlue4"))))
 '(minibuffer-prompt ((t (:foreground "dark slate blue"))))
 '(region ((t (:background "gray75"))))
 '(error ((t (:foreground "Firebrick" :weight bold))))
 '(success ((t (:foreground "dark green" :weight bold))))
 '(warning ((t (:foreground "Goldenrod4" :weight bold))))
 '(org-level-1 ((t (:foreground "#004ad2"))))
 '(org-level-2 ((t (:foreground "#0041b8"))))
 '(org-level-3 ((t (:foreground "#00389f"))))
 '(org-level-4 ((t (:foreground "#002f85"))))
 '(org-level-5 ((t (:foreground "#00266c"))))
 '(org-level-6 ((t (:foreground "#001d52"))))
 '(org-level-7 ((t (:foreground "#001439"))))
 '(org-level-8 ((t (:foreground "#000b1f")))))

(provide-theme 'cores-claras)
