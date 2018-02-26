;;; packages.el --- turnspike layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: work <work@serenity.local>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `turnspike-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `turnspike/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `turnspike/pre-init-PACKAGE' and/or
;;   `turnspike/post-init-PACKAGE' to customize   

(defconst turnspike-packages
  '(
    gruvbox-theme
    twilight-bright-theme
    ))

(defun turnspike/init-twilight-bright-theme())
;; (defun turnspike/post-init-twilight-bright-theme()
;;   (spacemacs/load-theme 'twilight-bright)
;;   (load-theme 'twilight-bright-theme t))

(defun turnspike/init-gruvbox-theme())
;; (defun turnspike/post-init-gruvbox-theme()
;;   (spacemacs/load-theme 'gruvbox)
;;   (load-theme 'gruvbox-dark-medium))

;; (defun turnspike/post-init-imenu-list()

;;   (setq
;;    imenu-list-mode-line-format nil
;;    imenu-list-focus-after-activation nil
;;    )

;; )

;;; packages.el ends here
