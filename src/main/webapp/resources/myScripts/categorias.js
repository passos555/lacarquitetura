$("#addCategoria").on("click", function () {
	var vazio = false;
	var descricao = $("#descricaoCategoria").val();
	var observacao = $("#observacaoCategoria").val();

	var categoria = {
		"descricao": descricao,
		"observacao": observacao
	};
	
	if(descricao == "" && observacao == "")
		var vazio = true;
	
	if(!vazio){
		$.ajax({ 
		    url:"/lac/categorias/novoJson",    
		    type:"POST", 
		    contentType: "application/json; charset=utf-8",
		    data: JSON.stringify(categoria),
		    dataType: 'json',
		    success: function(response){
		    	 $('#modal-novaCategoria').modal('toggle');
		    	 $("#novaCategoria").trigger( "reset" );
		    	 $("#categoria").append(new Option(response.descricao, response.idCategoria));
		    	 $("#categoria").val(response.idCategoria).trigger('change.select2');
		    },
			error: function(jqXHR, textStatus, ex) {
				console.log(textStatus + "," + ex + "," + jqXHR.responseText);
			}
		});
	} else {
		 $('#modal-novaCategoria').modal('toggle');
    	 $("#novaCategoria").trigger( "reset" );
	}
});


$('#modal-novaCategoria').on('hidden.bs.modal', function () {
	$("#novaCategoria").trigger( "reset" );
});

$(document).on("click", ".open-Alt", function () {
    var categoriaId = $(this).data('id');
    var categoriaDescricao = $(this).data('descricao');
    var categoriaObservacao = $(this).data('observacao');
    $(".modal-body #idCategoria").val( categoriaId );
    $(".modal-body #descricao").val( categoriaDescricao );
    $(".modal-body #observacao").val( categoriaObservacao );
});