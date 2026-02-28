;;; rom-day-theme.el --- rom-day

(deftheme rom-day
  "Light theme."
  :kind 'color-scheme
  :family 'rom
  :background-mode 'light)

(custom-theme-set-faces
 'rom-day
 '(cursor ((t (:background "#cf8300"))))
 '(completions-common-part ((t (:foreground "#4f4941"))))
 '(default ((t (:background "#eeeeee" :foreground "#000000"))))
 '(diff-added ((t (:background "#daebda"))))
 '(diff-refine-added ((t (:background "#bce2be"))))
 '(diff-refine-removed ((t (:background "#f1caca"))))
 '(diff-removed ((t (:background "#f1dede"))))
 '(error ((t (:foreground "#961818"))))
 '(eshell-prompt ((t (:foreground "#008b8b"))))
 '(flymake-error ((t (:underline "#961818"))))
 '(flymake-note ((t (:underline "#1c6625"))))
 '(flymake-warning ((t (:underline "#805801"))))
 '(font-lock-builtin-face ((t (:foreground "#07206b"))))
 '(font-lock-comment-face ((t (:foreground "#606150"))))
 '(font-lock-constant-face ((t (:foreground "#284d2b"))))
 '(font-lock-function-name-face ((t (:foreground "#004747"))))
 '(font-lock-keyword-face ((t (:foreground "#16046b"))))
 '(font-lock-string-face ((t (:foreground "#4a005c"))))
 '(font-lock-type-face ((t (:foreground "#191970"))))
 '(font-lock-variable-name-face ((t (:foreground "#1d3759"))))
 '(font-lock-warning-face ((t (:foreground "#ff0000" :bold t))))
 '(fringe ((t (:background "#f1f1f1"))))
 '(highlight ((t (:bold t))))
 '(isearch ((t (:foreground "#b0e2ff" :background "#4682b4"))))
 '(minibuffer-prompt ((t (:foreground "#171f34"))))
 '(mode-line ((t (:foreground "#000000" :background "#d4d4d4" :box "#a3a3a3"))))
 '(org-date ((t (:foreground "#3b3b3b" :underline t))))
 '(org-done ((t (:foreground "#6b8e23" :weight bold))))
 '(org-headline-done ((t (:foreground "#042b75"))))
 '(outline-1 ((t (:extend nil :foreground "#02112f" :bold t))))
 '(outline-2 ((t (:extend nil :foreground "#02163b" :bold t))))
 '(outline-3 ((t (:extend nil :foreground "#031e52" :bold t))))
 '(outline-4 ((t (:extend nil :foreground "#03225e" :bold t))))
 '(outline-5 ((t (:extend nil :foreground "#042769" :bold t))))
 '(outline-6 ((t (:extend nil :foreground "#042b75" :bold t))))
 '(outline-7 ((t (:extend nil :foreground "#1d4083" :bold t))))
 '(outline-8 ((t (:extend nil :foreground "#365591" :bold t))))
 '(org-todo ((t (:foreground "#8b0000" :weight bold))))
 '(pulse-highlight-face ((t (:background "#8eb4d1" :extend nil))))
 '(pulse-highlight-start-face ((t (:background "#8eb4d1"))))
 '(region ((t (:background "#cccccc"))))
 '(secondary-selection ((t (:background "#cad8db"))))
 '(success ((t :foreground "#1c6625")))
 '(tab-bar ((t (:foreground "#000000" :background "#e1e0e0"))))
 '(tab-bar-tab ((t (:foreground "#000000" :background "#d4d4d4" :box "#a3a3a3"))))
 '(tab-bar-tab-inactive ((t (:inherit tab-bar :italic t :foreground "#959292"))))
 '(warning ((t (:foreground "#805801")))))


(provide-theme 'rom-day)
;;; rom-day-theme.el ends here
