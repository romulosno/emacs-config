;;; vc.el --- VC / Diff / Merge -*- lexical-binding: t; -*-

(setq vc-git-show-stash 0
      vc-git-print-log-follow t
      vc-handled-backends '(Git))

(setq ediff-window-setup-function 'ediff-setup-windows-plain
      ediff-keep-variants nil)

(setq smerge-command-prefix "\e"
      diff-default-read-only t)

(provide 'rom-vc)
