<!-- Copyright <2018> <AdminLTE.IO>  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>
<c:url value="/" var="contextPath" />


<tags:pageTemplate titulo="Log de Projetos">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Log <small>Projetos</small>
			</h1>

			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>

			<ol class="breadcrumb">
				<li>Home</li>
				<li>Logs</li>
				<li class="active">Log Projetos</li>
			</ol>
		</section>
		
		<section class="content container-fluid">

			<div class="row">
				<div class="col-xs-12">
					<div class="box box-primary">
						<div class="box-header">
							<h3 class="box-title">Log dos projetos cadastrados no sistema</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body table-responsive">
							<table id="generalTable" class="table table-bordered table-hover">
								<thead>
									<tr>
										<th>Usuário</th>
										<th  width="10%">Código Projeto</th>
										<th style="width:25px;">Data</th>
										<th style="width:25px;">Transação</th>
										<th width="8%">Mais Info.</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${logProjetos }" var="log">
										<tr>
											<td>${log.usuario.nome } (${log.usuario.email })</td>
											<td align="center">${log.projeto.idProjeto }</td>
											<td align="center">${log.data }</td>
											<c:choose>
							                   <c:when test="${log.transacao == 'Alteração de Fase'}">
							                   		<td align="center"><span class="label label-warning">${log.transacao }</span></td>
							                   		<td align="center"><a href="#modal-InfoFase" class="open-InfoFase" data-toggle="modal"
													data-target=".modalFase" data-antes="${log.antes }" data-depois="${log.depois }">
														<i class="fa fa-plus-circle"></i></a>
													</td>
							                   </c:when>
							                   <c:when test="${log.transacao == 'Cadastro'}">
							                   		<td align="center"><span class="label label-success">${log.transacao }</span></td>
							                   		<td align="center">
							                   </c:when>
							                   <c:otherwise>
							                   		<td align="center"><span class="label label-info">${log.transacao }</span></td>
							                   		<td align="center"><a href="#modal-InfoDados" class="open-InfoDados" data-toggle="modal"
													data-target=".modalDados" data-antes="${log.antes }" data-depois="${log.depois }">
														<i class="fa fa-plus-circle"></i></a>
													</td>
							                   </c:otherwise>
							                 </c:choose>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
			<%@ include file="/WEB-INF/views/logs/modalInfoDados.jsp" %>
			<%@ include file="/WEB-INF/views/logs/modalInfo.jsp" %>
		</section>
	</div>

</tags:pageTemplate>