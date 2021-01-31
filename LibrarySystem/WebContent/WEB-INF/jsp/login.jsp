<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
  <head>
    <title>Library Management System</title>
    <meta charset="utf-8">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.min.css" type="text/css"></link>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/mycss.css" type="text/css"></link>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/bootstrapValidator.min.js"></script>
   <script>
        $(function(){
            $('#frmLogin').bootstrapValidator({
                feedbackIcons:{
                    valid:'glyphicon glyphicon-ok',
                    invalid:'glyphicon glyphicon-remove',
                    validating:'glyphicon glyphicon-refresh'
                },
                fields:{
                    code:{
                        validators:{
                            notEmpty:{
                                message:'Username cannot be empty'
                            }
                        }
                    },
                    password: {
                        validators: {
                            notEmpty: {
                                message: 'Password cannot be empty'
                            }
                        }
                    }
                }
            });
        });
    </script>    
    
  </head>
  <body>
    <div class="container div-signin">
      <div class="panel panel-primary div-shadow">
	    <div class="panel-heading">
	    	<h3>Library Management System</h3>
	    </div>
	    <div class="panel-body">
	      <form action="${pageContext.request.contextPath }/login" class="form-horizontal" method="post" id="frmLogin">
		     <div class="form-group">
		       <label class="col-sm-3 control-label">Username：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="text" placeholder="Please enter your username" name="code">
		       </div>
		    </div>
		     <div class="form-group">
		       <label class="col-sm-3 control-label">Password：</label>
		       <div class="col-sm-9">
		         <input class="form-control" type="password" placeholder="Please enter your password" name="password">
		       </div>
		    </div>
		     <div class="form-group">
		       <label class="col-sm-3 control-label">Role：</label>
		       <div class="col-sm-9">
		       	 <select class="form-control" name="loginType">
		       	 	<option value="0">-Role-</option>
		       	 	<option value="1">Common</option>
		       	 	<option value="2">Admin</option>
		       	 	<option value="3">System Admin</option>
		       	 </select>
		       </div>
		    </div>
		    <div class="form-group">
		       <div class="col-sm-3">
		       </div>
		       <div class="col-sm-9 padding-left-0">
		       	 <div class="col-sm-4">
			         <button type="submit" class="btn btn-primary btn-block">Log In</button>
		       	 </div>
		       	 <div class="col-sm-4">
			         <button type="reset" class="btn btn-primary btn-block">Reset</button>
		       	 </div>
		       	 <div class="col-sm-4" style="padding:0;margin-left:-10px;width:auto;padding-top: 5px;">
		       	 	<c:if test="${msg!=null }">
			       		<span class="text-danger">${msg}</span>
			       </c:if>
		       	 </div>
		       </div>
		    </div>
	      </form>
	      <!-- login form end -->
	    </div>
	  </div>
    </div>
  </body>
</html>
