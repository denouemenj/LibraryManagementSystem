<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Borrow</title>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
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
            /* Enable use of floated navbar text */
            .navbar-text.pull-right {
                float: none;
                padding-left: 5px;
                padding-right: 5px;
            }
        }
    </style>
</head>
<body>
	<form action="${pageContext.request.contextPath }/user/insert" method="post" class="definewidth m20">
<input type="hidden" name="bid" value="${book.id}" />
    <table class="table table-bordered table-hover definewidth m10">
        <tr>
        	 &nbsp;&nbsp;Comfirm your book info:
            <td width="10%" class="tableleft">Category</td>
            <td><input type="text" name="sname" value="${ book.sname}" disabled="disabled"/></td>
        </tr>
        <tr>
            <td class="tableleft">Title</td>
            <td><input type="text" name="bname" value="${book.bname}" disabled="disabled"/></td>
        </tr>
        <tr>
            <td class="tableleft">Author</td>
            <td><input type="text" name="author" value="${book.author}" disabled="disabled"/></td>
        </tr>
        <tr>
            <td class="tableleft">Publisher</td>
            <td><input type="text" name="birth" value="${book.birth}" disabled="disabled"/></td>
        </tr>
        <tr>
             <td class="tableleft">Edition</td>
            <td><input type="text" name="edition" value="${book.edition}" disabled="disabled"/></td>
        </tr>
        <tr>
              <td class="tableleft">Amount left</td>
            <td><input type="text" name="number" value="${book.number}" disabled="disabled"/></td>
        </tr>
        <tr>
            <td class="tableleft"></td>
            <td>
           <c:if test="${book.number>0}">
           			<button type="submit" class="btn btn-primary" type="button">Confirm</button>	&nbsp;&nbsp;<a type="button" class="btn btn-success" name="backid" id="backid" href="<%=request.getContextPath()%>/user/show">Go back</a>
           </c:if>
            <c:if test="${book.number<=0}">
           		<a type="submit" class="btn btn-primary" type="button" href="<%=request.getContextPath()%>/user/reserve?bkid=${book.id}">Reserve</a>	&nbsp;&nbsp;<a type="button" class="btn btn-success" name="backid" id="backid" href="<%=request.getContextPath()%>/user/show">Go back</a>
           </c:if>
            
            </td>
        </tr>
    </table>
</form>
</body>
</html>
<script>
    $(function () {       
		$('#backid').click(function(){
				window.location.href="{:U('User/index')}";
		 });

    });
</script>