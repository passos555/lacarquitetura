<div class="modal fade modal4" id="modal-novoTipo">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">

			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Novo Tipo de Projeto</h4>
			</div>

			<div class="modal-body">
				<div class="box-body">
					<form:form id="novoTipo" class="form-horizontal" action="#"
						method="POST">

						<div class="form-group">
							<label class="col-sm-4 control-label">Descrição*</label>
							<div class="col-sm-5">
								<input type="text" class="form-control" name="descricao"
									id="descricao" required>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-4 control-label">Observações</label>
							<div class="col-sm-5">
								<textarea style="resize: vertical;" class="form-control"
									name="observacao" id="observacao"></textarea>
							</div>
						</div>

						<div align="center" class="box-footer">
							<button id="addTipo" type="button"
								class="btn btn-primary btn-md">Salvar</button>
						</div>
					</form:form>
				</div>
			</div>
		</div>
	</div>
</div>