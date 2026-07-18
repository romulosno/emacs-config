;;; auto-completions.el ---                          -*- lexical-binding: t; -*-

;; Copyright (C) 2026  Romulo Souza

;; Author: Romulo Souza <romulo@doa>
;; Keywords: 

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

;; =========================================================
;; 1. Atualização Automática no Minibuffer
;; =========================================================

(defun update-completions (&rest _)
  (when (and (minibufferp)
             minibuffer-completion-table
             (null isearch-mode)
             (not (memq this-command '(exit-minibuffer 
                                       minibuffer-complete-and-exit
                                       minibuffer-complete-word
                                       minibuffer-complete))))
    (let ((inhibit-message t))
      (while-no-input
        (minibuffer-completion-help)))))

(defun minibuffer-complete-word-more (&rest _)
  (when (and (window-minibuffer-p)
	     (not minibuffer-completing-file-name))
    (let ((candidatos (completion-all-completions 
                       (minibuffer-contents)
                       minibuffer-completion-table
                       minibuffer-completion-predicate
                       (length (minibuffer-contents)))))
      ;; `safe-length` conta os itens sem quebrar com listas especiais
      (when (= (safe-length candidatos) 1)
        (minibuffer-force-complete)))))

(defun auto-completions-mode--enable ()
  (when auto-completions-mode
    (advice-add 'minibuffer-complete-word :after #'minibuffer-complete-word-more)
    (add-hook 'after-change-functions #'update-completions nil t)))

(define-minor-mode auto-completions-mode
  "Auto update completions mode (apenas para o minibuffer)."
  :global t
  (if auto-completions-mode
      (add-hook 'minibuffer-setup-hook #'auto-completions-mode--enable)
    (remove-hook 'minibuffer-setup-hook #'auto-completions-mode--enable)
    (advice-remove 'minibuffer-complete-word #'minibuffer-complete-word)))

;; =========================================================
;; 2. Completion in Region (Dentro do Buffer)
;; =========================================================

(defun setup-minibuffer-completions ()
  (local-set-key (kbd "TAB") #'minibuffer-complete-and-exit)
  (local-set-key [tab] #'minibuffer-complete-and-exit)
  (add-hook 'after-change-functions #'update-completions nil t))

(defun my-completion-in-region (start end collection predicate)
  (if (minibufferp)
      (funcall #'completion--in-region start end collection predicate)
    (let* ((initial (buffer-substring-no-properties start end))
           (matches (completion-all-completions initial collection predicate (length initial)))
           (minibuffer-setup-hook (append minibuffer-setup-hook '(setup-minibuffer-completions))))
      (delete-region start end)
      (if (= (length (all-completions "" matches)) 1)
          (insert (car (all-completions "" matches)))
        (let ((choice (completing-read "Complete: " collection predicate nil initial)))
          (insert choice))))))

(advice-add 'choose-completion :around
            (lambda (orig-fun &rest args)
              (with-current-buffer (window-buffer (active-minibuffer-window))
                (remove-hook 'after-change-functions #'update-completions t)
                (apply orig-fun args)
                (exit-minibuffer))))

(define-minor-mode in-buffer-completion-mode
  "Usa o minibuffer para completar texto dentro do buffer."
  :global t
  (if in-buffer-completion-mode
      (setq completion-in-region-function #'my-completion-in-region)
    (setq completion-in-region-function #'completion--in-region)))

(provide 'auto-completions)
;;; auto-completions.el ends here
