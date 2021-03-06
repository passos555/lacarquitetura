//Validação

$("#novoProjeto").validate({
		rules: {
			medidaTerreno1: {
				required: true,
				digits: true
			},
			medidaTerreno2: {
				required: true,
				digits: true
			},
			medidaConstrucao: {
				required: true,
				digits: true
			}
		},
		messages: {
			medidaTerreno1: {
				digits: "Apenas n&uacute;meros"
			},
			medidaTerreno2: {
				digits: "Apenas n&uacute;meros"
			},
			medidaConstrucao: {
				digits: "Apenas n&uacute;meros"
			}
		}
});


//Abre modal de alteração
function altProjeto(pId) {
		
	var idProjeto = pId;
	
	var projeto = {
		"idProjeto": idProjeto,
	};
	
	$.ajax({ 
	    url:"/lac/projetos/getJson",    
	    type:"POST", 
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(projeto),
	    dataType: 'json',
	    success: function(response){
	    	
	    	$('#modal-altProjeto').modal('toggle');
	    	$(".modal-title #id").html( response.idProjeto );
	    	$(".modal-body #idProjeto").val( response.idProjeto );
	    	$(".modal-body #dataCadastro").val( response.dataCadastro );
	    	$(".modal-body #medidaTerreno1").val( response.medidaTerreno1 );
	    	$(".modal-body #medidaTerreno2").val( response.medidaTerreno2 );
	    	$(".modal-body #medidaConstrucao").val( response.medidaConstrucao );
	    	$(".modal-body #status").val(response.status).trigger('change.select2');
	    	$(".modal-body #categoria").val(response.categoria.idCategoria).trigger('change.select2');
	    },
		error: function(jqXHR, textStatus, ex) {
			console.log(textStatus + "," + ex + "," + jqXHR.responseText);
			//$('#modal-novoEndereco').modal('toggle');
		}
	}).responseJSON;
};


