;;; my-display-buffer.el ---                         -*- lexical-binding: t; -*-

(defun fit-window-to-buffer-max-fifth-frame (&optional window)
  "Fit WINDOW to buffer size, but max height is 20% of the frame height."
  (interactive)
  (let ((window (or window (selected-window)))
        (max-height (/ (frame-height) 5)))
    (fit-window-to-buffer window max-height)))

(defun display-completion-buffer (buffer actions)
  "Display completion buffer."
  (if (minibuffer-window-active-p (selected-window))
      (display-buffer-in-direction buffer actions)
    (display-buffer-below-selected buffer actions)))

(defun customize-frame-create ()
  (make-frame '((top . 0.5)
		(left . 0.5)
		(name . "Customize")
		(width . 80)
		(height . 30)
		(auto-hide-function . delete-frame)
		(unsplittable . t))))

(defun display-buffer-customize-frame (buffer actions)
  "Display completion buffer."
  (let ((frame (select-frame (or (cdr (assoc-string "Customize" (make-frame-names-alist)))
				 (customize-frame-create)))))
    (with-selected-frame frame
      (with-selected-window (selected-window)
	(display-buffer-same-window buffer actions)
	(set-window-dedicated-p (selected-window) t)))))

(setq switch-to-buffer-obey-display-actions t)

(setq display-buffer-alist
      '(("\\*Completions\\*"
	 (display-completion-buffer)
	 (dedicated . t)
	 (direction . down)
	 (window . root)
	 (window-parameters . ((mode-line-format . (" " mode-line-buffer-identification))))
	 (window-height . fit-window-to-buffer-max-fifth-frame))

	("\\*\\(Flymake\\|Buffer List\\)"
	 display-buffer-in-side-window
         (side . bottom)
	 (slot . -1)
	 (window-height . 15)
	 (dedicated . t)
	 (preserve-size . (t . nil))
	 (body-function . select-window)
	 (window-parameters . ((no-other-window . t)
			       (no-delete-other-windows . t)
			       (mode-line-format . (" " mode-line-buffer-identification)))))

	("\\*Messages\\*"
	 display-buffer-in-side-window
	 (side . bottom)
	 (slot . 1)
	 (dedicated . t)
	 (preserve-size . (t . nil))
	 (window-height . 15)
	 (body-function . select-window)
	 (window-parameters . ((no-other-window . t)
			       (no-delete-other-windows . t)
			       (mode-line-format . (" " mode-line-buffer-identification)))))

	("\\*\\(Occur\\|grep\\)\\**"
	 display-buffer-in-side-window
	 (side . bottom)
	 (slot . 1)
	 (dedicated . t)
	 (preserve-size . (t . nil))
	 (window-height . 15)
	 (body-function . select-window)
	 (window-parameters . ((mode-line-format . (" ")))))

	("\\*eldoc*"
	 (display-buffer-reuse-window
	  display-buffer-in-side-window)
	 (reusable-frames . nil)
	 (side . right)
	 (slot . 1)
	 (dedicated . t)
	 (preserve-size . (t . nil))
	 (window-width . 30)
	 (body-function . select-window)
	 (window-parameters . ((no-other-window . t)
			       (mode-line-format . ("" mode-line-buffer-identification)))))

	("\\*Customize*"
	 display-buffer-customize-frame)))

(provide 'my-display-buffer)
;;; my-display-buffer.el ends here
