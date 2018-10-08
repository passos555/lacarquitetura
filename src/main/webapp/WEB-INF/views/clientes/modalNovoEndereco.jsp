		<div class="modal fade modal1" id="modal-novoEndereco">
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
						 <form:form id="novoEndereco" action="#" method="POST">
							
							<div class="row">
								<div class="col-md-3">
									<label>CEP</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="cep" id="cep">
									</div>
								</div>
								<div class="col-md-3">
									<label>Rua</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="rua" id="rua">
									</div>
								</div>
								<div class="col-md-3">
									<label>Bairro</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="bairro" id="bairro">
									</div>
								</div>
								<div class="col-md-3">
									<label>Cidade</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="cidade" id="cidade">
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-3">
									<label>Complemento</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="complemento" id="complemento">
									</div>
								</div>
								<div class="col-md-3">
									<label>Condomínio</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="condominio" id="condominio">
									</div>
								</div>
								<div class="col-md-3">
									<label>Quadra</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="quadra" id="quadra">
									</div>
								</div>
								<div class="col-md-3">
									<label>Lote</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="lote" id="lote">
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-3">
									<label>Estado</label>
										<select name="uf" id="uf"
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
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="numero" id="numero">
									</div>
								</div>
								<div class="col-md-3">
									<label>Cadastro Prefeitura</label>
									<div style="width: 100%" class="input-group form-group">
										<input type="text" class="form-control"
											name="cadastroPrefeitura" id="cadastroPrefeitura">
									</div>
								</div>
							</div>
							
							<div align="center" class="box-footer">
			                	<button id="addEndereco" type="button" class="btn btn-primary btn-md">Salvar</button>
			                </div>
						 </form:form>
						</div>
					</div>
				</div>
			</div>
		</div>