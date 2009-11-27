;;;; code borrowed from: http://weitz.de/cl-webdav/

;;; $Header: /usr/local/cvsrep/cl-webdav/util.lisp,v 1.3 2007/04/17 07:42:08 edi Exp $

;;; Copyright (c) 2007, Dr. Edmund Weitz.  All rights reserved.

;;; Redistribution and use in source and binary forms, with or without
;;; modification, are permitted provided that the following conditions
;;; are met:

;;;   * Redistributions of source code must retain the above copyright
;;;     notice, this list of conditions and the following disclaimer.

;;;   * Redistributions in binary form must reproduce the above
;;;     copyright notice, this list of conditions and the following
;;;     disclaimer in the documentation and/or other materials
;;;     provided with the distribution.

;;; THIS SOFTWARE IS PROVIDED BY THE AUTHOR 'AS IS' AND ANY EXPRESSED
;;; OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
;;; WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
;;; ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY
;;; DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE
;;; GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
;;; INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
;;; WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING
;;; NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
;;; SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

(in-package :s3-server)

(defmacro define-return-code-shortcut (name return-code)
  "Defines a function called NAME which just sets the HTTP return
code to RETURN-CODE and then ends the current handler by throwing
NIL to the catch tag HANDLER-DONE."
  `(defun ,name ()
     ,(format nil "Sets RETURN-CODE to ~A and then throws NIL to
the HANDLER-DONE catch tag." return-code)
     (setf (return-code) ,return-code)
     (throw 'handler-done nil)))

(define-return-code-shortcut not-implemented +http-not-implemented+)
(define-return-code-shortcut bad-request +http-bad-request+)
(define-return-code-shortcut bad-gateway +http-bad-gateway+)
(define-return-code-shortcut not-found +http-not-found+)
(define-return-code-shortcut forbidden +http-forbidden+)
(define-return-code-shortcut conflict +http-conflict+)
(define-return-code-shortcut precondition-failed +http-precondition-failed+)
(define-return-code-shortcut failed-dependency +http-failed-dependency+)
(define-return-code-shortcut method-not-allowed +http-method-not-allowed+)
