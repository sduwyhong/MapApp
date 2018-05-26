<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();///MapApp 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";//http://localhost:8888/MapApp/
request.setAttribute("path", path);
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Signin</title>
	<link rel="icon" href="${path}/assets/image/favicon.ico">
    <!-- Bootstrap core CSS -->
    <link href="${path}/assets/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="${path}/assets/css/bootstrapValidator.css"/>
    <!-- Custom styles for this template -->
    <link href="${path}/assets/css/signin.css" rel="stylesheet">
    
    <script type="text/javascript" src="${path}/assets/js/jquery.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/jquery.form.js"></script>
    <script type="text/javascript" src="${path}/assets/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="${path}/assets/js/bootstrapValidator.js"></script>
    <script type="text/javascript" src="${path}/assets/js/md5.js"></script>
    
  </head>

  <body class="text-center">
    <form class="form-signin" id="loginForm">
      <img class="mb-4" src="${path}/assets/image/favicon.ico" alt="" width="72" height="72">
      <h1 class="h3 mb-3 font-weight-normal">Please sign in</h1>
       <div class="form-group">
	      <label class="sr-only">Username</label>
      	  <input type="text" name="username" class="form-control" placeholder="Username" autofocus>
      </div>
      <div class="form-group">
	      <label class="sr-only">Password</label>
	      	<input type="password" name="password" class="form-control" placeholder="Password" >
       </div>
      <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
      <p class="mt-5 mb-3 text-muted">&copy; 2017-2018</p>
    </form>
  </body>
<script type="text/javascript">
$(document).ready(function() {
    $('#loginForm').bootstrapValidator({
            message: 'This value is not valid',
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
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
			
            //var psw = $('input[name=password]');
            //psw.val(hex_md5(psw.val()));
            
            // Use Ajax to submit form data
            $('#loginForm').ajaxSubmit({
            	url:'http://localhost:8888/MapApp/api/v1/user/login',
            	type:'post',
            	success:function(data){
            		if(data.status == '200'){
            			alert('welcome!');
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
