<!-- Copyright <2018> <AdminLTE.IO>  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Novo Usu�rio">

<div id="container" id="container" class="content-wrapper">
    <section class="content-header">
      <h1>
        Cadastro
        <small>Novo Usu�rio</small>
      </h1>
      <ol class="breadcrumb">
        <li>Home</li>
        <li>Usu�rio</li>
        <li class="active">Novo Usu�rio</li>
      </ol>
    </section>
    
    <section class="content container-fluid">
          <div class="box box-primary">
            <div class="box-header with-border">
              <h3 class="box-title">Informa��eses sobre o usu�rio - Preencha todos os campos!</h3>
            </div>
            
			<%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>
            
            <form:form class="form-horizontal" id="novoUsuario" action="${s:mvcUrl('UC#save').build() }" method="POST">
              <div class="box-body">
              	
              	<div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Nome*</label>
                  <div class="col-sm-4">
                    <input type="text" class="form-control" name="nome" id="nome" required>
                  </div>
                </div>
              	
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Email*</label>
                  <div class="col-sm-4">
                    <input type="email" class="form-control" name="email" id="email" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Senha*</label>
                  <div class="col-sm-4">
                    <input type="password" class="form-control" name="senha" id="senha" required>
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Confirme a senha*</label>
                  <div class="col-sm-4">
                    <input type="password" class="form-control" name="senhaConfirm" id="senhaConfirm" required>
                  </div>
                </div>
              
              <div class="form-group">
                <label class="col-sm-4 control-label">Permiss�o*</label>
                <div class="col-sm-4">
                <select name="permissao" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
                  <c:forEach items="${permissoes }" var="permissao">
                  	<option value="${permissao}">${permissao}</option>
                  </c:forEach>
                </select>
                </div>
              </div>
              
              </div>
              <div align="center" class="box-footer">
                <button onclick="run_waitMe(this.form, 2);" type="submit" class="btn btn-primary btn-md">Cadastrar</button>
              </div>  
            </form:form>
          </div>
    </section>
  </div>
  
</tags:pageTemplate>