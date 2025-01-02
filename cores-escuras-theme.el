(deftheme cores-escuras
  "Dark theme."
  :family 'cores
  :kind 'color-scheme
  :background-mode 'dark)

(custom-theme-set-faces
 'cores-escuras
 '(cursor ((t (:background "dark goldenrod"))))
 '(default ((t (:foreground "white" :background "#012340"))))
 '(fringe ((t (:foreground "white" :background "#012340"))))
 '(region ((t (:foreground "white" :background "#07355c"))))
 '(mode-line ((t (:foreground "white" :background "#0a475c"))))
 '(font-lock-comment-face ((t (:foreground "#9fb7c9"))))
 '(font-lock-string-face ((t (:foreground "#b3c499"))))
 '(font-lock-type-face ((t (:foreground "#c3ebd0"))))
 '(org-level-1 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-2 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-3 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-4 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-5 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-6 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-7 ((t (:foreground "#e9ebc3" :weight bold))))
 '(org-level-8 ((t (:foreground "#e9ebc3" :weight bold))))
 '(tab-bar ((t (:foreground "white" :background "#0a475c"))))
 '(tab-bar-tab-inactive ((t (:foreground "gray60" :inherit tab-bar-tab)))))

(provide-theme 'cores-escuras)
