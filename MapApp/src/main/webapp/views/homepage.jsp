<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();///MapApp 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//http://localhost:8888/MapApp/
request.setAttribute("path", path);
%>

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0"> 
<title>游必有方</title>
<!-- css -->
<link href="${path}/assets/css/bootstrap.css" rel="stylesheet">
<link href="${path}/assets/css/homepage-style.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/assets/css/prompt.css" />

<!-- js -->
<script type="text/javascript" src="${path}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=2.0&ak=Aa7xKwUOb51CW6efijIEBedUHFauvLIw"></script>
	
<style type="text/css">
body,html,#allmap {
	width: 100%;
	height: 100%;
	overflow: hidden;
	margin: 0;
	font-family: "微软雅黑";
	z-index: -1;
}
label {
	color: #000000;
}
li {
	margin-top: 10px;
}
</style>
</head>

<body>
	
	<div id="wrapper">
        <div class="overlay"></div>
    
        <!-- Sidebar -->
        <nav class="navbar navbar-inverse navbar-fixed-top" id="sidebar-wrapper" role="navigation">
            <ul class="nav sidebar-nav">
            	<br>
                <li class="sidebar-brand">
                    <center><p style="color: #CDC5D9;font-size: 15px;">欢迎您：<strong><%=request.getSession().getAttribute("user") %></strong></p></center>
                </li>
                <li>
                	<center><label style="color: #DDDDB8">地址查询</label></center>
                    <input type="text" name="keyword" class="form-control">
            		<center><button type="button" onclick="service.parseAddress()" class="btn btn-success">搜索</button></center>
                </li>
                <li>
                    <a href="#" id="a_address"><i class="fa fa-fw fa-bank"></i> 经纬度查询</a>
                </li>
                <li>
                    <a href="#" id="a_transit"><i class="fa fa-fw fa-bank"></i> 路径规划</a>
                </li>
                <li>
                    <a href="#" id="a_weather"><i class="fa fa-fw fa-bank"></i> 目的地天气查询</a>
                </li>
                <li>
                    <a href="#" id="a_interest"><i class="fa fa-fw fa-dropbox"></i> 兴趣点查询</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-fw fa-cog"></i> 偏好设置</a>
                </li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
          <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle"></span>
            <span class="hamb-bottom"> </span>
          </button>
            <div class="container">
            </div>
        </div>
        <!-- /#page-content-wrapper -->

    </div>
    <!-- /#wrapper -->
    
    <%@ include file="prompt.jsp" %>
	
	<!-- map start-->
	<div id="allmap"></div>
    <!-- map end-->
    
	<script type="text/javascript" src="${path}/assets/js/init.js"></script>
	<script type="text/javascript" src="${path}/assets/js/baidumap.js"></script>
	<script type="text/javascript" src="${path}/assets/js/service.js"></script>
</body>
</html>