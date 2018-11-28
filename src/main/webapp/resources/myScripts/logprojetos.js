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




$(document).on("click", ".open-InfoDados", function () {
	
	 var lAntes = $(this).data('antes').split(';');
	 var lDepois = $(this).data('depois').split(';');
	 
	 var lStatusAntes = lAntes[0];
	 var lConstrucaoAntes = lAntes[1];
	 var lTerreno1Antes = lAntes[2];
	 var lTerreno2Antes = lAntes[3];
	 
	 var lStatusDepois = lDepois[0];
	 var lConstrucaoDepois = lDepois[1];
	 var lTerreno1Depois = lDepois[2];
	 var lTerreno2Depois = lDepois[3];
	 
	 $(".modal-body #statusAntes").val(lStatusAntes);
	 $(".modal-body #statusDepois").val(lStatusDepois);
	 $(".modal-body #medidaConstrucaoAntes").val(lConstrucaoAntes);
	 $(".modal-body #medidaConstrucaoDepois").val(lConstrucaoDepois);
	 $(".modal-body #medidaTerreno1Antes").val(lTerreno1Antes);
	 $(".modal-body #medidaTerreno1Depois").val(lTerreno1Depois);
	 $(".modal-body #medidaTerreno2Antes").val(lTerreno2Antes);
	 $(".modal-body #medidaTerreno2Depois").val(lTerreno2Depois);
    
});