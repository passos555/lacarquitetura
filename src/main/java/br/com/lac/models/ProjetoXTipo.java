package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class ProjetoXTipo {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idProjetoXTipo;
	
	@JoinColumn(name="idProjeto", nullable = false)
	@OneToOne
	private Projeto projeto;
	
	@JoinColumn(name="idTipoProjeto", nullable = false)
	@OneToOne
	private TipoProjeto tipo;

	public Long getIdProjetoXTipo() {
		return idProjetoXTipo;
	}

	public void setIdProjetoXTipo(Long idProjetoXTipo) {
		this.idProjetoXTipo = idProjetoXTipo;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}

	public TipoProjeto getTipo() {
		return tipo;
	}

	public void setTipo(TipoProjeto tipo) {
		this.tipo = tipo;
	}
	
}
