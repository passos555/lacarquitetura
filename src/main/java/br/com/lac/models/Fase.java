package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Fase {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idFase;
	
	private String descricao;
	private String prazo;
	private String ultimoResponsavel;
	private String dataAlteracao;
	private StatusFaseProjeto status;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idAnteProjeto")
	private AnteProjeto anteProjeto;
	
	
	public Fase() {}
	
	public Fase(String pDescricao) {
		this.descricao = pDescricao;
	}
	
	public Long getIdFase() {
		return idFase;
	}
	public void setIdFase(Long idFase) {
		this.idFase = idFase;
	}
	public AnteProjeto getAnteProjeto() {
		return anteProjeto;
	}
	public void setAnteProjeto(AnteProjeto anteProjeto) {
		this.anteProjeto = anteProjeto;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getPrazo() {
		return prazo;
	}
	public void setPrazo(String prazo) {
		this.prazo = prazo;
	}
	public String getUltimoResponsavel() {
		return ultimoResponsavel;
	}
	public void setUltimoResponsavel(String ultimoResponsavel) {
		this.ultimoResponsavel = ultimoResponsavel;
	}
	public String getDataAlteracao() {
		return dataAlteracao;
	}
	public void setDataAlteracao(String dataAlteracao) {
		this.dataAlteracao = dataAlteracao;
	}
	public StatusFaseProjeto getStatus() {
		return status;
	}
	public void setStatus(StatusFaseProjeto status) {
		this.status = status;
	}
	
	
	
}
