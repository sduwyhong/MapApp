<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
request.setAttribute("path", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> 
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>基于Bootstrap的可展开表格行的jQuery表格插件</title>
	
	<link href="${path }/assets/css/bootstrap.css" rel="stylesheet">
	
    <script src="${path }/assets/js/jquery.min.js"></script>
    <script src="${path }/assets/js/bootstrap.min.js"></script>

	<!-- INCLUDES -->
    <link rel="stylesheet" href="${path }/assets/css/bootstrap-table-expandable.css">
    <script src="${path }/assets/js/bootstrap-table-expandable.js"></script>
	
</head>
<body>

		<div class="container">
			<table class="table table-hover table-expandable">
                <thead>
                    <tr>
                        <th>Country</th>
                        <th>Population</th>
                        <th>Area</th>
                        <th>Official languages</th>
                    </tr>
                </thead>
				<tbody>
					<tr>
						<td>United States of America</td>
						<td>306,939,000</td>
						<td>9,826,630 km2</td>
						<td>English</td>
					</tr>
					<tr>
						<td colspan="5">
							<h4>Additional information</h4>
							<ul>
								<li>USA on Wikipedia</li>
								<li>National Atlas of the United States</li>
								<li>这里显示更多信息</li>
							</ul>   
						</td>
					</tr>
				</tbody>
            </table>
		</div>
</body>
</html>
