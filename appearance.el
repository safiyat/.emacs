(custom-set-variables
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(column-number-mode t)            ; Show column number in the mode line.
 '(display-battery-mode t)          ; Show battery status
 '(display-time-mode t)             ; Show system time
 '(save-place t nil (saveplace))    ; Point goes to the last place where it was when you previously visited the same file.
 '(show-paren-mode t)               ; Highlight matching parenthesis and other characters.
 '(size-indication-mode t)          ; Show size of buffer on the mode line.
 '(tool-bar-mode nil)               ; Hide tool bar.
 '(menu-bar-mode nil)               ; Hide menu bar.
)

(global-linum-mode t) ; Enable line numbers globally.
(visual-line-mode t)  ; Enable word wrapping in the english format.

(defconst cust-emacs-dir     ; Find the path of the current directory.
  (file-name-directory (or load-file-name
                           (when (boundp 'bytecomp-filename) bytecomp-filename)
                           buffer-file-name))
  "Directory of custom-emacs"
)

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/themes/flatland-theme.el")) ; Load theme.

(load-file (concat (file-name-as-directory cust-emacs-dir) "loadpaths/fullscreen.el"))
(require 'fullscreen)
(when (display-graphic-p)   ;; Return non-nil if emacs is running in a graphic display.
    (fullscreen))

;; Set transparency of emacs
(defun opacity (value)
   "Sets the opacity of the frame window. 0=transparent/100=opaque"
   (interactive "nOpacity Value 0 - 100 opaque:")
   (set-frame-parameter (selected-frame) 'alpha value))
