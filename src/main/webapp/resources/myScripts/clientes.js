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
		
		jQuery.validator.addMethod("cnpj", function (value, element) {

            var numeros, digitos, soma, i, resultado, pos, tamanho, digitos_iguais;
            if (value.length == 0) {
                return true;
            }

            value = value.replace(/\D+/g, '');
            digitos_iguais = 1;

            for (i = 0; i < value.length - 1; i++)
                if (value.charAt(i) != value.charAt(i + 1)) {
                    digitos_iguais = 0;
                    break;
                }
            if (digitos_iguais)
                return false;

            tamanho = value.length - 2;
            numeros = value.substring(0, tamanho);
            digitos = value.substring(tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2)
                    pos = 9;
            }
            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;
            if (resultado != digitos.charAt(0)) {
                return false;
            }
            tamanho = tamanho + 1;
            numeros = value.substring(0, tamanho);
            soma = 0;
            pos = tamanho - 7;
            for (i = tamanho; i >= 1; i--) {
                soma += numeros.charAt(tamanho - i) * pos--;
                if (pos < 2)
                    pos = 9;
            }

            resultado = soma % 11 < 2 ? 0 : 11 - soma % 11;

            return (resultado == digitos.charAt(1));
        })
		
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

		
		$("#tipoCliente").change(function () {
			if($("#tipoCliente").val() == 'Fisica'){
				$("#divCpf").css("display", "block");
				$("#divRg").css("display", "block");
				$("#divCnpj").css("display", "none");
				$("#cnpj").val('');
			} else {
				$("#divCpf").css("display", "none");
				$("#divRg").css("display", "none");
				$("#divCnpj").css("display", "block");
				$("#cpf").val('');
				$("#rg").val('');
			}
		});
		
		$("#addClienteSec").on("click", function() {
			$("#divClienteSec").css("display", "block");
			$("#nomeClienteSec").prop("required", true);
			$("#add").val('1');
		});
		
		$("#removeDiv").on("click", function() {
			$("#divClienteSec").css("display", "none");
			$("#nomeClienteSec").prop("required", false);
			$("#nomeClienteSec").val('');
			$("#emailClienteSec").val('');
			$("#telefoneClienteSec").val('');
			$("#cpfClienteSec").val('');
			$("#rgClienteSec").val('');
		});
		
		/*
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
		});*/
		
		//Validação
		$("#novoCliente").validate({
			rules: {
				nome: {
					required: true,
					lettersonly: true
				},
				email: {
					required: true,
					email: true
				},
				telefone: {
					required: true
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
				cpf: {
					required: false,
					cpf: true
					//notEqualTo: "#cpf2"
				},
				cnpj:{
					required: false,
					cnpj: true
				}
			},
			messages: {
				nome: {
					required: "Informe um nome!",
				},
				email: {
					required: "Informe um email!",
					email: "Informe um email valido!"
				},
				telefone: {
					required: "Informe um telefone!"
				},
				cep:{
					required: "Informe um cep",
				},
				numero:{
					required: "Informe o n&uacute;mero",
					digits: "Apenas números"
				},
				cpf: {
					cpf: "CPF invalido!",
					notEqualTo: "CPFs iguais!"
				},
				cnpj: {
					cnpj: "CNPJ invalido!"
				}
			}
		});
		
		//Validação
		$("#alteraCliente").validate({
			rules: {
				nome: {
					required: true,
					lettersonly: true
				},
				email: {
					required: true,
					email: true
				},
				telefone: {
					required: true
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
				cpf: {
					required: false,
					cpf: true
					//notEqualTo: "#cpf2"
				},
				cnpj:{
					required: false,
					cnpj: true
				}
			},
			messages: {
				nome: {
					required: "Informe um nome!",
				},
				email: {
					required: "Informe um email!",
					email: "Informe um email valido!"
				},
				telefone: {
					required: "Informe um telefone!"
				},
				cep:{
					required: "Informe um cep"
				},
				numero:{
					required: "Informe o n&uacute;mero",
					digits: "Apenas números"
				},
				cpf: {
					cpf: "CPF invalido!",
					 notEqualTo: "CPFs iguais!"
				},
				cnpj: {
					cnpj: "CNPJ invalido!"
				}
			}
		});
		
		//Modal de Info.
		$(document).on("click", ".open-Info", function () {
			 var id = $(this).data('id');
			 var tipo = $(this).data('tipo');
			 var nome = $(this).data('nome'); 
			 var email = $(this).data('email');
			 var telefone = $(this).data('telefone');
			 var cpf = $(this).data('cpf');
			 var rg = $(this).data('rg');
			 var cnpj = $(this).data('cnpj');
			 /*var cep = $(this).data('cep');
			 var rua = $(this).data('rua');
			 var bairro = $(this).data('bairro');
			 var cidade = $(this).data('cidade');
			 var estado = $(this).data('estado');
			 var numero = $(this).data('numero');
			 var complemento = $(this).data('complemento');*/
		     $(".modal-body #nomeInfo").val( nome );
		     $(".modal-body #tipoInfo").val( tipo );
		     $(".modal-body #emailInfo").val( email );
		     $(".modal-body #telefoneInfo").val( telefone );
		     $(".modal-body #cpfInfo").val( cpf );
		     $(".modal-body #rgInfo").val( rg );
		     $(".modal-body #cnpjInfo").val( cnpj );
		     $(".modal-title #id").html( id );
		     /*$(".modal-body #cepInfo").val( cep );
		     $(".modal-body #ruaInfo").val( rua );
		     $(".modal-body #bairroInfo").val( bairro );
		     $(".modal-body #cidadeInfo").val( cidade );
		     $(".modal-body #estadoInfo").val( estado );
		     $(".modal-body #numeroInfo").val( numero );
		     $(".modal-body #complementoInfo").val( complemento );*/
		     if(cnpj != ''){
		    	 $("#divPf").css("display", "none");
		    	 $("#divPj").css("display", "block");
		     } else {
		    	 $("#divPj").css("display", "none");
		    	 $("#divPf").css("display", "block");
		     }
		     
		});
		
		//Modal de Alteração
		$(document).on("click", ".open-Alt", function () {
			 var id = $(this).data('id');
			 var nome = $(this).data('nome'); 
			 var email = $(this).data('email');
			 var telefone = $(this).data('telefone');
			 var cpf = $(this).data('cpf');
			 var rg = $(this).data('rg');
			 var cep = $(this).data('cep');
			 var rua = $(this).data('rua');
			 var bairro = $(this).data('bairro');
			 var cidade = $(this).data('cidade');
			 var estado = $(this).data('estado');
			 var numero = $(this).data('numero');
			 var complemento = $(this).data('complemento');
		     $(".modal-body #nome").val( nome );
		     $(".modal-body #email").val( email );
		     $(".modal-body #telefone").val( telefone );
		     $(".modal-body #cpf").val( cpf );
		     $(".modal-body #rg").val( rg );
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
		$('#telefoneClienteSec').inputmask({
			"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
	    $('#cpfClienteSec').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#rgClienteSec').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    
		$('#telefone').inputmask({
				"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
		$('#cnpj').inputmask({"mask": '99.999.999/9999-99', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#cep').inputmask('99999-999', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#cpf').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#rg').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('#numero').inputmask('[99999]', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    
	    //Mascaras - Modal de alteração
	    $('.modal2 #telefone').inputmask({
			"mask": '(99) 9999-9999[9]', placeholder: "", showMaskOnHover: false, showMaskOnFocus: false
		});
	    $('.modal2 #cep').inputmask('99999-999', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #cpf').inputmask('999.999.999-99', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #rg').inputmask('99.999.999-9', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    $('.modal2 #numero').inputmask('[99999]', {placeholder: "", showMaskOnHover: false, showMaskOnFocus: false});
	    
	  
});
