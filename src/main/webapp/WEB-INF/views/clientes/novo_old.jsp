<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Novo Cliente">

	<div id="container" class="content-wrapper">
		<section class="content-header">
			<h1>
				Cadastro <small>Novo Cliente</small>
			</h1>
			<ol class="breadcrumb">
				<li>Home</li>
				<li>Clientes</li>
				<li class="active">Novo Cliente</li>
			</ol>
		</section>

		<section class="content container-fluid">
			<div class="box box-primary">
				<div class="box-header with-border">
					<h3 class="box-title">Informações sobre o cliente - Preencha
						todos os campos obrigatórios!</h3>
				</div>

				
			<c:if test="${not empty sucesso }">
            <div class="alert alert-success alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> Sucesso!</h4>
					${sucesso }
              </div>
            </c:if>
            <c:if test="${not empty erro }">
            <div class="alert alert-danger alert-dismissible">
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                <h4><i class="icon fa fa-check"></i> Erro!</h4>
					${erro }
              </div>
            </c:if>

				<div class="box-body">
					<form:form id="novoCliente" action="${s:mvcUrl('CC#save').build() }" method="POST">
					<!-- Linha 1 -->
					<div class="row">
						
						<div class="col-md-2">
			                <label>Tipo Cliente*</label>
			                <select name="tipoCliente" id="tipoCliente" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
			                  <c:forEach items="${tiposCliente }" var="tipoCliente">
			                  	<option value="${tipoCliente}">${tipoCliente.name}</option>
			                  </c:forEach>
			                </select>
			            </div>
						
						<div id="divNome" class="col-md-2">
							<label>Nome*</label>
							<div class="input-group form-group" style="width:100%;">
								<input type="text" class="form-control"
									name="nome" id="nome" required>
							</div>	
						</div>
						
						<div id="divEmail" class="col-md-2">
							<label>Email*</label> 
							<div class="input-group form-group" style="width:100%;">
								<input type="email" class="form-control"
									name="email" id="email" required>
							</div>
						</div>
						
						<div id="divTel" class="col-md-2">
							<label>Telefone*</label> 
							<div class="input-group form-group" style="width:100%;">
								<input type="text" class="form-control"
									name="telefone" id="telefone">
							</div>
						</div>
						
						<div id="divCpf" class="col-md-2">
							<label>CPF</label>
							<div class="input-group form-group" style="width:100%;">
								<input type="text" class="form-control"
									name="cpf" id="cpf">
							</div>
						</div>
						
						<div id="divRg" class="col-md-2">
							<label>RG</label>
							<div class="input-group form-group" style="width:100%;">
								<input type="text" class="form-control"
									name="rg" id="rg">
							</div>
						</div>
						
						<div id="divCnpj" style="display:none;" class="col-md-2">
							<label>CNPJ</label>
							<div class="input-group form-group" style="width:100%;">
								<input type="text" class="form-control"
									name="cnpj" id="cnpj">
							</div>
						</div>
						
					</div>
					<!-- 
						<div class="col-md-2">
							<div class="input-group form-group">
								<label>CEP*</label> <input type="text" class="form-control"
									name="cep" id="cep" maxlength="9" required>
								<span style="top: 25px;" class="input-group-btn">
                     				<a href="http://www.buscacep.correios.com.br/sistemas/buscacep/"
                     				target="_blank" rel="noopener noreferrer" class="btn btn-primary btn-flat">
                     				<i class="fa fa-search"></i>
                     				</a>
                   				</span>
							</div>
						</div>
						 -->
						
					
					<div align="center" class="box-footer">
	                	<button onclick="run_waitMe();" type="submit" class="btn btn-primary btn-md">Cadastrar</button>
	              	</div> 
					
					</form:form>
				</div>
			</div>
		</section>
	</div>


</tags:pageTemplate>
