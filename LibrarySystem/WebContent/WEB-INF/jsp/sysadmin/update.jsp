<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.sorted.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
    <style type="text/css">
        body {
            padding-bottom: 40px;
        }
        .sidebar-nav {
            padding: 9px 0;
        }

        @media (max-width: 980px) {
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/sysadmin/update" method="post" class="definewidth m20">
	<input type="hidden" name="id" value="${book.id }"/>
<table class="table table-bordered table-hover definewidth m10">
    <tr>
        <td width="10%" class="tableleft">Title</td>
        <td><input type="text" name="bname" value="${book.bname }"/></td>
    </tr>
    <tr>
        <td class="tableleft">Category</td>
        <td>
        <!-- 完善数据库后添加补上类别 -->
	    <select class="form-control" name="sid">
	    	<c:if test="${book.sid ==1}">
	    		<option  selected="selected" value="1">CS</option>
	    		<option value="2">Mathematics</option>
	    		<option value="3">French</option>
	    		<option value="4">English</option>
	    		<option value="5">生活类</option>
	    	</c:if>
	    	<c:if test="${book.sid ==2}">
		    	<option value="1">CS</option>
				<option selected="selected" value="2">Mathematics</option>
				<option value="3">French</option>
	    		<option value="4">English</option>
	    	</c:if>
	    	<c:if test="${book.sid ==3}">
		    	<option value="1">CS</option>
				<option value="2">Mathematics</option>
				<option selected="selected" value="3">French</option>
	    		<option value="4">English</option>
	    	</c:if>
	    	<c:if test="${book.sid ==4}">
		    	<option value="1">CS</option>
				<option value="2">Mathematics</option>
				<option value="3">French</option>
	    		<option selected="selected" value="4">English</option>
	    	</c:if>
		</select>
        </td>
    </tr>
    <tr>
        <td class="tableleft">Author</td>
        <td><input type="text" name="author" value="${book.author }"/></td>
    </tr>
    <tr>
        <td class="tableleft">Publisher</td>
        <td><input type="text" name="birth" value="${book.birth }"/></td>
    </tr>
    <tr>
       <td class="tableleft">Edition</td>
        <td><input type="text" name="edition" value="${book.edition }"/></td>
    </tr>
    <tr>
        <td class="tableleft">Book Amoumt</td>
        <td><input type="text" name="number" value="${book.number }"/></td>
    </tr>
    <tr>
        <td class="tableleft"></td>
        <td>
            <button type="submit" class="btn btn-primary" type="button">Edit</button> &nbsp;&nbsp;<a type="button" class="btn btn-success" name="backid" id="backid" href="<%=request.getContextPath()%>/sysadmin/show">Go back</a>
        </td>
    </tr>
</table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="index.html";
		 });

    });
</script>