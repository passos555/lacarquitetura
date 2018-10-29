function setStatus(pObj, pCampo, pFase){
	
	var lAux = $(pObj).val().split(",");
	var lIdFase = lAux[0];
	var lStatus = lAux[1];
	
	var fase = {
		"idFase": lIdFase,
		"status": lStatus,
	};
	
	$.ajax({ 
	    url:"/lac/projetos/saveStatus",    
	    type:"POST", 
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(fase),
	    dataType: 'json',
	    success: function(response){
	    	 $('#responsavel' + pFase + pCampo).val($('#usuarioLogado').val());
	    	 $('#dataAlteracao' + pFase + pCampo).val(getDate());
	    	 notifySuccess('Status alterado com sucesso!');	 
	    },
		error: function() {
			notifyError('N&atilde;o foi poss&iacute;vel alterar o status!');
		}
	}).responseJSON;

}

function setPrazo(pObj, pCampo, pFase){
	
	var lIdFase = $(pObj).data('id');
	var lPrazo = $(pObj).val();
	
	var fase = {
		"idFase": lIdFase,
		"prazo": lPrazo,
	};
	
	$.ajax({ 
	    url:"/lac/projetos/savePrazo",    
	    type:"POST", 
	    contentType: "application/json; charset=utf-8",
	    data: JSON.stringify(fase),
	    dataType: 'json',
	    success: function(response){
	    	 $('#responsavel' + pFase + pCampo).val($('#usuarioLogado').val());
	    	 $('#dataAlteracao' + pFase + pCampo).val(getDate());
	    	 if(lPrazo != '')
	    		 notifySuccess('Prazo alterado com sucesso!');
	    },
		error: function() {
			notifyError('N&atilde;o foi poss&iacute;vel alterar o prazo!');
		}
	}).responseJSON;
	
}

function getDate(){
	var today = new Date();
	var dd = today.getDate();
	var mm = today.getMonth()+1; //January is 0!
	var yyyy = today.getFullYear();

	if(dd<10) {
	    dd = '0'+dd
	} 

	if(mm<10) {
	    mm = '0'+mm
	} 

	today = dd + '/' + mm + '/' + yyyy;
	return today;
}

$( "input[name='prazo']" ).datepicker({                 
    changeMonth: true,
    changeYear: true,
    format: 'dd/mm/yyyy'                   
});