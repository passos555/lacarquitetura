<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Consulta de Projetos">
	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Consulta <small>Projetos</small>
			</h1>

			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Projeto</li>
				<li class="active">Consulta Projetos</li>
			</ol>
		</section>

		<section class="content container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Projetos cadastrados no sistema</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive">
							<table id="generalTable" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width:10px;">Código</th>
										<th>Cliente</th>
										<th>Progresso</th>
										<th style="width:25px;">Status</th>
										<th style="width:25px;">Cadastro</th>
										<th style="width:25px;">Data de conclusão</th>
										<th style="width:8%">Informações</th>
										<th style="width:8%">Alterar</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${projetos }" var="projeto">
										<tr>
											<td style="text-align:center;">${projeto.idProjeto }</td>
											<td>${projeto.cliente.nome }</td>
											<td>
						                    	<div class="progress-group">
								                    <span style="float:none;" class="progress-number"><b>
								                    	${projeto.progresso}%
								                    </b></span>
													 
								                    <div class="progress sm">
								                      <div class="progress-bar progress-bar-aqua" style="width: ${fn:replace(projeto.progresso, ',', '.')}%"></div>
								                    </div>
								                </div>
						                    </td>
											<c:choose>
												<c:when test="${projeto.status.name == 'Em andamento'}">
													<td style="text-align:center;"><span class="label label-info">${projeto.status.name }</span></td>
												</c:when>
												<c:when test="${projeto.status.name == 'Concluído'}">
													<td style="text-align:center;"><span class="label label-success">${projeto.status.name }</span></td>
												</c:when>
												<c:otherwise>
													<td style="text-align:center;"><span class="label label-warning">${projeto.status.name }</span></td>
												</c:otherwise>
											</c:choose>
											
											<td style="text-align:center;">${projeto.dataCadastro }</td>
											<td style="text-align:center;">${projeto.dataConclusao }</td>
											<td style="text-align:center">
												<a href="${s:mvcUrl('PC#details').arg(0, projeto.idProjeto).build() }"><i class="fa fa-plus-circle"></i></a>
											</td>
											<td align="center">
							                  	<a href="#" id="altProjeto${projeto.idProjeto }" onclick="altProjeto(${projeto.idProjeto })"
                    				 			title="Alterar endereço"><i class="fa fa-wrench"></i></a>
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

		<%@ include file="/WEB-INF/views/projetos/modalAlteracao.jsp" %>

		<a href="/lac/projetos/novo" title="Novo Projeto"
			class="btnNovo"> <i class="fa fa-plus my-float"></i>
		</a>

	</div>
</tags:pageTemplate>