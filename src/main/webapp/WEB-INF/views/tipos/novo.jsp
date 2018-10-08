<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Nova Categoria de Projeto">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Cadastro <small>Novo Tipo de Projeto</small>
			</h1>
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Tipo de Projeto</li>
				<li class="active">Novo Tipo de Projeto</li>
			</ol>
		</section>

		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Informa��es sobre o tipo de Projeto - Preencha
						todos os campos obrigat�rios!</h3>
				</div>

				<c:if test="${not empty sucesso }">
					<div class="alert alert-success alert-dismissible">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">x</button>
						<h4>
							<i class="icon fa fa-check"></i> Sucesso!
						</h4>
						${sucesso }
					</div>
				</c:if>
				<c:if test="${not empty erro }">
					<div class="alert alert-danger alert-dismissible">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">x</button>
						<h4>
							<i class="icon fa fa-check"></i> Erro!
						</h4>
						${erro }
					</div>
				</c:if>

				<form:form class="form-horizontal" id="novoCliente" action="${s:mvcUrl('TPC#saveProjectType').build() }" method="POST">
					<div class="box-body">

						<div class="form-group">
							<label for="nome" class="col-sm-4 control-label">Descri��o*</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="descricao"
									id="descricao" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Observa��es</label>
							<div class="col-sm-4">
								<textarea style="resize: vertical;" class="form-control"
									name="observacao" id="observacao"></textarea>
							</div>
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

</tags:pageTemplate>