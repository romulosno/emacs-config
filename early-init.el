;; -*- lexical-binding: t; -*-
(setq gc-cons-threshold most-positive-fixnum)
(setq gc-cons-percentage 0.4)

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(setq default-frame-alist '((width . 120)))

(add-hook 'after-init-hook
	  (lambda ()
            (setq gc-cons-threshold 128000000)
            (garbage-collect)
            (setq garbage-collection-messages t)))
