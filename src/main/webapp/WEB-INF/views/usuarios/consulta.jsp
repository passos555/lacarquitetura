<!-- Copyright <2018> <AdminLTE.IO>  -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Consulta de Usu&aacute;rios">
	<div id="container" class="content-wrapper">
	    <section class="content-header">
	      <h1>
	        Consulta
	        <small>Usu&aacute;rios Cadastrados</small>
	      </h1>
	      
	      <%@ include file="/WEB-INF/views/Geral/mensagens.jsp"%>
	   
	   <div id="erro" style="display:none;" class="alert alert-danger alert-dismissible">
         <button id="hideDiv" type="button" class="close" aria-hidden="true">x</button>
         <h4><i class="icon fa fa-remove"></i> Erro!</h4>
	  	 Voc&ecirc; n&atilde;o pode se inativar!
      </div> 
	      
	      <ol class="breadcrumb">
	        <li>Home</li>
	        <li>Usu&aacute;rio</li>
	        <li class="active">Consulta Usu&aacute;rio</li>
	      </ol>
	    </section>
	   
	   <section class="content container-fluid">
	   
        <div class="row">
        <div class="col-xs-12">
          <div class="box box-primary">
            <div class="box-header">
              <h3 class="box-title">Usu&aacute;rios cadastrados no sistema</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body table-responsive">
              <table id="generalTable" class="table table-bordered table-hover">
                <thead>
                <tr>
                  <th>Nome</th>
                  <th>Email</th>
                  <th>Permiss&atilde;o</th>
                  <th>Status</th>
                  <th width="8%">Alterar Status</th>
                  <th width="5%">Alterar</th>
                </tr>
                </thead>
                <tbody>
                 <c:forEach items="${usuarios }" var="usuario">
	                <tr>
	                  <td>${usuario.nome }</td>
	                  <td>${usuario.email }</td>
	                  <td>${usuario.permissao }</td>
	                  <c:choose>
	                   <c:when test="${usuario.status == 'Ativo'}">
	                   		<td><span id="status_${usuario.idUsuario }" class="label label-success">${usuario.status }</span></td>
	                   		<td align="center">
		                  	<a href="#" onClick="change(${usuario.idUsuario})"><i id="icon_${usuario.idUsuario }" class="fa fa-remove"></i></a>
	                  		</td>
	                   </c:when>
	                   <c:otherwise>
	                   		<td><span id="status_${usuario.idUsuario }" class="label label-danger">${usuario.status }</span></td>
	                   		<td align="center">
		                  	<a href="#" onClick="change(${usuario.idUsuario})"><i id="icon_${usuario.idUsuario }" class="fa fa-check"></i></a></td>
	                   </c:otherwise>
	                  </c:choose>
	                  <td align="center">
	                  	<a class="open-Alt" href="#modal-altera" data-usuario-id="${usuario.idUsuario }"
	                  	 data-usuario-login="${usuario.email }" data-usuario-permissao="${usuario.permissao }" data-usuario-nome="${usuario.nome }"
	                  	 data-toggle="modal" data-target=".modal1"><i class="fa fa-wrench"></i></a>
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
    
    <!-- MODAL ALTERAÇÃO -->
    <div class="modal fade modal1" id="modal-altera">
     <div class="modal-dialog">
       <div class="modal-content">
         <div class="modal-header">
           <button type="button" class="close" data-dismiss="modal" aria-label="Close">
             <span aria-hidden="true">&times;</span></button>
           <h4 class="modal-title">Alterar Usu&aacute;rio</h4>
         </div>
         <div class="modal-body">
          <form:form class="form-horizontal" id="alter" action="${s:mvcUrl('UC#alter').build() }" method="POST">
              <div class="box-body">
              	<input type="hidden" value="${usuario.idUsuario }" name="idUsuario" id="idUsuario">
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Email</label>
                  <div class="col-sm-5">
                    <input type="email" class="form-control" name="email" id="email">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Nome</label>
                  <div class="col-sm-5">
                    <input type="text" class="form-control" name="nome" id="nome">
                  </div>
                </div>
                
                <div class="form-group">
                  <label for="nome" class="col-sm-4 control-label">Nova Senha</label>
                  <div class="col-sm-5">
                    <input type="password" class="form-control" name="senha" id="senha">
                  </div>
                </div>
                
                <div class="form-group">
                <label class="col-sm-4 control-label">Permiss&atilde;o*</label>
                <div class="col-sm-5">
                <select name="permissao" id="permissao" class="form-control select2 select2-hidden-accessible " style="width: 100%;" tabindex="-1" aria-hidden="true" required>
                  <c:forEach items="${permissoes }" var="permissao">
                  	<c:choose>
                  	<c:when test="${permissao == usuario.permissao }">
                  		<option value="${permissao}" selected>${permissao}</option>
                  	</c:when>
                  	<c:otherwise>
                  		<option value="${permissao}">${permissao}</option>
                  	</c:otherwise>
                  </c:choose>
                  </c:forEach>
                </select>
                </div>
              </div>
              
              </div>
              <div align="center" class="box-footer">
                <button type="submit" class="btn btn-primary btn-md">Alterar</button>
              </div>  
            </form:form>
       </div>
     </div>
   </div>
 </div>
    <!-- FIM MODAL ALTERAÇÃO -->
    
    <a href="/lac/usuarios/novo" title="Novo Usu&aacute;rio" class="btnNovo">
		<i class="fa fa-plus my-float"></i>
	</a>
   
</div>
</tags:pageTemplate>