<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Management</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/jquery.pagination.css" />
 	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/bootstrap-responsive.css" />
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/style.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/ckform.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/common.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/jquery.pagination.min.js"></script>
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
    <script>
			$(function() {
				var cp=<%= request.getAttribute("currentPage")%>;
				var tp=<%= request.getAttribute("totalPage")%>;
				$("#pagination2").pagination({
					currentPage:cp,
					totalPage:tp,
					isShow: false,
					count: 6,
					prevPageText: "< Back",
					nextPageText: "Next >",
					callback: function(current) {
						/* 给后台传到了Cuttentpage */
						$("#CurrentPage").val(current);
						$("#form").submit();
					}
				});
			});
	</script>
</head>
<body>
	<form class="form-inline definewidth m20" id="form"
		action="<%=request.getContextPath()%>/sysadmin/show" method="post">
		Title： <input type="text" name="bname" id="username"
			class="abc input-default" placeholder="Book Keyword" value="">&nbsp;&nbsp;
		Category:<select class="form-control" name="sid">
					<option value="0" selected="selected">--Category--</option>
					<c:forEach items="${sorts }" var="sort">
						<option value="${sort.id }" <c:if test="${sid==sort.id }">selected</c:if>>${sort.sname }</option>
					</c:forEach>
		</select>&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">Search</button>
		&nbsp;&nbsp; <a type="button" class="btn btn-primary"
			href="<%=request.getContextPath()%>/sysadmin/toAdd">Add</a>&nbsp;&nbsp;
		<input id="CurrentPage" type="hidden" name="currentPage" value="1" />
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>Title</th>
				<th>Category</th>
				<th>Author</th>
				<th>Publisher</th>
				<th>Edition</th>
				<th>Book Amount</th>
				<th>Action</th>
			</tr>
		</thead>
		<c:forEach items="${page.list }" var="book">
			<tr>
				<td>${book.bname}</td>
				<td>${book.sname}</td>
				<td>${book.author}</td>
				<td>${book.birth}</td>
				<td>${book.edition}</td>
				<td>${book.number}</td>
				<td><a type="button" class="btn btn-success"
					href="<%=request.getContextPath()%>/sysadmin/selById?id=${book.id}">Edit</a>
					<a type="button" class="btn btn-danger"
					href="<%=request.getContextPath()%>/sysadmin/delete?id=${book.id}">Delete</a>
				</td>
			</tr>
		</c:forEach>
	</table>
	<center>
		<div class="box">
			<div id="pagination2" class="page fl"></div>
		</div>
	</center>
</body>
</html>