<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Library Management System</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="${pageContext.request.contextPath }/assets/css/dpl-min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/assets/css/bui-min.css" rel="stylesheet" type="text/css" />
    <link href="${pageContext.request.contextPath }/assets/css/main-min.css" rel="stylesheet" type="text/css" />
</head>
<body>

<div class="header">
    <div class="dl-title">
    		<img src="${pageContext.request.contextPath }/assets/img/logo.png" style="height: 30px;">   
        <span>Library Management System</span>
    </div>
    <div class="dl-log">	
    		Welcome：<span class="dl-log-user">${user.uname }</span><a href="<%=request.getContextPath()%>/user/quit" class="dl-log-quit">[Exit]</a>
    </div>
</div>
<div class="content">
    <div class="dl-main-nav">
        <div class="dl-inform"><div class="dl-inform-title"><s class="dl-inform-icon dl-up"></s></div></div>
        <ul id="J_Nav"  class="nav-list ks-clear">
            <li class="nav-item dl-selected"><div class="nav-item-inner nav-home">Home</div></li>

        </ul>
    </div>
    <ul id="J_NavContent" class="dl-tab-conten">

    </ul>
</div>
<div class="footer">
</div>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/bui-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/common/main-min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/config-min.js"></script>
<script>
    BUI.use('common/main',function(){
        var config = [{id:'1',menu:[{text:'Your Books',items:[
        		{id:'12',text:'Search',href:'<%=request.getContextPath()%>/user/show'},
        		{id:'3',text:'Borrow',href:'<%=request.getContextPath()%>/user/back'},
        		{id:'4',text:'Return',href:'<%=request.getContextPath()%>/user/showBackBook'},
        		{id:'5',text:'Reserve',href:'<%=request.getContextPath()%>/user/showReserveBook'}
       	]}]}];
        new PageUtil.MainPage({
            modulesConfig : config
        });
    });
</script>
</body>
</html>