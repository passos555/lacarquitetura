<div class="modal fade" id="modal-altProjeto">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
					Informa��es Projeto - C�digo <span id="id"></span>
				</h4>
			</div>

			<div class="modal-body">
				<div class="box-body">
					<form:form id="alteraProjeto" action="#" method="POST">
						<input type="hidden" value="" name="idProjeto" id="idProjeto">
						<div class="row">

							<div class="col-md-6">
								<label>Tipo Projeto</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="text" class="form-control" name="tipo" id="tipo"
										readOnly>
								</div>
							</div>

							<div class="col-md-6">
								<label>Categoria*</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="text" class="form-control" name="categoria" id="categoria"
										required>
								</div>
							</div>

							
						</div>

						<div class="row">
						
							<div class="col-md-6">
								<label>Medidas do terreno*</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="email" class="form-control col-md-2" name="email"
										id="email" required>
								</div>
							</div>
							
							<div class="col-md-6">
								<label>Medida da constru��o*</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="email" class="form-control col-md-2" name="email"
										id="email" required>
								</div>
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
</div>