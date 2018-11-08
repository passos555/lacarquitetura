<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%@ taglib tagdir="/WEB-INF/tags" prefix="tags"%>


<tags:pageTemplate titulo="Home">

	<input type="hidden" id="andamento" value="${projetosAndamento }">
	<input type="hidden" id="aguardando" value="${projetosAguardando }">
	<input type="hidden" id="concluidos" value="${projetosConcluido }">

	<div class="content-wrapper">
		<section class="content-header">
			<h1>
				Dashboard <small>Informações Gerais</small>
			</h1>
			<ol class="breadcrumb">
				<li>Home</li>
				<li class="active">Dashboard</li>
			</ol>
		</section>

		<section class="content" style="min-height: 0px;">

			<div class="row">
				<div class="col-lg-4 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-pink-first">
						<div class="inner">
							<h3>${projetos }</h3>
							<p>Projeto(s) cadastrados(s) no sistema</p>
						</div>
						<div class="icon">
							<i class="ion ion-folder"></i>
						</div>
						<a href="/lac/projetos/consulta" class="small-box-footer">Mais
							informações <i class="fa fa-arrow-circle-right"></i>
						</a>
					</div>
				</div>

				<div class="col-lg-4 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-pink-second">
						<div class="inner">
							<h3>${clientes }</h3>
							<p>Clientes(s) cadastrados(s) no sistema</p>
						</div>
						<div class="icon">
							<i class="ion ion-person"></i>
						</div>
						<a href="/lac/clientes/consulta" class="small-box-footer">Mais
							informações <i class="fa fa-arrow-circle-right"></i>
						</a>
					</div>
				</div>

				<div class="col-lg-4 col-xs-6">
					<!-- small box -->
					<div class="small-box bg-pink-third">
						<div class="inner">
							<h3>${usuarios }</h3>
							<p>Usuários(s) cadastrados(s) no sistema</p>
						</div>
						<div class="icon">
							<i class="ion ion-person"></i>
						</div>
						<a href="/lac/usuarios/consulta" class="small-box-footer">Mais
							informações <i class="fa fa-arrow-circle-right"></i>
						</a>
					</div>
				</div>
			</div>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-bar-chart-o"></i>
							<h3 class="box-title">Status do(s) Projeto(s)</h3>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="projetos-chart"
								style="height: 300px; position: relative;"></div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-bar-chart-o"></i>
							<h3 class="box-title">Projeto Concluídos / Projetos Novos
								(por mes) - PROTÓTIPO</h3>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="bar-chart"
								style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">

							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

		<section class="content">
			<div class="row">
				<div class="col-md-12">
					<div class="box box-primary">
						<div class="box-header with-border">
							<h3 class="box-title">Objetivos Mensais - PROTÓTIPO</h3>
						</div>
						<!-- /.box-header -->
						<div class="box-body">
							<div class="row">
								<!-- /.col -->
								<div class="col-md-12">
									<p class="text-center">
										<strong>Progresso</strong>
									</p>
									<div class="progress-group">
										<span class="progress-text">Novos
											Clientes</span> <span class="progress-number"><b>2</b>/3</span>
										<div class="progress sm">
											<div class="progress-bar progress-bar-blue" style="width:66%"></div>
										</div>
										<span class="progress-text">Novos
											Projetos</span> <span class="progress-number"><b>8</b>/5</span>
										<div class="progress sm">
											<div class="progress-bar progress-bar-green"
												style="width: 100%;"></div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>

	</div>


</tags:pageTemplate>
<script src="${contextPath}resources/myScripts/graficos.js"></script>