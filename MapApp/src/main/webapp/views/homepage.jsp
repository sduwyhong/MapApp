<%@ page language="java" import="java.util.*" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <a href="#"><i class="fa fa-fw fa-bank"></i> 经纬度查询</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-fw fa-bank"></i> 路径规划</a>
                </li>
                <li>
                    <a href="#"><i class="fa fa-fw fa-bank"></i> 目的地天气查询</a>
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
    
	<!-- prompt start -->
	<div id='_start' style="overflow: auto;">
		<div id='_close' style="display: none;">
			<span class="glyphicon glyphicon-remove"></span>
		</div>
		<br /> 
		<!--登录框-->
		<div id="login_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">地址查询</span>
			</div>
			<div id="form_container1">
				<br />
				<label>地区(Region)</label>
				<input type="text" name="region" class="form-control" placeholder="地区" value="济南" />
				<br>
				<label>兴趣点(Query)</label>
				<input type="text" name="query" class="form-control" placeholder="兴趣点" />
				<br>
				<center><input type="button" value="查询" class="btn btn-success" onclick="service.interest()" /></center>
			</div>
		</div>
		<!--兴趣点列表-->
		<div id="interest_container" style="display: none;">
			<div id="lab1">
				<span id="lab_login">为您搜索到以下结果</span>
			</div>
			<div id="form_container1">
				<ul>
					<li class="interest_item" hidden="hidden" style="list-style-type:decimal; margin-right: 10px; color: #000000">
						<a href="#" style="color: #00BFFF"></a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- prompt end -->
	
	<!-- map start-->
	<div id="allmap"></div>
    <!-- map end-->
    
	<script type="text/javascript">
		$(document).ready(function () {
		  var trigger = $('.hamburger'),
		      overlay = $('.overlay'),
		     isClosed = false;

		    trigger.click(function () {
		      hamburger_cross();      
		    });

		    function hamburger_cross() {

		      if (isClosed == true) {          
		        overlay.hide();
		        trigger.removeClass('is-open');
		        trigger.addClass('is-closed');
		        isClosed = false;
		      } else {   
		        overlay.show();
		        trigger.removeClass('is-closed');
		        trigger.addClass('is-open');
		        isClosed = true;
		      }
		  }
		  
		  $('[data-toggle="offcanvas"]').click(function () {
		        $('#wrapper').toggleClass('toggled');
		  }); 
			//打开会员登录 
			$("#a_interest").click(function() {
				$('.hamburger').trigger('click');
				$('#allmap').hide();
				$("#_close").show();
				$("#_start").animate({
					left: '350px',
					height: '520px',
					width: '400px'
				}, 500, function() {
					$("#login_container").show(500);
					$("#_close").animate({
						height: '40px',
						width: '40px'
					}, 500);
				});
			});
			//关闭
			$("#_close").click(function() {
				$('#allmap').show();
				$("#_close").animate({
					height: '0px',
					width: '0px'
				}, 500, function() {
					$("#_close").hide(500);
					$("#login_container").hide(500);
					$("#interest_container").hide(500);
					$("#_start").animate({
						left: '0px',
						height: '0px',
						width: '0px'
					}, 500);
				});
			});
			//去 登录
			$("#toLogin").click(function(){
				$("#login_container").hide(500);
			});
		});
	</script>
	<script type="text/javascript">
		// 百度地图API功能
		var map = new BMap.Map("allmap"); // 创建Map实例
		map.centerAndZoom(new BMap.Point(117.147284, 36.673282), 18); // 初始化地图,设置中心点坐标和地图级别
		//添加地图类型控件
		map.addControl(new BMap.MapTypeControl({
			mapTypes : [ BMAP_NORMAL_MAP, BMAP_HYBRID_MAP ]
		}));
		map.setCurrentCity("济南"); // 设置地图显示的城市 此项是必须设置的
		map.enableScrollWheelZoom(true); //开启鼠标滚轮缩放
	</script>
	<script type="text/javascript">
		var service = {
				parseAddress: function() {
					$('.hamburger').trigger('click');
					var keyword = $('input[name=keyword]').val();
					var myGeo = new BMap.Geocoder();
					myGeo.getPoint(keyword, function(point){
						if (point) {
							map.centerAndZoom(point, 16);
							map.addOverlay(new BMap.Marker(point));
						}else{
							alert("您选择地址没有解析到结果!");
						}
					}, "济南市");
				},
				locationInterest: function(address) {
					$("#_close").trigger('click');
					$('#allmap').show();
					var myGeo = new BMap.Geocoder();
					myGeo.getPoint(address, function(point){
						if (point) {
							map.centerAndZoom(point, 16);
							map.addOverlay(new BMap.Marker(point));
						}else{
							alert("您选择地址没有解析到结果!");
						}
					}, "济南市");
				},
				interest: function(){
					$.ajax({
						url:'http://localhost:8888/MapApp/api/v1/map/place',
						data:{
							region: $('input[name=region]').val(),
							query: $('input[name=query]').val()
						},
						success:function(data){
							$('#login_container').hide();
							$('#interest_container').show();
							for(var i in data.results) {
								var template = $('.interest_item:first').clone();
								template.removeAttr('hidden');
								var a = template.children('a:eq(0)');
								a.text(data.results[i].name);
								a.attr('href',"javascript:service.locationInterest('"+data.results[i].address+"')");
								$('.interest_item:last').after(template);
							}
						}
					})
				}
		}
	</script>
</body>
</html>
