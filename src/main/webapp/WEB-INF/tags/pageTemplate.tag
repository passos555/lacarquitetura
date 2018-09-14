<%@tag pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="security"%>
<%@ attribute name="titulo" required="true" %>


<c:url value="/" var="contextPath" />
<security:authentication property="principal" var="usuario" />

<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<title>${titulo } - LAC</title>
		<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
		<meta name="_csrf" content="${_csrf.token}"/>
	    <meta name="_csrf_header" content="${_csrf.headerName}"/>
	    <script src="${contextPath}resources/bower_components/jquery/dist/jquery.min.js"></script>
		<link rel="stylesheet" href="${contextPath}resources/plugins/validation/screen.css">
		<link rel="stylesheet" href="${contextPath}resources/bower_components/bootstrap/dist/css/bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}resources/bower_components/font-awesome/css/font-awesome.min.css">
		<link rel="stylesheet" href="${contextPath}resources/bower_components/Ionicons/css/ionicons.min.css">
		<link rel="stylesheet" href="${contextPath}resources/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
		<link rel="stylesheet" href="${contextPath}resources/bower_components/morris.js/morris.css">
		<link rel="stylesheet" href="${contextPath}resources/bower_components/select2/dist/css/select2.min.css">
		<link rel="stylesheet" href="${contextPath}resources/dist/css/AdminLTE.min.css">
		<link rel="stylesheet" href="${contextPath}resources/dist/css/skins/skin-pink.min.css">
		<link rel="stylesheet" href="${contextPath}resources/myStyles/waitMe.min.css">
		<link rel="stylesheet"
		      href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
	</head>
	<body class="hold-transition skin-pink sidebar-mini">
		<script>
			var token = $("meta[name='_csrf']").attr("content");
		    var header = $("meta[name='_csrf_header']").attr("content");
		    $(document).ajaxSend(function(e, xhr, options) {
		        xhr.setRequestHeader(header, token);
		    });
		</script>
		
		<input id="loggedUserId" type="hidden" value="${usuario.idUsuario }" />
		
		<%@ include file="/WEB-INF/views/Geral/header.jsp" %>
		<%@ include file="/WEB-INF/views/Geral/menu.jsp" %>
		
		<jsp:doBody />		
		
		<%@ include file="/WEB-INF/views/Geral/footer.jsp" %>
		
		<script src="//www.google-analytics.com/analytics.js"></script>
		<script src="${contextPath}resources/plugins/validation/jquery.validate.min.js"></script>
		<script src="${contextPath}resources/plugins/validation/additional-methods.min.js"></script>
		<script src="${contextPath}resources/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
		<script src="${contextPath}resources/bower_components/select2/dist/js/select2.full.min.js"></script>
		<script src="${contextPath}resources/bower_components/raphael/raphael.min.js"></script>
		<script src="${contextPath}resources/bower_components/morris.js/morris.min.js"></script>
		<script src="${contextPath}resources/bower_components/jquery-slimscroll/jquery.slimscroll.min.js"></script>
		<script src="${contextPath}resources/bower_components/fastclick/lib/fastclick.js"></script>
		<script src="${contextPath}resources/bower_components/datatables.net/js/jquery.dataTables.min.js"></script>
		<script src="${contextPath}resources/bower_components/datatables.net-bs/js/dataTables.bootstrap.min.js"></script>
		<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.js"></script>
		<script src="${contextPath}resources/plugins/input-mask/jquery.inputmask.extensions.js"></script>
		<script src="${contextPath}resources/dist/js/adminlte.min.js"></script>
		<script src="${contextPath}resources/dist/js/demo.js"></script>
		<script src="${contextPath}resources/myScripts/usuarios.js"></script>
		<script src="${contextPath}resources/myScripts/clientes.js"></script>
		<script src="${contextPath}resources/myScripts/waitMe.min.js"></script>
		<script>
			//Retira mensagens do HTML5
			$('input, select, textarea').on("invalid", function(e) {
			    e.preventDefault();
			});
			
			jQuery.validator.addMethod("lettersonly", function(value, element) {
				  return this.optional(element) || /^[a-z ]+$/i.test(value);
				}, "Apenas letras!");
			
			 function run_waitMe(pForm = null, pType) {
				 	if(pType == 2 && pForm != null && $(pForm).valid()){
				 		$('#container').waitMe({
							effect : 'roundBounce',
							text : 'Por favor aguarde...',
							bg : 'rgba(255,255,255,0.85)',
							color : '#000',
							maxSize : '',
							waitTime : -1,
							textPos : 'vertical',
							fontSize : '22px',
							source : '',
							onClose : function() {}
						})
				 	} else if (pType == 1 && pForm == null){
				 		$('#container').waitMe({
							effect : 'roundBounce',
							text : 'Por favor aguarde...',
							bg : 'rgba(255,255,255,0.85)',
							color : '#000',
							maxSize : '',
							waitTime : -1,
							textPos : 'vertical',
							fontSize : '22px',
							source : '',
							onClose : function() {}
						})
				 	}
				}
			
			$(function () {
				$('.select2').select2();
			})
			
		</script>
	</body>
</html>