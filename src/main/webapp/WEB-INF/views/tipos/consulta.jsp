<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Consulta de Tipos de Projeto">
	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Consulta <small>Tipos de Projeto Cadastrados</small>
			</h1>

			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Tipo</li>
				<li class="active">Consulta Tipos de Projeto</li>
			</ol>
		</section>

		<section class="content container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Tipos de projeto cadastrados no sistema</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive">
							<table id="generalTable" class="table responsive table-bordered table-hover">
								<thead>
									<tr>
										<th>Descrição</th>
										<th>Observação</th>
										<th width="5%">Alterar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${tipos }" var="tipo">
										<tr>
											<td>${tipo.descricao }</td>
											<td>${tipo.observacao }</td>
											<td align="center"><a class="open-Alt"
												href="#modal-altera" data-toggle="modal"
												data-target=".modal1"
												data-id="${tipo.idTipoProjeto }"
												data-descricao="${tipo.descricao }"
												data-obsrvacao="${tipo.observacao }">
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

		<!-- MODAL ALTERAÇÃO -->
		<div class="modal fade modal1" id="modal-altera">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Alterar Tipo de Projeto</h4>
					</div>
					<div class="modal-body">
						<form:form class="form-horizontal" id="alter"
							action="${s:mvcUrl('TPC#alterProjectType').build() }" method="POST">
							<div class="box-body">
								<input type="hidden" value=""
									name="idTipoProjeto" id="idTipoProjeto">
								<div class="form-group">
									<label for="nome" class="col-sm-4 control-label">Descrição*</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="descricao"
											id="descricao" required>
									</div>
								</div>

								<div class="form-group">
									<label for="nome" class="col-sm-4 control-label">Observação</label>
									<div class="col-sm-5">
										<input type="text" class="form-control" name="observacao" id="observacao">
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
		<!-- FIM MODAL ALTERAÇÃO -->

		<a href="/lac/tipos/novo" title="Novo Tipo de Projeto"
			class="btnNovo"> <i class="fa fa-plus my-float"></i>
		</a>

	</div>
</tags:pageTemplate>