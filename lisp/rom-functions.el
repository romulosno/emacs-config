;;; functions.el --- Custom functions -*- lexical-binding: t; -*-

(defun center-frame (frame)
  (let* ((display        (frame-parameter frame 'display))
         (display-width  (display-pixel-width display))
         (display-height (display-pixel-height display))
         (frame-width   (frame-pixel-width frame))
         (frame-height  (frame-pixel-height frame))
         (x (/ (- display-width  frame-width) 2))
         (y (/ (- display-height frame-height) 2)))
    (set-frame-position frame x y)))

(defun set-font (frame)
  (let ((font-name "Cascadia Mono"))
    (when (find-font (font-spec :name font-name))
      (with-selected-frame frame
	(set-frame-font font-name)))))

(defun pulse-line (&rest _)
  (pulse-momentary-highlight-one-line (point)))

(defun multi-occur-match-in-all-buffers ()
  (interactive)
  (let ((current-prefix-arg '(4)))
    (call-interactively #'multi-occur-in-matching-buffers)))

(defun delete-empty-duplicates ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (replace-regexp "\n\\{2,\\}" "\n\n")))

(defun maybe-disable-tab-bar (&rest _)
  (when (= (length (tab-bar-tabs)) 2) 	;tab-bar eh bugado, num de tabs -1
    (tab-bar-mode -1)))

(defun open-literally ()
  (interactive)
  (with-current-buffer (current-buffer)
    (when buffer-file-name
      (find-file-literally buffer-file-name))))

(provide 'rom-functions)
