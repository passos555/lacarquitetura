<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Detalhes do Projeto">
	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Detalhes <small> do Projeto</small> - Código ${projeto.idProjeto}
			</h1>

			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Projeto</li>
				<li class="active">Detalhes do Projeto</li>
			</ol>
		</section>

		<section class="content container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary collapsed-box">
						<input type="hidden" id="usuarioLogado" value="${usuarioLogado.nome }" />
						<div class="box-header">
							<h3 class="box-title">Informações básicas</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>


						<div class="box-body">
							<input type="hidden" id="idProjeto" value="${projeto.idProjeto }"/>
							<div class="row">
								<div class="col-md-3">
									<label>Cliente</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text"
										value="${projeto.cliente.idCliente } - ${projeto.cliente.nome }"
										class="form-control" name="cliente" id="cliente" readonly>
									</div>
								</div>
								
								<div class="col-md-3">
									<label>Tipo</label>
									<div style="width: 100%" class="input-group form-group">
										<c:set var = "tipos" scope = "session" value = "${fn:replace(tiposProjeto, ',', ' /')}"/>
										<c:set var = "tipos" scope = "session" value = "${fn:replace(tipos, '[', '')}"/>
										<c:set var = "tipos" scope = "session" value = "${fn:replace(tipos, ']', '')}"/>
										<input type="text" value="${tipos}"
										class="form-control" readonly>
									</div>
								</div>
								
								<div class="col-md-3">
									<label>Categoria</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" value="${projeto.categoria.descricao }"
										class="form-control" name="categoria" id="categoria" readonly>
									</div>
								</div>
								
								<div class="col-md-3">
									<label>Medida da
									construção</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control" name="medidaConstrucao"
										id="medidaConstrucao" value="${projeto.medidaConstrucao }m²"
										readonly>
									</div>
								</div>
								
							</div>
							
							<div class="row">
								<div class="col-md-3">
									<label>Medidas do terreno</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
										value="${projeto.medidaTerreno1 }m x ${projeto.medidaTerreno2}m" readonly>
									</div>
								</div>
								
								<div class="col-md-3">
									<label>Endereço</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text"
										value="${projeto.endereco.idEndereco } - ${projeto.endereco.rua }"
										class="form-control" name="endereco" id="endereco" readonly>
									</div>
								</div>
								
								<div class="col-md-3">
									<label>Data de cadastro</label>
									<div style="width: 100%" class="input-group form-group">
										<input value="${projeto.dataCadastro }" class="form-control"
										name="dataCadastro" id="dataCadastro" readonly />
									</div>
								</div>
								
								<div class="col-md-3">
									<label>Status</label>
									<div style="width: 100%" class="input-group form-group">
										<input value="${projeto.status.name }" class="form-control"
										name="status" id="status" readonly />
									</div>
								</div>
							
							</div>
							
							<div class="row">
								<div class="col-md-6	">
									<label>Observações</label>
									<div style="width: 100%" class="input-group form-group">
										<textarea style="resize: none;"
										class="form-control" name="observacao" id="observacao"
										readonly>${projeto.observacao }</textarea>
									</div>
								</div>
							</div>
							
							


						</div>

					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/projetos/preProjeto.jsp"%>
			<%@ include file="/WEB-INF/views/projetos/anteProjeto.jsp"%>
			<%@ include file="/WEB-INF/views/projetos/projetoFinal.jsp"%>
			<%@ include file="/WEB-INF/views/projetos/projetoFinalPt2.jsp"%>
			
		</section>
		
		
		<a href="/lac/projetos/consulta" title="Voltar" class="btnNovo">
			<i class="fa fa-arrow-circle-left my-float"></i>
		</a>

	</div>
</tags:pageTemplate>