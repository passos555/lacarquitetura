<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
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
					<div class="box box-primary">

						<div class="box-header">
							<h3 class="box-title">Informações básicas</h3>
							<div class="box-tools pull-right">
								<button type="button" class="btn btn-box-tool"
									data-widget="collapse">
									<i class="fa fa-minus"></i>
								</button>
							</div>
						</div>


						<div class="box-body form-horizontal">

							<div class="form-group">
								<label class="col-sm-4 control-label">Cliente</label>
								<div class="col-sm-4">
									<input type="text"
										value="${projeto.cliente.idCliente } - ${projeto.cliente.nome }"
										class="form-control" name="cliente" id="cliente" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Tipo</label>
								<div class="col-sm-4"></div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Categoria</label>
								<div class="col-sm-4">
									<input type="text" value="${projeto.categoria.descricao }"
										class="form-control" name="categoria" id="categoria" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Medidas do terreno
									(metros)*</label>
								<div class="col-sm-2">
									<input type="text" class="form-control"
										value="${projeto.medidaTerreno1 }" name="medidaTerreno1"
										id="medidaTerreno1" readonly>
								</div>
								<div class="col-sm-2">
									<input type="text" class="form-control"
										value="${projeto.medidaTerreno2 }" name="medidaTerreno2"
										id="medidaTerreno2" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Medida da
									construção (metros quadrados)*</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="medidaConstrucao"
										id="medidaConstrucao" value="${projeto.medidaConstrucao }"
										readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Endereço</label>
								<div class="col-sm-4">
									<input type="text"
										value="${projeto.endereco.idEndereco } - ${projeto.endereco.rua }"
										class="form-control" name="endereco" id="endereco" readonly>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Obervações</label>
								<div class="col-sm-4">
									<textarea style="resize: none;" value="${projeto.observacao }"
										class="form-control" name="observacao" id="observacao"
										readonly></textarea>
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Data de cadastro</label>
								<div class="col-sm-4">
									<input value="${projeto.dataCadastro }" class="form-control"
										name="dataCadastro" id="dataCadastro" readonly />
								</div>
							</div>

							<div class="form-group">
								<label class="col-sm-4 control-label">Status</label>
								<div class="col-sm-4">
									<input value="${projeto.status.name }" class="form-control"
										name="status" id="status" readonly />
								</div>
							</div>


						</div>

					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/projetos/preProjeto.jsp"%>
			<%@ include file="/WEB-INF/views/projetos/anteProjeto.jsp"%>
			
		</section>
		
		
		<a href="/lac/projetos/consulta" title="Voltar" class="btnNovo">
			<i class="fa fa-arrow-circle-left my-float"></i>
		</a>

	</div>
</tags:pageTemplate>