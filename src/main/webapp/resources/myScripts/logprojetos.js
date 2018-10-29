$(document).on("click", ".open-InfoFase", function () {
			
			 var lAntes = $(this).data('antes').split(';');
			 var lDepois = $(this).data('depois').split(';');
			 
			 var lDescricao = lAntes[2];
			 
			 var lPrazoAntes = lAntes[0];
			 var lStatusAntes = lAntes[1];
			 
			 var lPrazoDepois = lDepois[0];
			 var lStatusDepois = lDepois[1];
			 
			 $(".modal-body #descricao").html(lDescricao);
			 $(".modal-body #prazoAntes").val(lPrazoAntes);
			 $(".modal-body #prazoDepois").val(lPrazoDepois);
			 $(".modal-body #statusAntes").val(lStatusAntes);
			 $(".modal-body #statusDepois").val(lStatusDepois);

		     
});