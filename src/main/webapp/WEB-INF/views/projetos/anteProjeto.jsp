<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

		<div class="row">
			<div class="col-xs-12">
				<div class="box box-primary">

					<div class="box-header">
						<h3 class="box-title">Anteprojeto</h3>
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool"
								data-widget="collapse">
								<i class="fa fa-minus"></i>
							</button>
						</div>
					</div>


					<div class="box-body form-horizontal table-responsive">
						<form:form>
							<table class="table table-bordered table-hover">
									<thead>
										<tr>
											<th style="width:20px;"></th>
											<c:forEach items="${fases }" var="fase">
												<th>${fase.descricao }</th>
											</c:forEach>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td style="font-weight: 600;">Prazo</td>
											<c:forEach items="${fases }" var="fase">
												<td><input type="text" class="form-control" value="${fase.prazo }" /></td>
											</c:forEach>
										</tr>
										<tr>
											<td style="font-weight: 600;">Status</td>
											<c:forEach items="${fases }" var="fase">
												<td>
													<select name="permissao" id="permissao" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
									                  <c:forEach items="${statusFase }" var="status">
									                  	<c:choose>
									                  	<c:when test="${status == fase.status }">
									                  		<option value="${status}" selected>${status.name}</option>
									                  	</c:when>
									                  	<c:otherwise>
									                  		<option value="${status}">${status.name}</option>
									                  	</c:otherwise>
									                  </c:choose>
									                  </c:forEach>
									                </select>
												</td>
											</c:forEach>
										</tr>
										<tr>
											<td style="font-weight: 600;">Último responsável</td>
											
											<c:forEach items="${fases }" var="fase">
												<td><input type="text" class="form-control" readonly value="${fase.ultimoResponsavel }" /></td>
											</c:forEach>
										</tr>
										<tr>
											<td style="font-weight: 600;">Data</td>
											<c:forEach items="${fases }" var="fase">
												<td><input type="text" class="form-control" readonly value="${fase.dataAlteracao }" /></td>
											</c:forEach>
										</tr>
									</tbody>
								</table>
						</div>
						
						<div align="center" class="box-footer">
			            	<button onclick="run_waitMe(this.form, 2);" type="submit" class="btn btn-primary btn-md">Alterar</button>
			            </div>  
		            </form:form>
				</div>
			</div>
		</div>

