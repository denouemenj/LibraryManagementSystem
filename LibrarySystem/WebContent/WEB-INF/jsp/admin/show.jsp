<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Borrow Management</title>
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
            /* Enable use of floated navbar text */
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
				prevPageText: "< Previous",
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
	<form id="form" class="form-inline definewidth m20"
		action="<%=request.getContextPath()%>/admin/show" method="post">
		Name： <input type="text" name="uname" id="username"
			class="abc input-default" placeholder="User keyword" 
			<c:if test="${uname!=null and uname!='' }">value="${uname }"</c:if>>&nbsp;&nbsp;
		Category:<select class="form-control" name="sid">
			<option value="0" selected="selected">--Category--</option>
			<c:forEach items="${sorts }" var="sort">
				<option value="${sort.id }"
					<c:if test="${sid==sort.id }">selected</c:if>>${sort.sname }</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<button type="submit" class="btn btn-primary">Search</button>
		&nbsp;&nbsp;
		<input id="CurrentPage" type="hidden" name="currentPage" value="1" />
	</form>
	<table class="table table-bordered table-hover definewidth m10">
		<thead>
			<tr>
				<th>User</th>
				<th>Book</th>
				<th>Category</th>
				<th>Author</th>
				<th>Publisher</th>
				<th>Edition</th>
				<th>Time</th>
				<th>Status</th>
				<th>Action</th>
			</tr>
		</thead>
		<c:forEach items="${page.list }" var="borrow">
			<tr>
				<td>${borrow.uname}</td>
				<td>${borrow.bname}</td>
				<td>${borrow.sname}</td>
				<td>${borrow.author}</td>
				<td>${borrow.birth}</td>
				<td>${borrow.edition}</td>
				<td><fmt:formatDate value="${borrow.startTime}" type="time" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				<td>
					<button type="button" class="btn btn-default disabled" disabled>
						<c:if test="${borrow.status==0}">Awaiting</c:if>
						<c:if test="${borrow.status==1}">Confirmed</c:if>
						<c:if test="${borrow.status==2}">Objected</c:if>
					</button>
				</td>
				<td>
					<c:if test="${borrow.status==0 && borrow.number>0}">
						<a type="button" class="btn btn-success" href="<%=request.getContextPath()%>/admin/allow?id=${borrow.id}">Confirm</a>
					</c:if>
					<c:if test="${borrow.status==0}"> 
						<a type="button" class="btn btn-danger" href="<%=request.getContextPath()%>/admin/notAllow?id=${borrow.id}">Object</a>
					</c:if>
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