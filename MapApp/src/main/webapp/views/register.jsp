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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Register</title>
<!-- Bootstrap core CSS -->
<link href="${path}/assets/css/bootstrap.css" rel="stylesheet">
<link rel="stylesheet" href="${path}/assets/css/bootstrapValidator.css" />

<script type="text/javascript" src="${path}/assets/js/jquery.min.js"></script>
<script type="text/javascript" src="${path}/assets/js/jquery.form.js"></script>
<script type="text/javascript" src="${path}/assets/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="${path}/assets/js/bootstrapValidator.js"></script>
<script type="text/javascript" src="${path}/assets/js/md5.js"></script>

</head>

<body class="text-center">
	<form id="registerForm" method="post" class="form-horizontal" style="margin-top: 300px;">
		<h1>Register</h1>
		<div class="form-group">
			<label class="col-lg-3 control-label">Username</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" name="username" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Password</label>
			<div class="col-lg-5">
				<input type="text" class="form-control" name="email" />
			</div>
		</div>

		<div class="form-group">
			<label class="col-lg-3 control-label">Gender</label>
			<div class="col-lg-5">
				<input type="password" class="form-control" name="password" />
			</div>
		</div>
		
		<div class="form-group">
			<label class="col-lg-3 control-label">Preference</label>
			<div class="col-lg-5">
				<input type="password" class="form-control" name="password" />
			</div>
		</div>

		<div class="form-group">
				<button type="submit" class="btn btn-primary">Register</button>
		</div>
	</form>
</body>
<script type="text/javascript">
$(document).ready(function() {
    $('#registerForm').bootstrapValidator({
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
            $('#registerForm').ajaxSubmit({
            	url:'http://localhost:8888/MapApp/api/v1/user/create',
            	type:'post',
            	success:function(data){
            		if(data.status == '200'){
            			alert('success!');
            			location.href = 'login.jsp';
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
