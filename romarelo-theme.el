;;; romarelo-theme.el ---  -*- lexical-binding: t; -*-

(deftheme romarelo
  "Light theme."
  :kind 'color-scheme
  :family 'romarelo
  :background-mode 'light)

(custom-theme-set-faces
 'romarelo
 '(default ((t (:background "#f7f4ed" :foreground "#000000"))))
 '(diff-added ((t (:background "#caedca"))))
 '(diff-refine-added ((t (:background "#a9d9a9"))))
 '(diff-refine-removed ((t (:background "#e3b5b5"))))
 '(diff-removed ((t (:background "#e3b5b5"))))
 '(font-lock-type-face ((t (:foreground "#5a337d"))))
 '(font-lock-builtin-face ((t (:foreground "#1d2954"))))
 '(font-lock-comment-face ((t (:foreground "#636149"))))
 '(font-lock-constant-face ((t (:foreground "#0d526e"))))
 '(font-lock-function-name-face ((t (:foreground "#0a015e"))))
 '(font-lock-keyword-face ((t (:foreground "#0e468a"))))
 '(font-lock-string-face ((t (:foreground "#59360c"))))
 '(font-lock-variable-name-face ((t (:foreground "#2f3357"))))
 '(fringe ((t (:background "#f7f7ed"))))
 '(highlight ((t (:background "#d0ebf2"))))
 '(minibuffer-depth-indicator ((t (:background "#03296b" :foreground "#ffffff"))))
 '(minibuffer-nonselected ((t (:background "#4e0191" :foreground "#ffffff"))))
 '(minibuffer-prompt ((t (:background "#dcdfe0" :foreground "#142240"))))
 '(mode-line ((t (:background "#ded4c1" :foreground "#000000" :box "#c4b8a1"))))
 '(mode-line-inactive ((t (:background "#dcdfe0" :foreground "#606266" :box "#8d9ba1"))))
 '(pulse-highlight-face ((t (:extend nil :background "#84b0e8"))))
 '(pulse-highlight-start-face ((t (:background "#a4c4ed"))))
 '(region ((t (:background "#d3dce8"))))
 '(tab-bar ((t (:background "#ded4c1" :foreground "#000000" :box "#c4b8a1"))))
 '(tab-bar-tab ((t (:background "#ded4c1" :foreground "#000000"))))
 '(tab-bar-tab-inactive ((t (:background "#ded4c1" :foreground "#606266")))))

(provide-theme 'romarelo)
;;; romarelo-theme.el ends here
