package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

@Entity
public class LogProjeto {
	
	@Id @GeneratedValue(strategy=GenerationType.IDENTITY)
	private Long idLogProjeto;
	private String transacao;
	private String data;
	private String antes;
	private String depois;
	
	@JoinColumn(name="idUsuario", nullable = false)
	@OneToOne
	private Usuario usuario;
	
	@JoinColumn(name="idProjeto", nullable = false)
	@OneToOne
	private Projeto projeto;

	public Long getIdLogProjeto() {
		return idLogProjeto;
	}

	public void setIdLogProjeto(Long idLogProjeto) {
		this.idLogProjeto = idLogProjeto;
	}

	public String getTransacao() {
		return transacao;
	}

	public void setTransacao(String transacao) {
		this.transacao = transacao;
	}

	public String getData() {
		return data;
	}

	public void setData(String data) {
		this.data = data;
	}

	public String getAntes() {
		return antes;
	}

	public void setAntes(String antes) {
		this.antes = antes;
	}

	public String getDepois() {
		return depois;
	}

	public void setDepois(String depois) {
		this.depois = depois;
	}

	public Usuario getUsuario() {
		return usuario;
	}

	public void setUsuario(Usuario usuario) {
		this.usuario = usuario;
	}

	public Projeto getProjeto() {
		return projeto;
	}

	public void setProjeto(Projeto projeto) {
		this.projeto = projeto;
	}
	
	
	
}
