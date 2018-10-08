		<div class="modal fade modal2" id="modal-novoEnderecoSec">
			<div class="modal-dialog modal-lg">
				<div class="modal-content">

					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title">Novo Endereço</h4>
					</div>

					<div class="modal-body">
						<div class="box-body">
						 <form:form id="novoEnderecoSec" action="#" method="POST">
							
							<div class="row">
								<div class="col-md-3">
									<label>CEP</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cepSec" id="cepSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Rua</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="ruaSec" id="ruaSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Bairro</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="bairroSec" id="bairroSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Cidade</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cidadeSec" id="cidadeSec">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>Complemento</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="complementoSec" id="complementoSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Condomínio</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="condominioSec" id="condominioSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Quadra</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="quadraSec" id="quadraSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Lote</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="loteSec" id="loteSec">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-3">
									<label>Estado</label>
										<select name="ufSec" id="ufSec"
										class="form-control select2 select2-hidden-accessible"
										style="width: 100%;" tabindex="-1" aria-hidden="true">
											<option value=""></option>
											<c:forEach items="${estados }" var="estado">
												<option value="${estado}">${estado} </option>
											</c:forEach>
										</select>
								
								</div>
								<div class="col-md-3">
									<label>Número</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="numeroSec" id="numeroSec">
									</div>
								</div>
								<div class="col-md-3">
									<label>Cadastro Prefeitura</label>
									<div class="input-group form-group">
										<input style="width: 105%" type="text" class="form-control"
											name="cadastroPrefeituraSec" id="cadastroPrefeituraSec">
									</div>
								</div>
							</div>
							
							<div align="center" class="box-footer">
			                	<button id="addEnderecoSec" type="button" class="btn btn-primary btn-md">Salvar</button>
			                </div>
						 </form:form>
						</div>
					</div>
				</div>
			</div>
		</div>