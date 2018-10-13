<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Novo Projeto">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Cadastro <small>Novo Projeto</small>
			</h1>
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Projeto</li>
				<li class="active">Novo Projeto</li>
			</ol>
		</section>

		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Informações sobre o projeto - Preencha
						todos os campos obrigatórios!</h3>
				</div>

				<c:if test="${not empty sucesso }">
					<div class="alert alert-success alert-dismissible">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						<h4>
							<i class="icon fa fa-check"></i> Sucesso!
						</h4>
						${sucesso }
					</div>
				</c:if>
				<c:if test="${not empty erro }">
					<div class="alert alert-danger alert-dismissible">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						<h4>
							<i class="icon fa fa-check"></i> Erro!
						</h4>
						${erro }
					</div>
				</c:if>


				<form:form id="novoProjeto" class="form-horizontal" action="${s:mvcUrl('PC#save').build() }"
					method="POST">
					<div class="box-body">

						<div class="form-group">
							<label class="col-sm-4 control-label">Cliente*</label>
							<div class="col-sm-4">
								<select name="pCliente" id="cliente"
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true" required>
									<c:forEach items="${clientes }" var="cliente">
										<c:if test="${!cliente.secundario }">
											<option value="${cliente.idCliente}">${cliente.idCliente}
												- ${cliente.nome}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Tipo*</label>
							<div class="col-sm-3">
								<select name="pTipoProjeto" id="tipoProjeto" multiple
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true" required>
									<c:forEach items="${tipos }" var="tipo">
										<option value="${tipo.idTipoProjeto}">${tipo.descricao}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-1">
								<span class="input-group-btn"> <a href="#"
									style="width: 100%;" data-toggle="modal" data-target=".modal4"
									title="Adicionar tipo de projeto"
									class="btn btn-primary btn-flat"> <i
										class="fa fa-plus-circle"></i>
								</a>
								</span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Categoria*</label>
							<div class="col-sm-3">
								<select name="pCategoria" id="categoria"
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true" required>
									<c:forEach items="${categorias }" var="categoria">
										<option value="${categoria.idCategoria}">${categoria.descricao}</option>
									</c:forEach>
								</select>
							</div>
							<div class="col-sm-1">
								<span class="input-group-btn"> <a href="#"
									style="width: 100%;" data-toggle="modal" data-target=".modal3"
									title="Adicionar categoria" class="btn btn-primary btn-flat">
										<i class="fa fa-plus-circle"></i>
								</a>
								</span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Medidas do terreno
								(metros)*</label>
							<div class="col-sm-2">
								<input type="text" class="form-control" name="medidaTerreno1"
									id="medidaTerreno1" required>
							</div>
							<div class="col-sm-2">
								<input type="text" class="form-control" name="medidaTerreno2"
									id="medidaTerreno2" required>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Medida da
								construção (metros quadrados)*</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="medidaConstrucao"
									id="medidaConstrucao" required>
							</div>
						</div>

						<!-- ENDEREÇO -->
						<div class="form-group">
							<label class="col-sm-4 control-label">Endereço</label>
							<div class="col-sm-4">
								<select name="pEndereco" id="endereco"
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true">
									<option value="0" selected></option>
									<c:forEach items="${enderecos }" var="endereco">
										<option value="${endereco.idEndereco}">${endereco.idEndereco}
											- ${endereco.rua}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label"></label>
							<div style="text-align: center;" class="col-sm-2">
								<span class="input-group-btn"> <a href="#"
									style="width: 100%" data-toggle="modal" data-target=".modal1"
									title="Adicionar endereço" class="btn btn-primary btn-flat">
										<i class="fa fa-plus-circle"></i>
								</a>
								</span>
							</div>
							<div style="text-align: center;" class="col-sm-2">
								<span class="input-group-btn"> <a href="#"
									id="altEndereco" style="width: 100%" title="Alterar endereço"
									class="btn btn-primary btn-flat"> <i class="fa fa-edit"></i>
								</a>
								</span>
							</div>
						</div>

						<div class="form-group">
							<label class="col-sm-4 control-label">Obervações</label>
							<div class="col-sm-4">
								<textarea style="resize: vertical;" class="form-control"
									name="observacao" id="observacao"></textarea>
							</div>
						</div>



						<div align="center" class="box-footer">
							<button onclick="run_waitMe(this.form, 2);" type="submit"
								class="btn btn-primary btn-md">Cadastrar</button>
						</div>
				</form:form>
			</div>
		</section>
	</div>
	<%@ include file="/WEB-INF/views/clientes/modalNovoEndereco.jsp"%>
	<%@ include file="/WEB-INF/views/projetos/modalNovoTipo.jsp"%>
	<%@ include file="/WEB-INF/views/projetos/modalNovaCategoria.jsp"%>
</tags:pageTemplate>