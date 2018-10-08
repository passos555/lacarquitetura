$("#addTipo").on("click", function () {
	var vazio = false;
	var descricao = $("#descricao").val();
	var observacao = $("#observacao").val();

	var tipo = {
		"descricao": descricao,
		"observacao": observacao
	};
	
	if(descricao == "" && observacao == "")
		var vazio = true;
	
	if(!vazio){
		$.ajax({ 
		    url:"/lac/tipos/novoJson",    
		    type:"POST", 
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(tipo),
		    dataType: 'json',
		    success: function(response){
		    	 $('#modal-novoTipo').modal('toggle');
		    	 $("#novoTipo").trigger( "reset" );
		    	 $("#tipoProjeto").append(new Option(response.descricao, response.idTipoProjeto));
		    	 $("#tipoProjeto").val(response.idTipoProjeto).trigger('change.select2');
		    },
			error: function(jqXHR, textStatus, ex) {
				console.log(textStatus + "," + ex + "," + jqXHR.responseText);
			}
		});
	} else {
		 $('#modal-novoTipo').modal('toggle');
    	 $("#novoTipo").trigger( "reset" );
	}
});


$('#modal-novoTipo').on('hidden.bs.modal', function () {
	$("#novoTipo").trigger( "reset" );
	//console.log($('#tipoProjeto').val());
});

$(document).on("click", ".open-Alt", function () {
    var tipoId = $(this).data('id');
    var tipoDescricao = $(this).data('descricao');
    var tipoObservacao = $(this).data('observacao');
    $(".modal-body #idTipoProjeto").val( tipoId );
    $(".modal-body #descricao").val( tipoDescricao );
    $(".modal-body #observacao").val( tipoObservacao );
});