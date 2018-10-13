$("#addEndereco").on("click", function () {
	var vazio = false;
	var cep = $("#cep").val();
	var rua = $("#rua").val();
	var bairro = $("#bairro").val();
	var cidade = $("#cidade").val();
	var complemento = $("#complemento").val();
	var condominio = $("#condominio").val();
	var quadra = $("#quadra").val();
	var lote = $("#lote").val();
	var cadastroPrefeitura = $("#cadastroPrefeitura").val();
	var numero = $("#numero").val();
	var uf = $("#uf").val();

	var endereco = {
		"cep": cep,
		"rua": rua,
		"bairro": bairro,
		"cidade": cidade,
		"complemento": complemento,
		"condominio": condominio,
		"quadra": quadra,
		"lote": lote,
		"cadastroPrefeitura": cadastroPrefeitura,
		"numero": numero,
		"uf": uf
	};
	
	if(cep == "" && rua == "" && bairro == "" && cidade == ""
	   && complemento == "" && condominio == ""
	   && quadra == "" && lote == "" && cadastroPrefeitura == ""
	   && numero == "" && uf == "")
		var vazio = true;
		
	if(!vazio){
		$.ajax({ 
		    url:"/lac/enderecos/save",    
		    type:"POST", 
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(endereco),
		    dataType: 'json',
		    success: function(response){
		    	 $('#modal-novoEndereco').modal('toggle');
		    	 $("#novoEndereco").trigger( "reset" );
		    	 $("#endereco").append(new Option(response.idEndereco + " - " + response.rua, response.idEndereco));
		    	 $("#endereco").val(response.idEndereco).trigger('change.select2');
		    	 $("#uf").val("").trigger('change.select2');
		    },
			error: function(jqXHR, textStatus, ex) {
				console.log(textStatus + "," + ex + "," + jqXHR.responseText);
			}
		});
	} else {
		 $('#modal-novoEndereco').modal('toggle');
    	 $("#novoEndereco").trigger( "reset" );
    	 $("#uf").val("").trigger('change.select2');
	}
});


$('#modal-novoEndereco').on('hidden.bs.modal', function () {
	$("#novoEndereco").trigger( "reset" );
});


//ALTERAÇÂO DE ENDEREÇO
$("#altEndereco").on("click", function () {
	
	var idEndereco = $("#endereco").val();
	
	var endereco = {
		"idEndereco": idEndereco
	};
	
	if(idEndereco > 0){
		$.ajax({ 
		    url:"/lac/enderecos/getJson",    
		    type:"POST", 
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(endereco),
		    dataType: 'json',
		    success: function(response){
		    	$('#modal-novoEndereco').modal('toggle');
		    	$(".modal-body #idEndereco").val( response.idEndereco );
		    	$(".modal-body #cep").val( response.cep );
		    	$(".modal-body #rua").val( response.rua );
		    	$(".modal-body #bairro").val( response.bairro );
		    	$(".modal-body #cidade").val( response.cidade );
		    	$(".modal-body #complemento").val( response.complemento );
		    },
			error: function(jqXHR, textStatus, ex) {
				console.log(textStatus + "," + ex + "," + jqXHR.responseText);
			}
		});
	}
});


//ENDEREÇO SECUNDARIO

$("#addEnderecoSec").on("click", function () {
	var vazio = false;
	var cep = $("#cepSec").val();
	var rua = $("#ruaSec").val();
	var bairro = $("#bairroSec").val();
	var cidade = $("#cidadeSec").val();
	var complemento = $("#complementoSec").val();
	var condominio = $("#condominioSec").val();
	var quadra = $("#quadraSec").val();
	var lote = $("#loteSec").val();
	var cadastroPrefeitura = $("#cadastroPrefeituraSec").val();
	var numero = $("#numeroSec").val();
	var uf = $("#ufSec").val();

	var endereco = {
		"cep": cep,
		"rua": rua,
		"bairro": bairro,
		"cidade": cidade,
		"complemento": complemento,
		"condominio": condominio,
		"quadra": quadra,
		"lote": lote,
		"cadastroPrefeitura": cadastroPrefeitura,
		"numero": numero,
		"uf": uf
	};
	
	if(cep == "" && rua == "" && bairro == "" && cidade == ""
	   && complemento == "" && condominio == ""
	   && quadra == "" && lote == "" && cadastroPrefeitura == ""
	   && numero == "" && uf == "")
		var vazio = true;
		
	if(!vazio){
		$.ajax({ 
		    url:"/lac/enderecos/save",    
		    type:"POST", 
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(endereco),
		    dataType: 'json',
		    success: function(response){
		    	 $('#modal-novoEnderecoSec').modal('toggle');
		    	 $("#novoEnderecoSec").trigger( "reset" );
		    	 $("#enderecoSec").append(new Option(response.idEndereco + " - " + response.rua, response.idEndereco));
		    	 $("#enderecoSec").val(response.idEndereco).trigger('change.select2');
		    	 $("#uf").val("").trigger('change.select2');
		    },
			error: function(jqXHR, textStatus, ex) {
				console.log(textStatus + "," + ex + "," + jqXHR.responseText);
			}
		});
	} else {
		 $('#modal-novoEnderecoSec').modal('toggle');
    	 $("#novoEnderecoSec").trigger( "reset" );
    	 $("#ufSec").val("").trigger('change.select2');
	}
});


$('#modal-novoEnderecoSec').on('hidden.bs.modal', function () {
	$("#novoEnderecoSec").trigger( "reset" );
});