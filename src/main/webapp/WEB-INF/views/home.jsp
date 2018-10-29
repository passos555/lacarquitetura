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
								style="height: 300px; position: relative;">
							</div>
						</div>
						<!-- /.box-body -->
					</div>
				</div>
				<div class="col-md-6">
					<div class="box box-primary">
						<div class="box-header with-border">
							<i class="fa fa-bar-chart-o"></i>
							<h3 class="box-title">A DEFINIR</h3>
						</div>
						<div class="box-body chart-responsive">
							<div class="chart" id="bar-chart"
								style="height: 300px; -webkit-tap-highlight-color: rgba(0, 0, 0, 0);">
								<svg height="300" version="1.1" width="755.5"
									xmlns="http://www.w3.org/2000/svg"
									xmlns:xlink="http://www.w3.org/1999/xlink"
									style="overflow: hidden; position: relative; left: -0.5px;">
								<desc style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">Created with Raphaël 2.2.0</desc>
								<defs style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></defs>
								<text x="32.84375" y="261" text-anchor="end"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">0</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M45.34375,261H730.5"
										stroke-width="0.5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="32.84375" y="202" text-anchor="end"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">25</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M45.34375,202H730.5"
										stroke-width="0.5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="32.84375" y="143" text-anchor="end"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">50</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M45.34375,143H730.5"
										stroke-width="0.5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="32.84375" y="84" text-anchor="end"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">75</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M45.34375,84H730.5"
										stroke-width="0.5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="32.84375" y="25" text-anchor="end"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: end; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">100</tspan></text>
								<path fill="none" stroke="#aaaaaa" d="M45.34375,25H730.5"
										stroke-width="0.5"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);"></path>
								<text x="681.5602678571429" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2012</tspan></text>
								<text x="583.6808035714286" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2011</tspan></text>
								<text x="485.8013392857143" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2010</tspan></text>
								<text x="387.921875" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2009</tspan></text>
								<text x="290.0424107142857" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2008</tspan></text>
								<text x="192.16294642857142" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2007</tspan></text>
								<text x="94.28348214285714" y="273.5" text-anchor="middle"
										font-family="sans-serif" font-size="12px" stroke="none"
										fill="#888888"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); text-anchor: middle; font-family: sans-serif; font-size: 12px; font-weight: normal;"
										font-weight="normal" transform="matrix(1,0,0,1,0,7)">
								<tspan dy="4"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0);">2006</tspan></text>
								<rect x="57.578683035714285" y="25" width="35.20479910714286"
										height="236" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="95.78348214285714" y="48.60000000000002"
										width="35.20479910714286" height="212.39999999999998" rx="0"
										ry="0" fill="#f56954" stroke="none" fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="155.45814732142856" y="84" width="35.20479910714286"
										height="177" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="193.66294642857142" y="107.6" width="35.20479910714286"
										height="153.4" rx="0" ry="0" fill="#f56954" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="253.33761160714286" y="143" width="35.20479910714286"
										height="118" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="291.5424107142857" y="166.60000000000002"
										width="35.20479910714286" height="94.39999999999998" rx="0"
										ry="0" fill="#f56954" stroke="none" fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="351.21707589285717" y="84" width="35.20479910714286"
										height="177" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="389.421875" y="107.6" width="35.20479910714286"
										height="153.4" rx="0" ry="0" fill="#f56954" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="449.09654017857144" y="143" width="35.20479910714286"
										height="118" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="487.30133928571433" y="166.60000000000002"
										width="35.20479910714286" height="94.39999999999998" rx="0"
										ry="0" fill="#f56954" stroke="none" fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="546.9760044642858" y="84" width="35.20479910714286"
										height="177" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="585.1808035714287" y="107.6" width="35.20479910714286"
										height="153.4" rx="0" ry="0" fill="#f56954" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="644.8554687500001" y="25" width="35.20479910714286"
										height="236" rx="0" ry="0" fill="#00a65a" stroke="none"
										fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect>
								<rect x="683.060267857143" y="48.60000000000002"
										width="35.20479910714286" height="212.39999999999998" rx="0"
										ry="0" fill="#f56954" stroke="none" fill-opacity="1"
										style="-webkit-tap-highlight-color: rgba(0, 0, 0, 0); fill-opacity: 1;"></rect></svg>
								<div class="morris-hover morris-default-style"
									style="left: 60.2757px; top: 112px; display: none;">
									<div class="morris-hover-row-label">2006</div>
									<div class="morris-hover-point" style="color: #00a65a">
										CPU: 100</div>
									<div class="morris-hover-point" style="color: #f56954">
										DISK: 90</div>
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