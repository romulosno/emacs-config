;;; early-init.el --- emacs early init config -*- lexical-binding: t; -*-
(setq gc-cons-threshold 51200000)
(setq gc-cons-percentage 0.4)

;;; UI
(blink-cursor-mode -1)
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tooltip-mode -1)

(add-to-list 'default-frame-alist '(width . 100))
