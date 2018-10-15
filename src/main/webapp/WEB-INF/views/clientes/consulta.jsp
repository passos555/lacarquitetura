<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<c:url value="/" var="contextPath" />


<tags:pageTemplate titulo="Consulta de Clientes">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Consulta <small>Clientes Cadastrados</small>
			</h1>

			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Cliente</li>
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
						<div class="box-body table-responsive">
							<table id="generalTable" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Código</th>
										<th>Nome</th>
										<th>Email</th>
										<th>Tipo</th>
										<th width="8%">Mais Info.</th>
										<th width="5%">Alterar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${clientes }" var="cliente">
										<c:if test="${!cliente.secundario }">
											<tr>
												<td>${cliente.idCliente }</td>
												<td>${cliente.nome }</td>
												<td>${cliente.email }</td>
												<td>${cliente.tipoCliente.toString() }</td>
												<td align="center"><a class="open-Info"
													href="#modal-info" data-toggle="modal"
													data-target=".modal1" data-nome="${cliente.nome }"
													data-email="${cliente.email }"
													data-telefone="${cliente.telefone }"
													data-cpf="${cliente.cpf }" data-rg="${cliente.rg }"
													data-tipo="${cliente.tipoCliente.toString() }"
													data-cnpj="${cliente.cnpj }"
													data-id="${cliente.idCliente }"
													data-idsec="${cliente.clienteSec.idCliente }"
													data-emailsec="${cliente.clienteSec.email }"
													data-nomesec="${cliente.clienteSec.nome }"
													data-telefonesec="${cliente.clienteSec.telefone }"
													data-cpfsec="${cliente.clienteSec.cpf }"
													data-rgsec="${cliente.clienteSec.rg }"
													data-tiposec="${cliente.clienteSec.tipoCliente.toString() }"
													data-cep="${cliente.endereco.cep }"
													data-rua="${cliente.endereco.rua }"
													data-bairro="${cliente.endereco.bairro }"
													data-cidade="${cliente.endereco.cidade }"
													data-complemento="${cliente.endereco.complemento }"
													data-condominio="${cliente.endereco.condominio }"
													data-quadra="${cliente.endereco.quadra }"
													data-lote="${cliente.endereco.lote }"
													data-cadastroprefeitura="${cliente.endereco.cadastroPrefeitura }"
													data-numero="${cliente.endereco.numero }"
													data-uf="${cliente.endereco.uf.toString() }"
													data-cepsec="${cliente.clienteSec.endereco.cep }"
													data-ruasec="${cliente.clienteSec.endereco.rua }"
													data-bairrosec="${cliente.clienteSec.endereco.bairro }"
													data-cidadesec="${cliente.clienteSec.endereco.cidade }"
													data-complementosec="${cliente.clienteSec.endereco.complemento }"
													data-condominiosec="${cliente.clienteSec.endereco.condominio }"
													data-quadrasec="${cliente.clienteSec.endereco.quadra }"
													data-lotesec="${cliente.clienteSec.endereco.lote }"
													data-cadastroprefeiturasec="${cliente.clienteSec.endereco.cadastroPrefeitura }"
													data-numerosec="${cliente.clienteSec.endereco.numero }"
													data-ufsec="${cliente.clienteSec.endereco.uf.toString() }">
														<i class="fa fa-plus-circle"></i>
												</a></td>

												<td align="center"><a class="open-Alt"
													href="#modal-alteracao" data-toggle="modal"
													data-target=".modal2" data-nome="${cliente.nome }"
													data-email="${cliente.email }"
													data-telefone="${cliente.telefone }"
													data-cpf="${cliente.cpf }" data-rg="${cliente.rg }"
													data-tipo="${cliente.tipoCliente.toString() }"
													data-cnpj="${cliente.cnpj }"
													data-id="${cliente.idCliente }"
													data-idsec="${cliente.clienteSec.idCliente }"
													data-emailsec="${cliente.clienteSec.email }"
													data-nomesec="${cliente.clienteSec.nome }"
													data-telefonesec="${cliente.clienteSec.telefone }"
													data-cpfsec="${cliente.clienteSec.cpf }"
													data-rgsec="${cliente.clienteSec.rg }"
													data-tiposec="${cliente.clienteSec.tipoCliente.toString() }"><i
														class="fa fa-wrench"></i></a></td>
											</tr>
										</c:if>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</section>

		<!-- MODAL INFO -->
		<%@ include file="/WEB-INF/views/clientes/modalInfo.jsp" %>
		<!-- FIM MODAL INFO -->

		<!-- MODAL ALTERAÇÃO -->
		<%@ include file="/WEB-INF/views/clientes/modalAlteracao.jsp" %>
		<!-- FIM MODAL ALTERAÇÃO -->


		<a href="/lac/clientes/novo" title="Novo Cliente" class="btnNovo">
			<i class="fa fa-plus my-float"></i>
		</a>

	</div>

</tags:pageTemplate>