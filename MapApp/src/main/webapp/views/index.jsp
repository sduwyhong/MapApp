<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<script type="text/javascript" src="${pageContext.request.contextPath }/assets/js/jquery.min.js"></script>
<title>index</title>
</head>
<body>
</body>
</html>
<script type="text/javascript">
	$.ajax({
		url:'http://localhost:8888/MapApp/api/v1/user/preference',
		success:function(data){
			if(data.result == 0){
				location.href = 'http://localhost:8888/MapApp/views/homepage.jsp';
			}else{
				location.href = 'http://localhost:8888/MapApp/views/amap-homepage.jsp';
			}
		}
	})
</script>

