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
				<li>Cliente</li>
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

				
				<form:form class="form-horizontal" id="novoCliente" action="${s:mvcUrl('CC#save').build() }" method="POST">
					<div class="box-body">

						<div class="form-group">
							<label class="col-sm-4 control-label">Tipo Cliente*</label>
							<div class="col-sm-4">
								<select name="tipoCliente" id="tipoCliente"
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true" required>
									<c:forEach items="${tiposCliente }" var="tipoCliente">
										<option value="${tipoCliente}">${tipoCliente.name}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="form-group">
							<label for="nome" class="col-sm-4 control-label">Nome*</label>
							<div class="col-sm-4">
								<input type="text" class="form-control" name="nome" id="nome"
									required>
							</div>
						</div>
						
						<div class="form-group">
							<label for="nome" class="col-sm-4 control-label">Email*</label>
							<div class="col-sm-4">
								<input type="email" class="form-control"
									name="email" id="email" required>
							</div>
						</div>
						
						<div class="form-group">
							<label for="nome" class="col-sm-4 control-label">Telefone*</label>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="telefone" id="telefone">
							</div>
						</div>
						
						<div id="divCpf" class="form-group">
							<label for="nome" class="col-sm-4 control-label">CPF</label>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="cpf" id="cpf">
							</div>
						</div>
						
						<div id="divRg" class="form-group">
							<label for="nome" class="col-sm-4 control-label">RG</label>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="rg" id="rg">
							</div>
						</div>
						
						<div style="display:none;" id="divCnpj" class="form-group">
							<label for="nome" class="col-sm-4 control-label">CNPJ</label>
							<div class="col-sm-4">
								<input type="text" class="form-control"
									name="cnpj" id="cnpj">
							</div>
						</div>
						
						
						<!-- ENDEREÇO -->
						<div class="form-group">
							<label class="col-sm-4 control-label">Endereço</label>
							<div class="col-sm-4">
								<select name="pEndereco" id="endereco"
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true">
									<option value="0" selected></option>
									<c:forEach items="${enderecos }" var="endereco">
										<option value="${endereco.idEndereco}">${endereco.idEndereco} - ${endereco.rua}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label"></label>
							<div style="text-align:center;" class="col-sm-2">
								<span class="input-group-btn">
                    				<a href="#" style="width:100%"
						             data-toggle="modal" data-target=".modal1"
                    				 title="Adicionar endereço" class="btn btn-primary btn-flat">
                    				<i class="fa fa-plus-circle"></i>
                    				</a>
	                  			</span>
							</div>
							<div style="text-align:center;" class="col-sm-2">
								<span class="input-group-btn">
                    				<a href="#" id="altEndereco" style="width:100%"
                    				 title="Alterar endereço" class="btn btn-primary btn-flat">
                    				<i class="fa fa-edit"></i>
                    				</a>
	                  			</span>
							</div>
							
						</div>
						 
						 <!-- Cliente Secudário -->
						<div id="divClienteSec" style="display:none">
						
							<div align="center" class="box-footer">					
							  <span style="font-size:18px">Cliente secundário</span>
							  <div class="box-tools pull-right">
					            <button type="button" id="removeDiv" class="btn btn-box-tool"><i class="fa fa-remove"></i></button>
					          </div>
								
							</div>
						
						
							<div class="form-group">
								<label class="col-sm-4 control-label">Tipo Cliente</label>
								<div class="col-sm-4">
									<select disabled name="tipoClienteSec"
										class="form-control select2 select2-hidden-accessible"
										style="width: 100%;" tabindex="-1" aria-hidden="true">
											<option value="1">Pessoa Física</option>
									</select>
								</div>
							</div>
	
							<div class="form-group">
								<label for="nome" class="col-sm-4 control-label">Nome*</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" name="nomeClienteSec" id="nomeClienteSec" required>
								</div>
							</div>
							
							<div class="form-group">
								<label for="nome" class="col-sm-4 control-label">Email</label>
								<div class="col-sm-4">
									<input type="email" class="form-control" id="emailClienteSec"
										name="emailClienteSec">
								</div>
							</div>
							
							<div class="form-group">
								<label for="nome" class="col-sm-4 control-label">Telefone</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="telefoneClienteSec"
										name="telefoneClienteSec">
								</div>
							</div>
							
							<div id="divCpf" class="form-group">
								<label for="nome" class="col-sm-4 control-label">CPF</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="cpfClienteSec"
										name="cpfClienteSec">
								</div>
							</div>
							
							<div id="divRg" class="form-group">
								<label for="nome" class="col-sm-4 control-label">RG</label>
								<div class="col-sm-4">
									<input type="text" class="form-control" id="rgClienteSec"
										name="rgClienteSec">
								</div>
							</div>
							
							<div class="form-group">
							<label class="col-sm-4 control-label">Endereço</label>
							<div class="col-sm-4">
								<select name="pEnderecoSec" id="enderecoSec"
									class="form-control select2 select2-hidden-accessible"
									style="width: 100%;" tabindex="-1" aria-hidden="true">
									<option value="0" selected></option>
									<c:forEach items="${enderecos }" var="endereco">
										<option value="${endereco.idEndereco}">${endereco.idEndereco} - ${endereco.rua}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-sm-4 control-label"></label>
							<div style="text-align:center;" class="col-sm-2">
								<span class="input-group-btn">
                    				<a style="width:100%" href="#"
						             data-toggle="modal" data-target=".modal2"
                    				 title="Adicionar endereço" class="btn btn-primary btn-flat">
                    				<i class="fa fa-plus-circle"></i>
                    				</a>
	                  			</span>
							</div>
							<div style="text-align:center;" class="col-sm-2">
								<span class="input-group-btn">
                    				<a href="#"
                    				 style="width:100%"
                    				 title="Alterar endereço" class="btn btn-primary btn-flat">
                    				<i class="fa fa-edit"></i>
                    				</a>
	                  			</span>
							</div>
							
						</div>
							
						</div>
							
					</div>
					
					
					<div align="center" class="box-footer">					
						
							<input onclick="run_waitMe();"  class="btn btn-primary btn-md" type = "submit" value="Cadastrar"/>
							
							<input onclick="run_waitMe();" id="addClienteSec"  class="btn btn-primary btn-md" type="button" value="Cliente secundário"/>
							
					</div>
				</form:form>
			</div>
		</section>
	</div>

<%@ include file="/WEB-INF/views/clientes/modalNovoEndereco.jsp" %>
<%@ include file="/WEB-INF/views/clientes/modalNovoEnderecoSec.jsp" %>

</tags:pageTemplate>
