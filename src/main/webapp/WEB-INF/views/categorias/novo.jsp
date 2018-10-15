<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Nova Categoria de Projeto">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Cadastro <small>Nova Categoria de Projeto</small>
			</h1>
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Categoria</li>
				<li class="active">Nova Categoria</li>
			</ol>
		</section>

		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Informações sobre a categoria - Preencha
						todos os campos obrigatórios!</h3>
				</div>

				<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

				<form:form class="form-horizontal" id="novaCategoria" action="${s:mvcUrl('CC#saveCategory').build() }" method="POST">
					<div class="box-body">

						<div class="form-group">
							<label for="nome" class="col-sm-4 control-label">Descrição*</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="descricao"
									id="descricao" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Observações</label>
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