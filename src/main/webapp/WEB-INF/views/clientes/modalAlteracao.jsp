<!-- Copyright <2018> <AdminLTE.IO>  -->
<div class="modal fade modal2" id="modal-alteracao">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">
							Informações Cliente - Código <span id="id"></span>
						</h4>
					</div>

					<div class="modal-body">
						<div class="box-body">
							<form:form id="alteraCliente"
								action="${s:mvcUrl('CC#alter').build() }" method="POST">
								<input type="hidden" value="" name="idCliente" id="idCliente">
								<div class="row">

									<div class="col-md-4">
										<label>Tipo Cliente</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="tipo" id="tipo"
												readOnly>
										</div>
									</div>

									<div class="col-md-4">
										<label>Nome*</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="nome" id="nome"
												required>
										</div>
									</div>

									<div class="col-md-4">
										<label>Email*</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="email" class="form-control" name="email"
												id="email" required>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-4">
										<label>Telefone*</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="telefone"
												id="telefone" required>
										</div>
									</div>

									<div class="col-md-4">
										<label>CPF</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="cpf" id="cpf">
										</div>
									</div>

									<div class="col-md-4">
										<label>RG</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="rg" id="rg">
										</div>
									</div>

								</div>

								<div id="clienteSec" style="padding-top: 15px;">
									<div class="row">

										<div class="col-md-4">
											<label>Tipo Cliente</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="tipo"
													id="tipoSec">
											</div>
										</div>

										<div class="col-md-4">
											<label>Nome*</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="nome"
													id="nomeSec" required>
											</div>
										</div>

										<div class="col-md-4">
											<label>Email</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="email" class="form-control" name="email"
													id="emailSec">
											</div>
										</div>

									</div>

									<div class="row" style="border-bottom: 1px solid #e5e5e5;">

										<div class="col-md-4">
											<label>Telefone</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="telefone"
													id="telefoneSec">
											</div>
										</div>

										<div id="divPf">
											<div class="col-md-4">
												<label>CPF</label>
												<div style="width: 100%" class="input-group form-group">
													<input type="text" class="form-control" name="cpf"
														id="cpfSec">
												</div>
											</div>

											<div class="col-md-4">
												<label>RG</label>
												<div style="width: 100%" class="input-group form-group">
													<input type="text" class="form-control" name="rg"
														id="rgSec">
												</div>
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