;;; completion.el --- Completion / Minibuffer -*- lexical-binding: t; -*-

(completion-preview-mode 1)

(setq completion-styles '(basic partial-completion substring)
      tab-always-indent 'complete
      completions-format 'one-column
      completions-max-height 20
      completion-show-help nil
      completions-header-format nil)

(setq completion-category-overrides
      '((file         (styles . (basic partial-completion substring flex)))
        (project-file (styles . (basic flex initials)))))

(setq repeat-exit-key "RET")
(repeat-mode 1)

(setq enable-recursive-minibuffers t
      read-minibuffer-restore-windows nil)

(setq minibuffer-prompt-properties
      '(read-only t intangible t cursor-intangible t
        face minibuffer-prompt))

(add-hook 'minibuffer-setup-hook #'cursor-intangible-mode)
(minibuffer-depth-indicate-mode 1)
(savehist-mode 1)

(provide 'rom-completion)
