package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

@Entity
public class Fase {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idFase;
	
	private String descricao;
	private String prazo;
	private String dataAlteracao;
	private StatusFaseProjeto status;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idAnteProjeto")
	private AnteProjeto anteProjeto;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idPreProjeto")
	private PreProjeto preProjeto;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idProjetoFinal")
	private ProjetoFinal projetoFinal;
	
	@JoinColumn(name="idUsuario")
	@OneToOne
	private Usuario ultimoResponsavel;
	
	public Fase() {}
	
	public Fase(String pDescricao) {
		this.descricao = pDescricao;
		this.status = StatusFaseProjeto.Andamento;
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
	public String getDataAlteracao() {
		return dataAlteracao;
	}
	public Usuario getUltimoResponsavel() {
		return ultimoResponsavel;
	}
	public void setUltimoResponsavel(Usuario ultimoResponsavel) {
		this.ultimoResponsavel = ultimoResponsavel;
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
	public PreProjeto getPreProjeto() {
		return preProjeto;
	}
	public void setPreProjeto(PreProjeto preProjeto) {
		this.preProjeto = preProjeto;
	}
	public ProjetoFinal getProjetoFinal() {
		return projetoFinal;
	}
	public void setProjetoFinal(ProjetoFinal projetoFinal) {
		this.projetoFinal = projetoFinal;
	}
	
	
}
