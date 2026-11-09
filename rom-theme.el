;;; rom-theme.el ---  -*- lexical-binding: t; -*-

(deftheme rom
  "Light theme."
  :kind 'color-scheme
  :family 'rom
  :background-mode 'light)

(custom-theme-set-faces
 'rom
 '(default ((t (:background "#f5f5f0" :foreground "#000000"))))
 '(diff-added ((t (:background "#caedca"))))
 '(diff-refine-added ((t (:background "#a9d9a9"))))
 '(diff-refine-removed ((t (:background "#e3b5b5"))))
 '(diff-removed ((t (:background "#e3b5b5"))))
 '(error ((t (:foreground "DarkRed" :bold t))))
 '(font-lock-builtin-face ((t (:foreground "#0e468a"))))
 '(font-lock-type-face ((t (:foreground "#51017d"))))
 '(font-lock-comment-face ((t (:foreground "#104e57" :background "#ebf0f0"))))
 '(font-lock-constant-face ((t (:foreground "#0d526e"))))
 '(font-lock-function-name-face ((t (:foreground "#75062b"))))
 '(font-lock-keyword-face ((t (:foreground "DarkBlue"))))
 '(font-lock-string-face ((t (:foreground "#104e57"))))
 '(font-lock-variable-name-face ((t (:foreground "#2f3357"))))
 '(font-lock-warning-face ((t (:foreground "#961f0b" :bold t))))
 '(fringe ((t (:background "#f5f5f0"))))
 '(highlight ((t (:background "#d0ebf2"))))
 '(minibuffer-depth-indicator ((t (:background "#03296b" :foreground "#ffffff"))))
 '(minibuffer-nonselected ((t (:background "#4e0191" :foreground "#ffffff"))))
 '(minibuffer-prompt ((t (:background "#dcdfe0" :foreground "#142240"))))
 '(mode-line ((t (:background "#e3e3e3" :foreground "#000000" :box "#939393"))))
 '(mode-line-inactive ((t (:background "#ebebeb" :foreground "#606266" :box "#939393"))))
 '(pulse-highlight-face ((t (:extend nil :background "#84b0e8"))))
 '(pulse-highlight-start-face ((t (:background "#a4c4ed"))))
 '(region ((t (:background "#d9d6d0"))))
 '(sh-quoted-exec ((t (:foreground "dark magenta"))))
 '(success ((t (:foreground "ForestGreen" :bold t))))
 '(tab-bar ((t (:background "#e3e3e3" :foreground "#000000" :box "#939393"))))
 '(tab-bar-tab ((t (:background "#e3e3e3" :foreground "DodgerBlue4"))))
 '(tab-bar-tab-inactive ((t (:background "#e3e3e3" :foreground "gray20"))))
 '(warning ((t (:foreground "DarkGoldenrod4" :bold t)))))

(provide-theme 'rom)
;;; rom-theme.el ends here
