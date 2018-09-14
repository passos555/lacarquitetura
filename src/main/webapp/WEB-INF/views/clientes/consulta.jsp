<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<c:url value="/" var="contextPath" />


<tags:pageTemplate titulo="Consulta de Clientes">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Consulta <small>Clientes Cadastrados</small>
			</h1>

			<c:if test="${not empty sucesso }">
				<div class="alert alert-success alert-dismissible"
					style="margin-bottom: 0px;">
					<button type="button" data-dismiss="alert" class="close"
						aria-hidden="true">×</button>
					<h4>
						<i class="icon fa fa-check"></i> Sucesso!
					</h4>
					${sucesso }
				</div>
			</c:if>
			<c:if test="${not empty erro }">
				<div class="alert alert-danger alert-dismissible"
					style="margin-bottom: 0px;">
					<button type="button" data-dismiss="alert" class="close"
						aria-hidden="true">×</button>
					<h4>
						<i class="icon fa fa-check"></i> Erro!
					</h4>
					${erro }
				</div>
			</c:if>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Clientes</li>
				<li class="active">Consulta Clientes</li>
			</ol>
		</section>

		<section class="content container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Clientes cadastrados no sistema</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<table id="userTable" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Código</th>
										<th>Nome</th>
										<th>Email</th>
										<th width="8%">Mais Info.</th>
										<th width="5%">Alterar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${clientes }" var="cliente">
										<tr>
											<td>${cliente.idCliente }</td>
											<c:choose>
											 <c:when test="${not empty cliente.nome2}">
											 	<td>${cliente.nome1 } / ${cliente.nome2 }</td>
											 </c:when>
											 <c:otherwise>
											 	<td>${cliente.nome1 }</td>
											 </c:otherwise>
											</c:choose>
											<c:choose>
											 <c:when test="${not empty cliente.email2}">
											 	<td>${cliente.email1 } / ${cliente.email2 }</td>
											 </c:when>
											 <c:otherwise>
											 	<td>${cliente.email1 }</td>
											 </c:otherwise>
											</c:choose>
											
											<td align="center"><a class="open-Info" href="#modal-info"
						                  	 data-toggle="modal" data-target=".modal1" data-nome1="${cliente.nome1 }"
						                  	 data-nome2="${cliente.nome2 }" data-email1="${cliente.email1 }"
						                  	 data-email2="${cliente.email2 }" data-telefone1="${cliente.telefone1 }"
						                  	 data-telefone2="${cliente.telefone2 }" data-cpf1="${cliente.cpf1 }"
						                  	 data-cpf2="${cliente.cpf2 }" data-rg1="${cliente.rg1 }" data-rg2="${cliente.rg2 }"
						                  	 data-cep="${cliente.cep }" data-rua="${cliente.rua }" data-bairro="${cliente.bairro }"
						                  	 data-cidade="${cliente.cidade }" data-estado="${cliente.estado }" data-numero="${cliente.numero }"
						                  	 data-complemento="${cliente.complemento }" data-id="${cliente.idCliente }"><i class="fa fa-plus-circle"></i></a></td>
											
											<td align="center"><a class="open-Alt" href="#modal-alteracao"
						                  	 data-toggle="modal" data-target=".modal2" data-nome1="${cliente.nome1 }"
						                  	 data-nome2="${cliente.nome2 }" data-email1="${cliente.email1 }"
						                  	 data-email2="${cliente.email2 }" data-telefone1="${cliente.telefone1 }"
						                  	 data-telefone2="${cliente.telefone2 }" data-cpf1="${cliente.cpf1 }"
						                  	 data-cpf2="${cliente.cpf2 }" data-rg1="${cliente.rg1 }" data-rg2="${cliente.rg2 }"
						                  	 data-cep="${cliente.cep }" data-rua="${cliente.rua }" data-bairro="${cliente.bairro }"
						                  	 data-cidade="${cliente.cidade }" data-estado="${cliente.estado }" data-numero="${cliente.numero }"
						                  	 data-complemento="${cliente.complemento }" data-id="${cliente.idCliente }"><i class="fa fa-wrench"></i></a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- MODAL INFO -->
		<div class="modal fade modal1" id="modal-info">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Informações Cliente - Código <span id="id"></span></h4>
					</div>

					<div class="modal-body">
						<div class="box-body">
							<input type="hidden" value="" name="idCliente" id="idCliente">
							<div class="row">
								<div class="col-md-3">
									<label>Nome</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="nome1" id="nome1Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Nome 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="nome2" id="nome2Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Email</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="email" class="form-control"
											name="email1" id="email1Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Email 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="email" class="form-control"
											name="email2" id="email2Info" readOnly>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>Telefone</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="telefone1" id="telefone1Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Telefone 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="telefone2" id="telefone2Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>CPF</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cpf1" id="cpf1Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>CPF 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cpf2" id="cpf2Info" readOnly>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>RG</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="rg1" id="rg1Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>RG 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="rg2" id="rg2Info" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>CEP</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cep" id="cepInfo" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Rua</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="rua" id="ruaInfo" readOnly>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>Bairro</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="bairro" id="bairroInfo" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Cidade</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cidade" id="cidadeInfo" readOnly>
									</div>
								</div>
								<div class="col-md-1">
									<label>Estado</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="estado" id="estadoInfo" readOnly>
									</div>
								</div>
								<div class="col-md-1" style="margin-right: 73px;">
									<label>Número</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="numero" id="numeroInfo" readOnly>
									</div>
								</div>
								<div class="col-md-3">
									<label>Complemento</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="complemento" id="complementoInfo" readOnly>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8">
									<label>Projetos</label>
									<div class="input-group form-group">
										
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- FIM MODAL INFO -->
		
		<!-- MODAL ALTERAÇÃO -->
		<div class="modal fade modal2" id="modal-alteracao">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Informações Cliente - Código <span id="id"></span></h4>
					</div>

					<div class="modal-body">
						<div class="box-body">
						 <form:form id="alteraCliente" action="${s:mvcUrl('CC#alter').build() }" method="POST">
							<input type="hidden" value="" name="idCliente" id="idCliente">
							<div class="row">
								<div class="col-md-3">
									<label>Nome</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="nome1" id="nome1">
									</div>
								</div>
								<div class="col-md-3">
									<label>Nome 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="nome2" id="nome2">
									</div>
								</div>
								<div class="col-md-3">
									<label>Email</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="email" class="form-control"
											name="email1" id="email1">
									</div>
								</div>
								<div class="col-md-3">
									<label>Email 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="email" class="form-control"
											name="email2" id="email2">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>Telefone</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="telefone1" id="telefone1">
									</div>
								</div>
								<div class="col-md-3">
									<label>Telefone 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="telefone2" id="telefone2">
									</div>
								</div>
								<div class="col-md-3">
									<label>CPF</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cpf1" id="cpf1">
									</div>
								</div>
								<div class="col-md-3">
									<label>CPF 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cpf2" id="cpf2">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>RG</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="rg1" id="rg1">
									</div>
								</div>
								<div class="col-md-3">
									<label>RG 2 - Opcional</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="rg2" id="rg2">
									</div>
								</div>
								<div class="col-md-3">
									<label>CEP</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cep" id="cep">
									</div>
								</div>
								<div class="col-md-3">
									<label>Rua</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="rua" id="rua">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>Bairro</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="bairro" id="bairro">
									</div>
								</div>
								<div class="col-md-3">
									<label>Cidade</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cidade" id="cidade">
									</div>
								</div>
								<div class="col-md-1">
									<label>Estado</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="estado" id="estado">
									</div>
								</div>
								<div class="col-md-1" style="margin-right: 73px;">
									<label>Número</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="numero" id="numero">
									</div>
								</div>
								<div class="col-md-3">
									<label>Complemento</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="complemento" id="complemento">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-8">
									<label>Projetos</label>
									<div class="input-group form-group">
										
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
		</div>
		<!-- FIM MODAL ALTERAÇÃO -->


		<a href="/lac/clientes/novo" title="Novo Cliente" class="btnNovo">
		<i class="fa fa-plus my-float"></i>
	</a>
		
	</div>

</tags:pageTemplate>