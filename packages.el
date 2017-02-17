;;; packages.el --- Dart Layer packages File for Spacemacs
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
        (dart-mode :location local)
        company
        (company-dart :location local)
        ))


(defun dart/post-init-flycheck ()
  (spacemacs/add-flycheck-hook 'dart-mode))


;; (set (make-local-variable 'company-backends)
;;      '(company-dart (company-dabbrev)))
(defun dart/init-company-dart ()
  (use-package company-dart
    :defer t
    :init (spacemacs|add-company-backends
            :backends company-dart
            :modes dart-mode)))

(defun dart/init-dart-mode ()
  (use-package dart-mode
    :defer t
    :config
    (progn
      ;; (add-hook 'before-save-hook 'dartfmt-before-save)

      ;; (spacemacs/declare-prefix-for-mode 'dart-mode "m" "lang_tools")
      (spacemacs/set-leader-keys-for-major-mode 'dart-mode
        "j" 'dart-jump-to-defn
        "q" 'dart-quick-fix
        "d" 'dart-jump-to-defn
        "f" 'dartfmt
        "i" 'dart-imports
        )
)))
