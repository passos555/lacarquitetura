<div class="modal fade modalFase" id="modal-InfoFase">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h4 class="modal-title">Informações Log - Alteração de Fase</h4>
			</div>
			<div class="modal-body">

				<div class="box-body">
					<div class="form-group">
						<h4 class="box-title" id="descricao"></h4>
						<table class="table table-striped" style="border: 2px solid;">
							<tbody>
								<tr>
									<th width="12%" style="border-right: 2px solid;">Info.</th>
									<th width="44%">Antes</th>
									<th width="44%">Depois</th>
								</tr>
								<tr>
									<td style="border-right: 2px solid;">Prazo</td>
									<td><input type="text" id="prazoAntes" readOnly>
									</td>
									<td><input type="text" id="prazoDepois"
										readOnly></td>
								</tr>
								<tr>
									<td style="border-right: 2px solid;">Status</td>
									<td><input type="text" id="statusAntes" readOnly
										style="background-color: #f9f9f9;"></td>
									<td><input type="text" id="statusDepois"
										readOnly style="background-color: #f9f9f9;"></td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<div align="center" class="box-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
				</div>

			</div>
		</div>
	</div>
</div>