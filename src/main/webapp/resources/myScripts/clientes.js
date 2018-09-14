//Busca CEP 
$(document).ready(
	function() {
		
		function limpa_formulario_cep() {
			// Limpa valores do formulário de cep.
			$("#cep").val("");
			$("#rua").val("");
			$("#bairro").val("");
			$("#cidade").val("");
			$("#uf").val("");
			$("#ibge").val("");
		}

		//Quando o campo cep perde o foco.
		$("#cep").blur(
				function() {

					//Nova variável "cep" somente com dígitos.
					var cep = $(this).val().replace(/\D/g, '');

					//Verifica se campo cep possui valor informado.
					if (cep != "") {

						//Expressão regular para validar o CEP.
						var validacep = /^[0-9]{8}$/;

						//Valida o formato do CEP.
						if (validacep.test(cep)) {

							//Preenche os campos com "..." enquanto consulta webservice.
							$("#rua").val("...");
							$("#bairro").val("...");
							$("#cidade").val("...");
							$("#uf").val("...");
							$("#ibge").val("...");

							//Consulta o webservice viacep.com.br/
							$.getJSON("https://viacep.com.br/ws/" + cep
									+ "/json/?callback=?", function(dados) {

								if (!("erro" in dados)) {
									//Atualiza os campos com os valores da consulta.
									$("#rua").val(dados.logradouro);
									$("#bairro").val(dados.bairro);
									$("#cidade").val(dados.localidade);
									$("#uf").val(dados.uf);
									$("#ibge").val(dados.ibge);
								} //end if.
								else {
									//CEP pesquisado não foi encontrado.
									limpa_formulario_cep();
									alert("CEP não encontrado.");
								}
							});
						} //end if.
						else {
							//cep é inválido.
							limpa_formulario_cep();
							alert("Formato de CEP inválido.");
						}
					} //end if.
					else {
						//cep sem valor, limpa formulário.
						limpa_formulario_cep();
					}
				});
		
		/*jQuery.validator.addMethod("cep", function (value) {
			
			value = jQuery.trim(value);
			value = value.replace(/\D/g, '');

			if (value != "") {

				//Expressão regular para validar o CEP.
				var validacep = /^[0-9]{8}$/;
				
				//Valida o formato do CEP.
				if (validacep.test(value)) {

					//Preenche os campos com "..." enquanto consulta webservice.
					$("#rua").val("...");
					$("#bairro").val("...");
					$("#cidade").val("...");
					$("#uf").val("...");
					$("#ibge").val("...");
					
					$.ajax({
					      url: "https://viacep.com.br/ws/" + value
							+ "/json/?callback=?",
					      type: 'GET',
					      dataType: "json",
					      crossDomain: true,
					      success: function(dados) {
					    	  	$("#rua").val(dados.logradouro);
								$("#bairro").val(dados.bairro);
								$("#cidade").val(dados.localidade);
								$("#uf").val(dados.uf);
								$("#ibge").val(dados.ibge);
					      }
					    });
					
					
				} 
			}
		});*/
		
		jQuery.validator.addMethod("cpf", function(value, element) {
			   value = jQuery.trim(value);

			    value = value.replace('.','');
			    value = value.replace('.','');
			    cpf = value.replace('-','');
			    while(cpf.length < 11) cpf = "0"+ cpf;
			    var expReg = /^0+$|^1+$|^2+$|^3+$|^4+$|^5+$|^6+$|^7+$|^8+$|^9+$/;
			    var a = [];
			    var b = new Number;
			    var c = 11;
			    for (i=0; i<11; i++){
			        a[i] = cpf.charAt(i);
			        if (i < 9) b += (a[i] * --c);
			    }
			    if ((x = b % 11) < 2) { a[9] = 0 } else { a[9] = 11-x }
			    b = 0;
			    c = 11;
			    for (y=0; y<10; y++) b += (a[y] * c--);
			    if ((x = b % 11) < 2) { a[10] = 0; } else { a[10] = 11-x; }

			    var retorno = true;
			    if ((cpf.charAt(9) != a[9]) || (cpf.charAt(10) != a[10]) || cpf.match(expReg)) retorno = false;

			    return this.optional(element) || retorno;

			}, "Informe um CPF válido");

		
		//Adiciona / Remove novos campos no form
		//Nome
		$("#addNome").on("click", function() {
			$("#divNome").removeClass("col-md-4").addClass("col-md-2");
			$("#divNome2").css("display", "block");
			$("#addNome").prop("disabled", true);
		});
		
		$("#removeNome").on("click", function() {
			$("#divNome").removeClass("col-md-2").addClass("col-md-4");
			$("#divNome2").css("display", "none");
			$("#addNome").prop("disabled", false);
			$("#nome2").val("");
		});
		
		
		//Email
		$("#addEmail").on("click", function() {
			$("#divEmail").removeClass("col-md-4").addClass("col-md-2");
			$("#divEmail2").css("display", "block");
			$("#addEmail").prop("disabled", true);
		});
		
		$("#removeEmail").on("click", function() {
			$("#divEmail").removeClass("col-md-2").addClass("col-md-4");
			$("#divEmail2").css("display", "none");
			$("#addEmail").prop("disabled", false);
			$("#email2").val("");
		});
		
		//Telefone
		$("#addTel").on("click", function() {
			$("#divTel").removeClass("col-md-4").addClass("col-md-2");
			$("#divTel2").css("display", "block");
			$("#addTel").prop("disabled", true);
		});
		
		$("#removeTel").on("click", function() {
			$("#divTel").removeClass("col-md-2").addClass("col-md-4");
			$("#divTel2").css("display", "none");
			$("#addTel").prop("disabled", false);
			$("#telefone2").val("");
		});
		
		//CPF
		$("#addCpf").on("click", function() {
			$("#divCpf").removeClass("col-md-6").addClass("col-md-3");
			$("#divCpf2").css("display", "block");
			$("#addCpf").prop("disabled", true);
		});
		
		$("#removeCpf").on("click", function() {
			$("#divCpf").removeClass("col-md-3").addClass("col-md-6");
			$("#divCpf2").css("display", "none");
			$("#addCpf").prop("disabled", false);
			$("#cpf2").val("");
		});
		
		//RG
		$("#addRg").on("click", function() {
			$("#divRg").removeClass("col-md-6").addClass("col-md-3");
			$("#divRg2").css("display", "block");
			$("#addRg").prop("disabled", true);
		});
		
		$("#removeRg").on("click", function() {
			$("#divRg").removeClass("col-md-3").addClass("col-md-6");
			$("#divRg2").css("display", "none");
			$("#addRg").prop("disabled", false);
			$("#rg2").val("");
		});
		
		//Validação
		$("#novoCliente").validate({
			rules: {
				nome1: {
					required: true,
					lettersonly: true
				},
				nome2: {
					required: false,
					lettersonly: true
				},
				email1: {
					required: true,
					email: true
				},
				email2: {
					required: false,
					email: true
				},
				telefone1: {
					required: true
				},
				telefone2: {
					required: false
				},
				cep: {
					required: true,
				},
				numero: {
					required: true,
					digits: true
				},
				complemento: {
					required: false
				},
				cpf1: {
					required: false,
					cpf: true,
					notEqualTo: "#cpf2"
				},
				cpf2: {
					required: false,
					cpf: true,
					notEqualTo: "#cpf1"
				}
			},
			messages: {
				nome1: {
					required: "Informe um nome!",
				},
				email1: {
					required: "Informe um email!",
					email: "Informe um email válido!"
				},
				email2: {
					email: "Informe um email válido"
				},
				telefone1: {
					required: "Informe um telefone!"
				},
				cep:{
					required: "Informe um cep",
				},
				numero:{
					required: "Informe o número",
					digits: "Apenas números"
				},
				cpf1: {
					cpf: "CPF inválido!",
					notEqualTo: "CPFs iguais!"
				},
				cpf2: {
					cpf: "CPF inválido!",
					notEqualTo: "CPFs iguais!"
				}
			}
		});
		
		//Validação
		$("#alteraCliente").validate({
			rules: {
				nome1: {
					required: true,
					lettersonly: true
				},
				nome2: {
					required: false,
					lettersonly: true
				},
				email1: {
					required: true,
					email: true
				},
				email2: {
					required: false,
					email: true
				},
				telefone1: {
					required: true
				},
				telefone2: {
					required: false
				},
				cep: {
					required: true
				},
				numero: {
					required: true,
					digits: true
				},
				complemento: {
					required: false
				},
				cpf1: {
					required: false,
					cpf: true,
					notEqualTo: "#cpf2"
				},
				cpf2: {
					required: false,
					cpf: true,
					notEqualTo: "#cpf1"
				}
			},
			messages: {
				nome1: {
					required: "Informe um nome!",
				},
				email1: {
					required: "Informe um email!",
					email: "Informe um email válido!"
				},
				email2: {
					email: "Informe um email válido"
				},
				telefone1: {
					required: "Informe um telefone!"
				},
				cep:{
					required: "Informe um cep"
				},
				numero:{
					required: "Informe o número",
					digits: "Apenas números"
				},
				cpf1: {
					cpf: "CPF inválido!",
					 notEqualTo: "CPFs iguais!"
				},
				cpf2: {
					cpf: "CPF inválido!",
					notEqualTo: "CPFs iguais!"
				}
			}
		});
		
		//Modal de Info.
		$(document).on("click", ".open-Info", function () {
			 var id = $(this).data('id');
			 var nome1 = $(this).data('nome1'); 
			 var nome2 = $(this).data('nome2'); 
			 var email1 = $(this).data('email1');
			 var email2 = $(this).data('email2');
			 var telefone1 = $(this).data('telefone1');
			 var telefone2 = $(this).data('telefone2');
			 var cpf1 = $(this).data('cpf1');
			 var cpf2 = $(this).data('cpf2');
			 var rg1 = $(this).data('rg1');
			 var rg2 = $(this).data('rg2');
			 var cep = $(this).data('cep');
			 var rua = $(this).data('rua');
			 var bairro = $(this).data('bairro');
			 var cidade = $(this).data('cidade');
			 var estado = $(this).data('estado');
			 var numero = $(this).data('numero');
			 var complemento = $(this).data('complemento');
		     $(".modal-body #nome1Info").val( nome1 );
		     $(".modal-body #nome2Info").val( nome2 );
		     $(".modal-body #email1Info").val( email1 );
		     $(".modal-body #email2Info").val( email2 );
		     $(".modal-body #telefone1Info").val( telefone1 );
		     $(".modal-body #telefone2Info").val( telefone2 );
		     $(".modal-body #cpf1Info").val( cpf1 );
		     $(".modal-body #cpf2Info").val( cpf2 );
		     $(".modal-body #rg1Info").val( rg1 );
		     $(".modal-body #rg2Info").val( rg2 );
		     $(".modal-body #cepInfo").val( cep );
		     $(".modal-body #ruaInfo").val( rua );
		     $(".modal-body #bairroInfo").val( bairro );
		     $(".modal-body #cidadeInfo").val( cidade );
		     $(".modal-body #estadoInfo").val( estado );
		     $(".modal-body #numeroInfo").val( numero );
		     $(".modal-body #complementoInfo").val( complemento );
		     $(".modal-title #id").html( id );
		});
		
		//Modal de Alteração
		$(document).on("click", ".open-Alt", function () {
			 var id = $(this).data('id');
			 var nome1 = $(this).data('nome1'); 
			 var nome2 = $(this).data('nome2'); 
			 var email1 = $(this).data('email1');
			 var email2 = $(this).data('email2');
			 var telefone1 = $(this).data('telefone1');
			 var telefone2 = $(this).data('telefone2');
			 var cpf1 = $(this).data('cpf1');
			 var cpf2 = $(this).data('cpf2');
			 var rg1 = $(this).data('rg1');
			 var rg2 = $(this).data('rg2');
			 var cep = $(this).data('cep');
			 var rua = $(this).data('rua');
			 var bairro = $(this).data('bairro');
			 var cidade = $(this).data('cidade');
			 var estado = $(this).data('estado');
			 var numero = $(this).data('numero');
			 var complemento = $(this).data('complemento');
		     $(".modal-body #nome1").val( nome1 );
		     $(".modal-body #nome2").val( nome2 );
		     $(".modal-body #email1").val( email1 );
		     $(".modal-body #email2").val( email2 );
		     $(".modal-body #telefone1").val( telefone1 );
		     $(".modal-body #telefone2").val( telefone2 );
		     $(".modal-body #cpf1").val( cpf1 );
		     $(".modal-body #cpf2").val( cpf2 );
		     $(".modal-body #rg1").val( rg1 );
		     $(".modal-body #rg2").val( rg2 );
		     $(".modal-body #cep").val( cep );
		     $(".modal-body #rua").val( rua );
		     $(".modal-body #bairro").val( bairro );
		     $(".modal-body #cidade").val( cidade );
		     $(".modal-body #estado").val( estado );
		     $(".modal-body #numero").val( numero );
		     $(".modal-body #complemento").val( complemento );
		     $(".modal-body #idCliente").val( id );
		     $(".modal-title #id").html( id );
		});
		
		//Mascaras - Form
		$('#telefone1').inputmask({
				"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
	    $('#telefone2').inputmask({
				"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
	    $('#cep').inputmask('99999-999', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#cpf1').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#cpf2').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#rg1').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#rg2').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#numero').inputmask('[99999]', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    
	    //Mascaras - Modal de alteração
	    $('.modal2 #telefone1').inputmask({
			"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
	    $('.modal2 #telefone2').inputmask({
				"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
	    $('.modal2 #cep').inputmask('99999-999', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #cpf1').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #cpf2').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #rg1').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #rg2').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #numero').inputmask('[99999]', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    
	  
});
