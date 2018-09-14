<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>

<tags:pageTemplate titulo="Novo Projeto">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Cadastro <small>Novo Projeto</small>
			</h1>
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Projetos</li>
				<li class="active">Novo Projeto</li>
			</ol>
		</section>
		
		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Informações sobre o projeto - Preencha
						todos os campos obrigatórios!</h3>
				</div>
		
		
			
				<div class="box-body">
					<form:form id="novoProjeto" action="#" method="POST">
						
						<!-- Linha 1 -->
							<div class="row">
							
								<div class="col-md-6">
				                	<label>Cliente*</label>
				                	<select name="cliente" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
					                  <c:forEach items="${clientes }" var="cliente">
					                  	<option value="${cliente.idCliente}">${cliente.nome1} (${cliente.cpf1 })</option>
					                  </c:forEach>
					                </select>
					             
			                	</div>
								
							</div>
							
							
			                
			                
						
					</form:form>
				</div>
		
			</div>
		</section>
	</div>
</tags:pageTemplate>