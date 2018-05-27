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

<link href="${path}/assets/css/style.css" rel="stylesheet" type="text/css" />
<link href="${path}/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/assets/css/bootstrapValidator.css"/>
<link rel="stylesheet" href="${path}/assets/css/jquery.slider.css"/>

<script type="text/javascript" src="${path}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${path}/assets/js/md5.js"></script>
<script type="text/javascript" src="${path}/assets/js/code.js"></script>
<script type="text/javascript" src="${path}/assets/js/jquery.slider.min.js"></script>

</head>
<body onLoad="sendRequest()" style="background:url('${path}/assets/images/bg.jpg') no-repeat;background-size: 100%;">

<div class="videozz"></div>
	<video  autoplay muted loop poster="../assets/images/fallba1ck.jpg">
		<source src="../assets/images/mov.mp4">		
		你的游览器不支持video支持
	</video>
    
<div class="box">
	
	<div class="box-a">
    <div class="m-2">
    	<center>
	          <form id="loginForm" style="margin-top: 40px;margin-right: 100px;">
	          	<h4><a href="views/fancy-register.jsp">没有账号？点我注册</a></h4>
	              <div class="m-2-2 form-group">
	                 <input type="text" name="username" placeholder="请输入账号" />
	              </div>
	              <div class="m-2-2 form-group">
	                 <input type="password" name="password" placeholder="请输入密码"/>
	              </div>
	              <div class="code m-2-2 form-group">
		    	<input type="text" name="code" style="width: 195px;" placeholder="请输入验证码" />
		    	<!-- 验证码外必须被class为code的div嵌套 -->
		        <canvas id="canvas" width="100" height="30"></canvas>
			    </div>
				<div id="slider1" class="slider"></div>
	             <div class="m-2-2 form-group">
	                <button type="submit" value="登陆" id="login-btn"> 登陆 </button>
	             </div>
	          </form>
         </center>
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
    <div class="m-9"><div class="masked1" id="sx8">游必有方</div></div> 
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
<script src="${path }/assets/js/common.min.js"></script>
</body>
<script type="text/javascript">
$(document).ready(function() {
	//ajax加载效果
	$(document).ajaxStart(function(){
		$('#loading').show();
	})
	$(document).ajaxStop(function(){
		$('#loading').hide();
	})
	//验证码
	var show_num = [];
	draw(show_num);
	$("#canvas").on('click',function(){
		draw(show_num);
	})
	//滑块
	var sliderDone = false;
	$("#slider1").slider({
		callback: function(result) {
			sliderDone = result;
		}
	});
	//验证
    $('#loginForm').bootstrapValidator({
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
			
            var val = $("input[name=code]").val().toLowerCase();
    		var num = show_num.join("");
    		if(val==''){
    			alert('请输入验证码！');
    		}else if(val == num){
    			if(sliderDone){
					var psw = $('input[name=password]');
	                psw.val(hex_md5(psw.val()));
	                // Use Ajax to submit form data
	                $form.ajaxSubmit({
	                	url:'http://localhost:8888/MapApp/api/v1/user/login',
	                	type:'post',
	                	success:function(data){
	                		if(data.status == '200'){
	                			alert('welcome!');
	                			location.href = 'views/homepage.jsp';
	                		}else{
	                			alert(data.message);
	                			//重置表单
	                			$('input[name=password]').val('');
	                			$('input[name=code]').val('');
	                			//重置验证码
	                			$("input[name=code]").val('');
	                			draw(show_num);
	                			//重置滑块
	                			$("#slider1").slider("restore");
	                			sliderDone = false;
	                		}
	                	},
	                	error:function(){
	                		alert('unexpected error');
	                	}
	                });
    			}else{
    				alert('请完成滑块验证！');
    				//重置滑块
    				$("#slider1").slider("restore");
    				sliderDone = false;
    				//使按钮可用
    				$('button').removeAttr('disabled');
    			}
    		}else{
    			alert('验证码错误！请重新输入！');
    			//重置验证码
    			$("input[name=code]").val('');
    			draw(show_num);
    			//重置滑块
    			$("#slider1").slider("restore");
    			sliderDone = false;
    			//使按钮可用
   				$('button').removeAttr('disabled');
    		}
            
        });
});
</script>
</html>
