
(in-package :s3-server)

(defun get-handler (&optional request)	
  (declare (ignore request))
  (format nil "GET 2 request:~a on url:~a script:~a query:~a name:~a~%" 
	  (request-method*) 
	  (request-uri*) 
	  (script-name*)
	  (query-string*)
	  (get-parameter "name"))
  (case (request-method*)
    (:get (format nil "case GET~%"))
    (otherwise (format nil "case OTHERWISE~%"))))

(defun put-handler (&optional request)
  (declare (ignore request))
  (format nil "PUT HANDLER request:~a on url:~a script:~a query:~a name:~a~%" 
	  (request-method*) 
	  (request-uri*) 
	  (script-name*)
	  (query-string*)
	  (get-parameter "name")))

(defun s3-dispatcher (&optional request)
  (declare (ignore request))
  ;; "Dispatch off the request method"
  (format nil "s3-dispatcher req:~a~%" (request-method*))
  (case (request-method*)
    (:get (get-handler))
    (:put (put-handler))
    (:options :head :post :delete :trace :connect (method-not-allowed))
    (otherwise (not-implemented))))


(setq *dispatch-table*
      ;; (list (create-prefix-dispatcher *s3-prefix* #'s3-dispatcher)))
      (list (create-prefix-dispatcher *s3-prefix* #'get-handler)))
