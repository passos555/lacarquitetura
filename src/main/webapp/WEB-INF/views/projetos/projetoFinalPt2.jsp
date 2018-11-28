<!-- Copyright <2018> <AdminLTE.IO>  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary collapsed-box">

					<div class="box-header">
						<h3 class="box-title">Projeto</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-plus"></i>
							</button>
						</div>
					</div>


					<div class="box-body form-horizontal table-responsive">
						<table class="table table-bordered table-hover">
								<thead>
									<tr>
										<th style="width:20px;"></th>
										<c:forEach items="${fasesProjetoFinal2 }" var="fase">
											<th>${fase.descricao }</th>
										</c:forEach>
									</tr>
								</thead>
								
								<tbody>
									<tr>
										<td style="font-weight: 600;">Prazo</td>
										<c:forEach items="${fasesProjetoFinal2 }" var="fase" varStatus="count">
											<td><input type="text" name="prazo" id="prazoFinal2${count.index }" data-id="${fase.idFase }" 
											onchange="setPrazo(this, ${count.index }, 'Final2')" class="form-control" value="${fase.prazo }" /></td>
											
										</c:forEach>
									</tr>
									<tr>
										<td style="font-weight: 600;">Status</td>
										<c:forEach items="${fasesProjetoFinal2 }" var="fase" varStatus="count">
										<input type="hidden" value="${fase.idFase }" id="idFase"/> 
											<td>
												<select class="form-control select2 select2-hidden-accessible " onChange="setStatus(this, ${count.index }, 'Final2');" style="width: 100%;" tabindex="-1" aria-hidden="true">
								                  <c:forEach items="${statusFase }" var="status">
								                  	<c:choose>
									                  	<c:when test="${status == fase.status }">
									                  		<option value="${fase.idFase },${status}" selected>${status.name}</option>
									                  	</c:when>
									                  	<c:otherwise>
									                  		<option value="${fase.idFase },${status}">${status.name}</option>
									                  	</c:otherwise>
								                  	</c:choose>
								                  </c:forEach>
								                </select>
											</td>
										</c:forEach>
									</tr>
									<tr>
										<td style="font-weight: 600;">Último responsável</td>
										
										<c:forEach items="${fasesProjetoFinal2 }" var="fase" varStatus="count">
											<td><input type="text" id="responsavelFinal2${count.index }" name="ultimoResponsavel" class="form-control" readonly value="${fase.ultimoResponsavel.nome }" /></td>
										</c:forEach>
									</tr>
									<tr>
										<td style="font-weight: 600;">Data de alteração</td>
										<c:forEach items="${fasesProjetoFinal2 }" var="fase" varStatus="count">
											<td><input type="text" name="dataAlteracao" id="dataAlteracaoFinal2${count.index }" class="form-control" readonly value="${fase.dataAlteracao }" /></td>
										</c:forEach>
									</tr>
								</tbody>
							</table>
						</div>
				</div>
			</div>
		</div>

