(setq gc-cons-threshold 8000000)
(setq gc-cons-percentage 0.4)

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)
(scroll-bar-mode -1)

(setq default-frame-alist '((fullscreen . maximized)
			    (vertical-scroll-bars . nil)
			    (horizontal-scroll-bars . nil)))
