//JS do Modal de alteração
	$(document).on("click", ".open-Alt", function () {
	    var usuarioId = $(this).data('usuario-id');
	    var usuarioLogin = $(this).data('usuario-login');
	    var usuarioPermissao = $(this).data('usuario-permissao');
	    var usuarioNome = $(this).data('usuario-nome');
	    $(".modal-body #idUsuario").val( usuarioId );
	    $(".modal-body #email").val( usuarioLogin );
	    $(".modal-body #permissao").val( usuarioPermissao );
	    $(".modal-body #nome").val( usuarioNome );
	});


 //Ajax - Muda status do usuario
 /*function change(id) {
  if($("#loggedUserId").val() != id){
	  $.post("changeStatusById", {'id' : id}, function(response) {
       	  if(response.status == 'Ativo'){
       		  $("#status_"+id).html(response.status).removeClass("label-danger").addClass("label-success");
       		  $("#icon_"+id).html(" ").removeClass("fa-check").addClass("fa-remove");
       	  }else{
       		  $("#status_"+id).html(response.status).removeClass("label-success").addClass("label-danger");
       		  $("#icon_"+id).html(" ").removeClass("fa-remove").addClass("fa-check");
       	  }	
         });
  } else {
	  $("#erro").css("display", "block");
  }
 }*/
 
 function change(id){
	 var idForm = id
	 if($("#loggedUserId").val() != id){
		 $.ajax({
			url: "/lac/usuarios/changeStatusById",
			type: "POST",
			data: {id: idForm},
			success: function(response){
				
				if (response.status == 'Ativo') {
					$("#status_" + id).html(response.status).removeClass(
							"label-danger").addClass("label-success");
					$("#icon_" + id).html(" ").removeClass("fa-check").addClass(
							"fa-remove");
				} else {
					$("#status_" + id).html(response.status).removeClass(
							"label-success").addClass("label-danger");
					$("#icon_" + id).html(" ").removeClass("fa-remove").addClass(
							"fa-check");
				}
			},
			error: function(){
				console.log("erro");
			}
		 });
	 } else {
		 $("#erro").css("display", "block");
	 }
 }
 
 
 function run_waitMe() {
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
 
 
 //Esconde o div de erro ao clicar no X
 $("#hideDiv").on("click", function() {
  $("#erro").css("display", "none");
 });
 
 //JS basico para a dataTable
 $(function () {
    $('#userTable').DataTable({
      'paging'      : true,
      'lengthChange': false,
      'searching'   : true,
      'ordering'    : true,
      'info'        : true,
      'autoWidth'   : false
    })
  })
 
 //Validação Form de alteração
 $().ready(function() {
		$("#alter").validate({
			rules: {
				nome: {
					lettersonly: true
				},
				email:{
					email: true
				},
				senha: {
					required: false,
					minlength: 5
				}
			},
			messages: {
				senha: {
					minlength: "Sua senha deve ter no minimo 5 caracteres"
				}
			}
		});
	});
 
 //Validação Form de novo usuário
 $().ready(function() {
		// validate the comment form when it is submitted
		//$("#mainForm").validate();

		// validate signup form on keyup and submit
		$("#novoUsuario").validate({
			rules: {
				senha: {
					required: true,
					minlength: 5
				},
				senhaConfirm: {
					required: true,
					minlength: 5,
					equalTo: "#senha"
				},
				nome: {
					required: true,
					lettersonly: true
				},
				email: {
					required: true,
					email: true
				}
			},
			messages: {
				senha: {
					required: "Informe uma senha!",
					minlength: "Sua senha deve ter no minimo 5 caracteres"
				},
				senhaConfirm: {
					required: "Informe uma senha!",
					minlength: "Sua senha deve ter no minimo 5 caracteres",
					equalTo: "As senhas sao diferentes!"
				},
				email: "Informe um email valido!",
				nome:  "Informe o nome!"
			}
		});
	});
