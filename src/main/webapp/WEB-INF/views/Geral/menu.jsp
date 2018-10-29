<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="security"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@tag pageEncoding="UTF-8"%>

<jsp:useBean id="now" class="java.util.Date" />
<c:url value="/" var="contextPath" />


<aside class="main-sidebar">

	<section class="sidebar">
		<div class="user-panel" style="margin-bottom: 15px;">
			<div class="pull-left image">
				<img src="${contextPath}resources/dist/img/usuario.png"
					class="img-circle" alt="User Image">
			</div>
			<div class="pull-left info">
				<p>
					<security:authentication property="principal.username" />
				</p>
				<p>
					<fmt:formatDate value="${now}" type="both" pattern="dd/MM/yyyy" />
				</p>
				<p>
					<i class="fa fa-circle text-success"></i>Online - <a
						href="${contextPath}logout">Logout</a>
				</p>
			</div>
		</div>

		<ul class="sidebar-menu tree" data-widget="tree">
			<li class="treeview"><a href="#"><i class="fa fa-group"></i>
					<span>Cliente</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}clientes/consulta"><i
							class="fa fa-search"></i> Consultar</a></li>
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}clientes/novo"><i
							class="fa fa-plus-circle"></i> Novo</a></li>
				</ul></li>
			<li class="treeview"><a href="#"><i
					class="fa fa-folder-open"></i> <span>Projeto</span> 
					<span class="pull-right-container"> 
					<i class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}projetos/consulta"><i class="fa fa-search"></i> Consultar</a></li>
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}projetos/novo"><i class="fa fa-plus-circle"></i> Novo</a></li>
					<li class="treeview"><a href="#"><i class="fa fa-tags"></i> Categoria<span class="pull-right-container">
	                  		<i class="fa fa-angle-left pull-right"></i>
	                	</span></a>
						<ul class="treeview-menu">
							<li><a onclick="run_waitMe(null, 1);" href="${contextPath}categorias/consulta"><i class="fa fa-search"></i> Consultar</a></li>
							<li><a onclick="run_waitMe(null, 1);" href="${contextPath}categorias/novo"><i class="fa fa-plus-circle"></i> Novo</a></li>
						</ul>
					</li>
					<li class="treeview"><a href="#"><i class="fa fa-tags"></i> Tipo Projeto<span class="pull-right-container">
	                  		<i class="fa fa-angle-left pull-right"></i>
	                	</span></a>
						<ul class="treeview-menu">
							<li><a onclick="run_waitMe(null, 1);" href="${contextPath}tipos/consulta"><i class="fa fa-search"></i> Consultar</a></li>
							<li><a onclick="run_waitMe(null, 1);" href="${contextPath}tipos/novo"><i class="fa fa-plus-circle"></i> Novo</a></li>
						</ul>
					</li>
				</ul></li>
			<li class="treeview"><a href="#"><i class="fa fa-users"></i>
					<span>Usuário</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}usuarios/consulta"><i
							class="fa fa-search"></i> Consultar</a></li>
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}usuarios/novo"><i
							class="fa fa-plus-circle"></i> Novo</a></li>
				</ul>
			</li>
			<li class="treeview"><a href="#"><i class="fa fa-database"></i>
					<span>Logs</span> <span class="pull-right-container"> <i
						class="fa fa-angle-left pull-right"></i>
				</span> </a>
				<ul class="treeview-menu">
					<li><a onclick="run_waitMe(null, 1);" href="${contextPath}logs/projetos"><i
							class="fa fa-folder-open"></i> Projetos</a></li>
				</ul>
			</li>
		</ul>
	</section>
</aside>