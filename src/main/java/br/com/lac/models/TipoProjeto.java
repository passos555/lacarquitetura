package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class TipoProjeto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idTipoProjeto;
	private String descricao;
	private String observacao;
	
	public Long getIdTipoProjeto() {
		return idTipoProjeto;
	}
	public void setIdTipoProjeto(Long idTipoProjeto) {
		this.idTipoProjeto = idTipoProjeto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	
	
}
