;;; ui.el --- UI / Frames -*- lexical-binding: t; -*-
(set-font (selected-frame))
(add-to-list 'after-make-frame-functions #'set-font t)

(center-frame (selected-frame))
(add-to-list 'after-make-frame-functions #'center-frame t)

(dolist (command '(scroll-up-command
                   scroll-down-command
                   recenter-top-bottom
                   other-window))
  (advice-add command :after #'pulse-line))

(setq frame-resize-pixelwise t)

(setq-default frame-title-format "%b")
(setq-default truncate-lines t)
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                (:propertize ("" mode-line-mule-info mode-line-modified)
                 display (min-width (6.0)))
                " " mode-line-buffer-identification
                " " mode-line-modes
                mode-line-format-right-align
                (project-mode-line project-mode-line-format)
                (vc-mode vc-mode)
                "  "
                mode-line-misc-info
                "[L:%l/C:%c] "
                mode-line-percent-position " "
                mode-line-end-spaces))

(setq window-divider-default-bottom-width 0
      window-divider-default-places t
      window-divider-default-right-width 1)
(window-divider-mode 1)

(setq hscroll-margin 2
      hscroll-step 1)

(load-theme 'rom-day t)

(require 'tab-bar)
(setq tab-bar-tab-post-select-functions'(maybe-disable-tab-bar))

(provide 'rom-ui)
