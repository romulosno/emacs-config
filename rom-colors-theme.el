;;; rom-colors-theme.el --- rom-colors
(deftheme rom-colors
  "My own theme"
  :family 'rom
  :kind 'color-scheme
  :background-mode 'light)

(custom-theme-set-faces
 'rom-colors
 '(default ((t (:foreground "#000000" :background "#d6d6d6"))))
 '(compilation-info ((t (:foreground "#466b38"))))
 '(compilation-warning ((t (:foreground "#878335"))))
 '(compilation-error ((t (:foreground "#9e3a3a"))))
 '(cursor ((t (:background "#4a58a1"))))
 '(diff-added ((t (:background "#deedd5"))))
 '(diff-removed ((t (:background "#e3c1c1"))))
 '(diff-refine-added ((t :background "#c5dbb6")))
 '(diff-refine-removed ((t :background "#d1a9a9")))
 '(flymake-note ((t ((:underline (:color "#466b38" :style line))))))
 '(flymake-warning ((t (:underline (:color "#878335" :style line)))))
 '(flymake-error ((t (:underline (:color "#9e3a3a" :style line)))))
 '(fringe ((t (:background "#d2d2d2"))))
 '(mode-line ((t (:foreground "#282828" :background "#b3b9c1"))))
 '(region ((t (:background "#b8b8b8"))))
 '(secondary-selection ((t (:background "#9fc9b8"))))
 '(font-lock-builtin-face ((t (:foreground "#30327a"))))
 '(font-lock-comment-face ((t (:foreground "#3b4466"))))
 '(font-lock-function-name-face ((t (:foreground "#29506f"))))
 '(font-lock-keyword-face ((t (:foreground "#5b2d70"))))
 '(font-lock-string-face ((t (:foreground "#084a49"))))
 '(font-lock-type-face ((t (:foreground "#671f62"))))
 '(font-lock-constant-face ((t (:foreground "#59195a"))))
 '(font-lock-variable-name-face ((t (:foreground "#39365e"))))
 '(minibuffer-prompt ((t (:foreground "#2f1c49"))))
 '(font-lock-warning-face ((t (:foreground "#571717" :weight bold))))
 '(tab-bar ((t (:foreground "#282828" :background "#b3b9c1"))))
 '(tab-bar-tab ((t (:foreground "black" :background "#95a0ad"))))
 '(tab-bar-tab-inactive ((t (:foreground "#525252" :background "#b3b9c1")))))

;;;###autoload
(and load-file-name
     (boundp 'custom-theme-load-path)
     (add-to-list 'custom-theme-load-path
                  (file-name-as-directory
                   (file-name-directory load-file-name))))

(provide-theme 'rom-colors)
;;; rom-colors-theme.el ends here
