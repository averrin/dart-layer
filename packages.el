;;; packages.el --- Go Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

(setq dart-packages
      '(
        flycheck
        dart-mode
        (company-dart :location local)
        ))


(defun dart/init-dart-mode()
  (use-package company-dart)
  (use-package dart-mode
    :defer t
    :init
    (progn
      (defun spacemacs//dart-init ()
        "Init dart."
        (setq dart-enable-analysis-server t)
        (flycheck-mode)
        (set (make-local-variable 'company-backends)
             '(company-dart (company-dabbrev)))

        (spacemacs/declare-prefix-for-mode 'dart-mode "m" "lang_tools")
        (spacemacs/set-leader-keys-for-major-mode 'dart-mode
          "j" 'dart-jump-to-defn
          "q" 'dart-quick-fix
          "d" 'dart-jump-to-defn
          "f" 'dartfmt
          "i" 'dart-imports
          )
        )
      (add-hook 'dart-mode-hook 'spacemacs//dart-init))
    :config
    (progn
      ;; (add-hook 'before-save-hook 'dartfmt-before-save)
)))
