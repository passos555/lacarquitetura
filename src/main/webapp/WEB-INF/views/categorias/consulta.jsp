<!-- Copyright <2018> <AdminLTE.IO>  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Consulta de Categorias de Projeto">
	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Consulta <small>Categorias Cadastradas</small>
			</h1>

			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Categoria</li>
				<li class="active">Consulta Categorias</li>
			</ol>
		</section>

		<section class="content container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Categorias cadastrados no sistema</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive">
							<table id="generalTable" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Descri��o</th>
										<th>Observa��o</th>
										<th width="5%">Alterar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${categorias }" var="categoria">
										<tr>
											<td>${categoria.descricao }</td>
											<td>${categoria.observacao }</td>
											<td align="center"><a class="open-Alt"
												href="#modal-altera" data-toggle="modal"
												data-target=".modal1"
												data-id="${categoria.idCategoria }"
												data-descricao="${categoria.descricao }"
												data-obsrvacao="${categoria.observacao }">
												<i class="fa fa-wrench"></i></a>
											</td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- MODAL ALTERA��O -->
		<div class="modal fade modal1" id="modal-altera">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Alterar Categoria</h4>
					</div>
					<div class="modal-body">
						<form:form class="form-horizontal" id="alter"
							action="${s:mvcUrl('CC#alterCategory').build() }" method="POST">
							<div class="box-body">
								<input type="hidden" value=""
									name="idCategoria" id="idCategoria">
								<div class="form-group">
									<label for="nome" class="col-sm-4 control-label">Descri��o*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="descricao"
											id="descricao" required>
									</div>
								</div>

								<div class="form-group">
									<label for="nome" class="col-sm-4 control-label">Observa��o</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="observacao" id=""observacao"">
									</div>
								</div>

							</div>
							<div align="center" class="box-footer">
								<button type="submit" class="btn btn-primary btn-md">Alterar</button>
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<!-- FIM MODAL ALTERA��O -->

		<a href="/lac/categorias/novo" title="Nova Categoria"
			class="btnNovo"> <i class="fa fa-plus my-float"></i>
		</a>

	</div>
</tags:pageTemplate>