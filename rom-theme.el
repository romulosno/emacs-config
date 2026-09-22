;;; rom-theme.el ---  -*- lexical-binding: t; -*-

(deftheme rom
  "Light theme."
  :kind 'color-scheme
  :family 'rom
  :background-mode 'light)

(custom-theme-set-faces
 'rom
 '(default ((t (:background "gray89" :foreground "#000000"))))
 '(diff-added ((t (:background "#caedca"))))
 '(diff-refine-added ((t (:background "#a9d9a9"))))
 '(diff-refine-removed ((t (:background "#e3b5b5"))))
 '(diff-removed ((t (:background "#e3b5b5"))))
 '(font-lock-builtin-face ((t (:foreground "#380f7a"))))
 '(font-lock-type-face ((t (:foreground "#51017d"))))
 '(font-lock-builtin-face ((t (:foreground "#4e1261"))))
 '(font-lock-comment-face ((t (:foreground "#636149"))))
 '(font-lock-constant-face ((t (:foreground "#0d526e"))))
 '(font-lock-function-name-face ((t (:foreground "#0a015e"))))
 '(font-lock-keyword-face ((t (:foreground "#73063e"))))
 '(font-lock-string-face ((t (:foreground "#00646e"))))
 '(font-lock-variable-name-face ((t (:foreground "#2f3357"))))
 '(fringe ((t (:background "gray89"))))
 '(highlight ((t (:background "#d0ebf2"))))
 '(minibuffer-depth-indicator ((t (:background "#03296b" :foreground "#ffffff"))))
 '(minibuffer-nonselected ((t (:background "#4e0191" :foreground "#ffffff"))))
 '(minibuffer-prompt ((t (:background "#dcdfe0" :foreground "#142240"))))
 '(mode-line ((t (:background "gray80" :foreground "#000000" :box "#8d9ba1"))))
 '(mode-line-inactive ((t (:background "#dcdfe0" :foreground "#606266" :box "#8d9ba1"))))
 '(pulse-highlight-face ((t (:extend nil :background "#84b0e8"))))
 '(pulse-highlight-start-face ((t (:background "#a4c4ed"))))
 '(region ((t (:background "#d3dce8"))))
 '(tab-bar ((t (:background "#dcdfe0" :foreground "#000000" :box "#8d9ba1"))))
 '(tab-bar-tab ((t (:background "#dcdfe0" :foreground "#000000"))))
 '(tab-bar-tab-inactive ((t (:background "#dcdfe0" :foreground "#606266")))))

(provide-theme 'rom)
;;; rom-theme.el ends here
