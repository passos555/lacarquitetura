<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<!DOCTYPE html>
<html>
<head>
	<c:url value="/resources/" var="cssPath" />
	<c:url value="/" var="contextPath" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE-edge">
    <title>Login</title>
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <link rel="stylesheet" href="${contextPath}resources/plugins/validation/screen.css">
    <link rel="stylesheet" href="${cssPath}bower_components/bootstrap/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="${cssPath}bower_components/font-awesome/css/font-awesome.min.css">
    <link rel="stylesheet" href="${cssPath}bower_components/Ionicons/css/ionicons.min.css">
    <link rel="stylesheet" href="${cssPath}dist/css/AdminLTE.min.css">
    <link rel="stylesheet" href="${cssPath}dist/css/skins/skin-pink.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
</head>
<style>
	html, body {
	    position:fixed;
	    top:0;
	    bottom:0;
	    left:0;
	    right:0;
	}
	
	.bg { 
	    background: linear-gradient(white, lightpink);
	    height: 100%; 
	    background-position: center;
	    background-repeat: no-repeat;
	    background-size: cover;
}

</style>
<body class="hold-transition login-page login-bg bg">
<div class="login-box">
    <div class="login-logo">
        <a href="#">LAC Arquitetura</a>
    </div>
  
   	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
      <div class="alert alert-danger alert-dismissible">
          <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
          <h4><i class="icon fa fa-remove"></i> Erro!</h4>
		  Tente novamente!
      </div>
	</c:if>
    
    <div class="login-box-body">
        <p class="login-box-msg">Entre com suas informações para logar</p>
        <form:form servletRelativeAction="/login" id="login" method="post">
            <div class="form-group has-feedback">
                <input type="text" name="username" class="form-control" placeholder="Email" required>
            </div>
            <div class="form-group has-feedback">
                <input type="password" name="password" class="form-control" placeholder="Senha" required>
            </div>
            <div class="row">
            <div class="col-xs-8">
            </div>
            <!-- /.col -->
            <div class="col-xs-12">
              <button type="submit" class="btn btn-primary btn-block btn-flat">Entrar</button>
            </div>
            <!-- /.col -->
            </div>
        </form:form>
    </div>
</div>
	<script src="${contextPath}resources/bower_components/jquery/dist/jquery.min.js"></script>
	<script src="${contextPath}resources/plugins/validation/jquery.validate.min.js"></script>
	<script src="${contextPath}resources/plugins/validation/additional-methods.min.js"></script>
	<script src="${contextPath}resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
	<script>
		//Retira mensagens do HTML5
		$('input, select, textarea').on("invalid", function(e) {
		    e.preventDefault();
		});
	</script>
	<script>
  $().ready(function() {
		$("#login").validate({
			rules: {
				username: {
					required: true,
				},
				password: {
					required: true,
				}
			},
			messages: {
				password: {
					required: "Informe sua senha!",
				},
				username: "Informe seu email!",
			}
		});
	});
  
  </script>
</body>
</html>