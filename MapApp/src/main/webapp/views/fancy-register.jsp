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

<link href="../assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="${path}/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/assets/css/bootstrapValidator.css"/>
<style type="text/css">
	label{
		color: #F8F8FF;
	}
</style>
<script type="text/javascript" src="../assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${path}/assets/js/md5.js"></script>
</head>
<body onLoad="sendRequest()" style="background:url('../assets/images/bg.jpg') no-repeat;background-size: 100%;">

<div class="videozz"></div>
	<video  autoplay muted loop poster="../assets/images/fallba1ck.jpg">
		<source src="../assets/images/mov.mp4">		
		你的游览器不支持video支持
	</video>
    
<div class="box">
	<div class="box-a">
    <div class="m-2">
          <div class="m-2-1">
            <form id="registerForm">
                <div class="m-2-2 form-group">
                	<label>用户名：</label>
                   <input type="text" name="username" placeholder="请输入账号" />
                </div>
                <div class="m-2-2 form-group">
                	<label>密码：</label>
                   <input type="password" name="password" placeholder="请输入密码"/>
                </div>
                <div class="radio">
                	<label><strong>性别：</strong></label>
                	<label class="radio-inline">
	                  <input type="radio" name="gender" value="男" checked="checked"/>男
	                  </label> 
				    <label class="radio-inline">
	                   <input type="radio" name="gender" value="女" />女
	                   </label>
                </div>
                <div class="radio">
                	<label><strong>地图偏好：</strong></label>
                	<label class="radio-inline">
	                  <input type="radio" name="preference" value="0" checked="checked"/>百度地图
	                  </label> 
				    <label class="radio-inline">
	                   <input type="radio" name="preference" value="1" />高德地图
	                   </label>
                </div>
                <div class="m-2-2 form-group">
                   <button type="submit"> 注册 </button>
                </div>
            </form>
          </div>
    </div>
    <div class="m-5"> 
    <div id="m-5-id-1"> 
    <div id="m-5-2"> 
    <div id="m-5-id-2">  
    </div> 
    <div id="m-5-id-3"></div> 
    </div> 
    </div> 
    </div>   
    <div class="m-10"></div>
    <div class="m-xz7"></div>
    <div class="m-xz8 xzleft"></div>
    <div class="m-xz9"></div>
    <div class="m-xz9-1"></div>
    <!-- ajax加载 -->
    <div id="loading" hidden="hidden">
	    <div class="m-x10"></div>
	    <div class="m-x11"></div>
	    <div class="m-x12 xzleft"></div>
	    <div class="m-x13"></div>
	    <div class="m-x14 xzleft"></div>
	    <div class="m-x15"></div>
	    <div class="m-x16 xzleft"></div>
    </div>
    <div class="m-x17 xzleft"></div>
    <div class="m-x18"></div>
    <div class="m-x19 xzleft"></div>
    <div class="m-x20"></div>  
    <div class="m-8"></div>
    <div class="m-9"><div class="masked1" id="sx8">注册</div></div> 
    <div class="m-11">
    	<div class="m-k-1"><div class="t1"></div></div>
        <div class="m-k-2"><div class="t2"></div></div>
        <div class="m-k-3"><div class="t3"></div></div>
        <div class="m-k-4"><div class="t4"></div></div>
        <div class="m-k-5"><div class="t5"></div></div>
        <div class="m-k-6"><div class="t6"></div></div>
        <div class="m-k-7"><div class="t7"></div></div>
    </div>   
    <div class="m-14"><div class="ss"></div></div>
    <div class="m-15-a">
    <div class="m-15-k">
    	<div class="m-15xz1">
            <div class="m-15-dd2"></div>
        </div>
    </div>
    </div>
    <div class="m-16"></div>
    <div class="m-17"></div>
    <div class="m-18 xzleft"></div>
    <div class="m-19"></div>
    <div class="m-20 xzleft"></div>
    <div class="m-21"></div>
    <div class="m-22"></div>
    <div class="m-23 xzleft"></div>
    <div class="m-24" id="localtime"></div>
    </div>
</div>
<script src="../assets/js/common.min.js"></script>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#registerForm').bootstrapValidator({
            message: 'This value is not valid',
            fields: {
            	//Uncaught RangeError: Maximum call stack size exceeded??
                username: {
                    message: 'The username is not valid',
                    validators: {
                        notEmpty: {
                            message: 'The username is required and can\'t be empty'
                        },
                        stringLength: {
                            min: 3,
                            max: 10,
                            message: 'The username must be more than 3 and less than 10 characters long'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required and can\'t be empty'
                        }
                    }
                }
            }
        })
        .on('success.form.bv', function(e) {
            // Prevent form submission
            e.preventDefault();

            // Get the form instance
            var $form = $(e.target);

            // Get the BootstrapValidator instance
            var bv = $form.data('bootstrapValidator');
			
            var psw = $('input[name=password]');
            psw.val(hex_md5(psw.val()));
            
            var json = {
            		username:$('input[name=username]').val(),
            		password:$('input[name=password]').val(),
            		gender:$('input[name=gender]:checked').val(),
            		preference:$('input[name=preference]:checked').val()
            	}
            // Use Ajax to submit form data
            $.ajax({
            	url:'http://localhost:8888/MapApp/api/v1/user/create',
            	type:'post',
            	data:{
            		record:JSON.stringify(json)
            	},
            	success:function(data){
            		if(data.status == '200'){
            			alert('success!');
            			location.href = 'fancy-login.jsp';
            		}else{
            			alert(data.message);
            		}
            	},
            	error:function(){
            		alert('unexpected error');
            	}
            });
        });
});
</script>
</html>
