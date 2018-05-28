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
<link rel="stylesheet" href="${path }/assets/css/bootstrap-table-expandable.css">
<link rel="stylesheet" href="http://cache.amap.com/lbs/static/main1119.css"/>
<!-- js -->
<script src="http://cache.amap.com/lbs/static/es5.min.js"></script>
<script src="http://webapi.amap.com/maps?v=1.4.6&key=cfdfd2d68ef896a2e6b0d66ee36dc288&plugin=AMap.CitySearch,AMap.Transfer,AMap.Autocomplete,AMap.PlaceSearch,AMap.Geocoder"></script>
<script type="text/javascript" src="http://cache.amap.com/lbs/static/addToolbar.js"></script>

<script type="text/javascript" src="${path}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrap.min.js"></script>
<script src="${path }/assets/js/bootstrap-table-expandable.js"></script>
<script src="${path }/assets/js/template-native.js"></script>
<script src="${path }/assets/js/jquery.citys.js"></script>
	
<style type="text/css">
nav li{
	margin-top: 10px;
}
label {
	color: #000000;
}
.click_work {
	background-color: #FFFFFF;
}
select {
	color: #000000;
}
#panel {
      position: absolute;
      background-color: white;
      max-height: 80%;
      overflow-y: auto;
      top: 10px;
      right: 10px;
      width: 250px;
      border: solid 1px silver;
}
 #weather {
            height: 180px;
            background-color: #fff;
            padding-left: 10px;
            padding-right: 10px;
            position: absolute;
            bottom: 20px;
            font-size: 12px;
            right: 10px;
            border-radius: 3px;
            line-height: 20px;
            border: 1px solid #ccc;
 }
 .weather{
     width: 60px;
     padding-left: 8px;
     display: inline-block;
 }
 #interest_panel {
            position: absolute;
            background-color: white;
            max-height: 90%;
            overflow-y: auto;
            top: 10px;
            right: 10px;
            width: 280px;
        }
.poi-name{
	color: #000000;
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
                	<!-- 
                <li>
                	<center><label style="color: #DDDDB8">地址查询</label></center>
                    <input type="text" name="keyword" class="form-control">
                    <div id="word" style="color: #000000"></div>
            		<center><button type="button" onclick="service.parseAddress()" class="btn btn-success">搜索</button></center>
                </li>
                     -->
                <li>
                    <a href="javascript:service.search()"><i class="fa fa-fw fa-bank"></i> 地点查询</a>
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
                    <a href="javascript:$('#myModal').modal()"><i class="fa fa-fw fa-cog"></i> 偏好设置</a>
                </li>
            </ul>
        </nav>
        <!-- /#sidebar-wrapper -->

        <!-- Page Content -->
        <div id="page-content-wrapper">
          <button type="button" class="hamburger is-closed animated fadeInLeft" data-toggle="offcanvas">
            <span class="hamb-top"></span>
            <span class="hamb-middle">
            </span>
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
	<div id="container"></div>
    <!-- map end-->
    <!-- tips -->
    <div id="myPageTop" style="display: none;">
	    <table>
	        <tr>
	            <td>
	                <label>请输入关键字：</label>
	            </td>
	        </tr>
	        <tr>
	            <td>
	                <input id="tipinput"/>
	            </td>
	        </tr>
	    </table>
	</div>
	<!-- address -->
	<div id="tip">
	    <span id="result"></span>
	</div>
	<!-- route -->
	<div id="panel"></div>
	<!-- interest -->
	<div id="interest_panel"></div>
</body>
	<script type="text/javascript" src="${path}/assets/js/amap-init.js"></script>
	<script type="text/javascript" src="${path}/assets/js/amap.js"></script>
	<script type="text/javascript" src="${path}/assets/js/amap-service.js"></script>
</html>
