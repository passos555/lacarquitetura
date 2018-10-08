<div class="modal fade modal1" id="modal-info">
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
					<div class="nav-tabs-custom">
						<ul class="nav nav-tabs">
							<li class="active"><a href="#tabCliente" data-toggle="tab"
								aria-expanded="true">Cliente(s)</a></li>
							<li class=""><a href="#tabEndereco" data-toggle="tab"
								aria-expanded="false">Endereço(s)</a></li>
						</ul>
						<div class="tab-content">
							<div class="tab-pane active" id="tabCliente">
								<input type="hidden" value="" name="idCliente" id="idCliente">
								<input type="hidden" value="" name="idClienteSec"
									id="idClienteSec" />

								<div class="row">

									<div class="col-md-4">
										<label>Tipo Cliente</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="tipo"
												id="tipoInfo" readOnly>
										</div>
									</div>

									<div class="col-md-4">
										<label>Nome</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="nome"
												id="nomeInfo" readOnly>
										</div>
									</div>

									<div class="col-md-4">
										<label>Email</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="email" class="form-control" name="email"
												id="emailInfo" readOnly>
										</div>
									</div>

								</div>

								<div class="row" style="border-bottom: 1px solid #e5e5e5;">

									<div class="col-md-4">
										<label>Telefone</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="telefone"
												id="telefoneInfo" readOnly>
										</div>
									</div>

									<div id="divPf">
										<div class="col-md-4">
											<label>CPF</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="cpf"
													id="cpfInfo" readOnly>
											</div>
										</div>

										<div class="col-md-4">
											<label>RG</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="rg"
													id="rgInfo" readOnly>
											</div>
										</div>
									</div>

									<div id="divPj">
										<div class="col-md-4">
											<label>CNPJ</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="cnpj"
													id="cnpjInfo" readOnly>
											</div>
										</div>
									</div>

								</div>
								<div id="clienteSecInfo" style="padding-top: 15px;">
									<div class="row">

										<div class="col-md-4">
											<label>Tipo Cliente</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="tipo"
													id="tipoInfoSec" readOnly>
											</div>
										</div>

										<div class="col-md-4">
											<label>Nome</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="nome"
													id="nomeInfoSec" readOnly>
											</div>
										</div>

										<div class="col-md-4">
											<label>Email</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="email" class="form-control" name="email"
													id="emailInfoSec" readOnly>
											</div>
										</div>

									</div>

									<div class="row" style="border-bottom: 1px solid #e5e5e5;">

										<div class="col-md-4">
											<label>Telefone</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="telefone"
													id="telefoneInfoSec" readOnly>
											</div>
										</div>

										<div id="divPf">
											<div class="col-md-4">
												<label>CPF</label>
												<div style="width: 100%" class="input-group form-group">
													<input type="text" class="form-control" name="cpf"
														id="cpfInfoSec" readOnly>
												</div>
											</div>

											<div class="col-md-4">
												<label>RG</label>
												<div style="width: 100%" class="input-group form-group">
													<input type="text" class="form-control" name="rg"
														id="rgInfoSec" readOnly>
												</div>
											</div>
										</div>

									</div>
								</div>
							</div>
							<div class="tab-pane" id="tabEndereco">
								<div class="row">
									<div class="col-md-3">
										<label>CEP</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="cep"
												id="cepInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Rua</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="rua"
												id="ruaInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Bairro</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="bairro"
												id="bairroInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Cidade</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="cidade"
												id="cidadeInfo" readOnly>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3">
										<label>Complemento</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="complemento"
												id="complementoInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Condomínio</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="condominio"
												id="condominioInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Quadra</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="quadra"
												id="quadraInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Lote</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="lote"
												id="loteInfo" readOnly>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-md-3">
										<label>Estado</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="uf" id="ufInfo"
												readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Número</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control" name="numero"
												id="numeroInfo" readOnly>
										</div>
									</div>
									<div class="col-md-3">
										<label>Cadastro Prefeitura</label>
										<div style="width: 100%" class="input-group form-group">
											<input type="text" class="form-control"
												name="cadastroPrefeitura" id="cadastroPrefeituraInfo"
												readOnly>
										</div>
									</div>
								</div>

								<div id="enderecoSecInfo" style="padding-top: 15px;">
									<div class="row">
										<div class="col-md-3">
											<label>CEP</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="cep"
													id="cepInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Rua</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="rua"
													id="ruaInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Bairro</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="bairro"
													id="bairroInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Cidade</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="cidade"
													id="cidadeInfoSec" readOnly>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3">
											<label>Complemento</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="complemento"
													id="complementoInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Condomínio</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="condominio"
													id="condominioInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Quadra</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="quadra"
													id="quadraInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Lote</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="lote"
													id="loteInfoSec" readOnly>
											</div>
										</div>
									</div>

									<div class="row">
										<div class="col-md-3">
											<label>Estado</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="uf"
													id="ufInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Número</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control" name="numero"
													id="numeroInfoSec" readOnly>
											</div>
										</div>
										<div class="col-md-3">
											<label>Cadastro Prefeitura</label>
											<div style="width: 100%" class="input-group form-group">
												<input type="text" class="form-control"
													name="cadastroPrefeitura" id="cadastroPrefeituraInfoSec"
													readOnly>
											</div>
										</div>
									</div>
								</div>

							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>