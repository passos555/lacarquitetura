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

						<div id="divNome" class="col-md-4">
							<label>Nome*</label>
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="nome1" id="nome1" required>
									<span class="input-group-btn">
                      					<button id="addNome" type="button" class="btn btn-primary btn-flat">+</button>
                    				</span>
							</div>	
						</div>
						
						<div id="divNome2" style="display:none;" class="col-md-2">
							<label>Nome 2 - Opcional</label>
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="nome2" id="nome2">
								<span class="input-group-btn">
                     				<button id="removeNome" type="button" class="btn btn-primary btn-flat">-</button>
                   				</span>
							</div>	
						</div>
						
						<div id="divEmail" class="col-md-4">
							<label>Email*</label> 
							<div class="input-group form-group">
								<input type="email" class="form-control"
									name="email1" id="email1" required>
								<span class="input-group-btn">
                     				<button id="addEmail" type="button" class="btn btn-primary btn-flat">+</button>
                   				</span>
							</div>
						</div>
						
						<div id="divEmail2" style="display:none;" class="col-md-2">
							<label>Email 2 - Opcional</label>
							<div class="input-group form-group">
								<input type="email" class="form-control"
									name="email2" id="email2">
								<span class="input-group-btn">
                     				<button id="removeEmail" type="button" class="btn btn-primary btn-flat">-</button>
                   				</span>
							</div>	
						</div>
						
						<div id="divTel" class="col-md-4">
							<label>Telefone*</label> 
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="telefone1" id="telefone1">
								<span class="input-group-btn">
                     				<button id="addTel" type="button" class="btn btn-primary btn-flat">+</button>
                   				</span>
							</div>
						</div>
						
						<div id="divTel2" style="display:none;" class="col-md-2">
							<label>Telefone2 - Opcional</label> 
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="telefone2" id="telefone2">
								<span class="input-group-btn">
                     				<button id="removeTel" type="button" class="btn btn-primary btn-flat">-</button>
                   				</span>
							</div>
						</div>
					</div>
					
					<div class="row">
						<div id="divCpf" class="col-md-6">
							<label>CPF</label>
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="cpf1" id="cpf1">
								<span class="input-group-btn">
                     				<button id="addCpf" type="button" class="btn btn-primary btn-flat">+</button>
                   				</span>
							</div>
						</div>
						
						<div id="divCpf2" style="display:none" class="col-md-3">
							<label>CPF 2 - Opcional</label>
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="cpf2" id="cpf2">
								<span class="input-group-btn">
                     				<button id="removeCpf" type="button" class="btn btn-primary btn-flat">-</button>
                   				</span>
							</div>
						</div>
						
						<div id="divRg" class="col-md-6">
							<label>RG</label>
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="rg1" id="rg1">
								<span class="input-group-btn">
                     				<button id="addRg" type="button" class="btn btn-primary btn-flat">+</button>
                   				</span>
							</div>
						</div>
						
						<div id="divRg2" style="display:none" class="col-md-3">
							<label>RG 2 - Opcional</label>
							<div class="input-group form-group">
								<input type="text" class="form-control"
									name="rg2" id="rg2">
								<span class="input-group-btn">
                     				<button id="removeRg" type="button" class="btn btn-primary btn-flat">-</button>
                   				</span>
							</div>
						</div>
						
					</div>
					
					<div class="row">
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
						
						<div class="col-sm-2">
							<div class="form-group">
								<label>Rua</label><input type="text" class="form-control" name="rua" id="rua" readOnly>
							</div>
						</div>
						
						<div class="col-sm-2">
							<div class="form-group">
								<label>Bairro</label><input type="text" class="form-control" name="bairro" id="bairro" readOnly>
							</div>
						</div>
						
						<div class="col-sm-2">
							<div class="form-group">
								<label>Cidade</label><input type="text" class="form-control" name="cidade" id="cidade" readOnly>
							</div>
						</div>
						
						<div class="col-sm-1">
							<div class="form-group">
								<label>Estado</label><input type="text" class="form-control" name="estado" id="uf" readOnly>
							</div>
						</div>
						
						<div class="col-sm-1">
							<div class="form-group">
								<label>Número*</label><input type="text" class="form-control" name="numero" id="numero" required>
							</div>
						</div>
						
						<div class="col-sm-2">
							<div class="form-group">
								<label>Complemento</label><input type="text" class="form-control" name="complemento" id="complemento">
							</div>
						</div>
					</div>
					
					<div align="center" class="box-footer">
	                	<button onclick="run_waitMe();" type="submit" class="btn btn-primary btn-md">Cadastrar</button>
	              	</div> 
					
					</form:form>
				</div>
			</div>
		</section>
	</div>


</tags:pageTemplate>
