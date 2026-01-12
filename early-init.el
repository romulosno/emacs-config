(setq gc-cons-threshold 102400000)
(setq gc-cons-percentage 0.4)

(tool-bar-mode -1)
(menu-bar-mode -1)
(tooltip-mode -1)

(let ((params '((width . 100)
		(height . 30)
		(menu-bar-lines . 0)
		(tool-bar-lines . 0))))
  (setq default-frame-alist params
	initial-frame-alist params))
