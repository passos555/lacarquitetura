<!-- Copyright <2018> <AdminLTE.IO>  -->
<div class="modal fade" id="modal-altProjeto">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">
					Alterar Projeto - Código <span id="id"></span>
				</h4>
			</div>

			<div class="modal-body">
				<div class="box-body">
					<form:form id="alteraProjeto"
						action="${s:mvcUrl('PC#alter').build() }" method="POST">
						<input type="hidden" name="idProjeto" id="idProjeto">

						<div class="row">

							<div class="col-md-3">
								<label>Status*</label>
								<div style="width: 100%" class="input-group form-group">
									<select name="status" id="status"
										class="form-control select2 select2-hidden-accessible "
										style="width: 100%;" tabindex="-1" aria-hidden="true" required>
										<c:forEach items="${statusProjeto }" var="status">
											<option value="${status}">${status.name}</option>
										</c:forEach>
									</select>
								</div>
							</div>

							<div class="col-md-3">
								<label>Medida da construção*</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="text" class="form-control col-md-2"
										name="medidaConstrucao" id="medidaConstrucao" required>
								</div>
							</div>

							<div class="col-md-3">
								<label>Medida do terreno*</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="text" class="form-control col-md-2"
										name="medidaTerreno1" id="medidaTerreno1" required>
								</div>

							</div>

							<div class="col-md-3">
								<label>Medida do terreno*</label>
								<div style="width: 100%" class="input-group form-group">
									<input type="text" class="form-control col-md-2"
										name="medidaTerreno2" id="medidaTerreno2" required>
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
