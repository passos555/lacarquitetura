package br.com.lac.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class AnteProjeto {
	
	//Map<String, Fase> map = new HashMap<String, Fase>();
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idAnteProjeto;
	
	@OneToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "idProjeto")
	private Projeto projeto;
	
	@OneToMany(cascade = CascadeType.ALL,
	           orphanRemoval = true,
	           mappedBy="anteProjeto")
	private List<Fase> fases = new ArrayList<>();
	
	private String observacao;
	
	public void addFase(Fase pFase) {
		fases.add(pFase);
		pFase.setAnteProjeto(this);
    }
	public List<Fase> getFases() {
		return fases;
	}
	public void setFases(List<Fase> fases) {
		this.fases = fases;
	}
	public String getObservacao() {
		return observacao;
	}
	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
	public Projeto getProjeto() {
		return projeto;
	}
	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}
	public Long getIdAnteProjeto() {
		return idAnteProjeto;
	}
	public void setIdAnteProjeto(Long idAnteProjeto) {
		this.idAnteProjeto = idAnteProjeto;
	}
}
