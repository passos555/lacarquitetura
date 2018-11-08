package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToOne;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Projeto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idProjeto;
	
	private Long medidaTerreno1;
	private Long medidaTerreno2;
	private Long medidaConstrucao;
	private String observacao;
	private String dataCadastro;
	private String dataConclusao;
	private StatusProjeto status;
	private String progresso;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idCliente")
    private Cliente cliente;
	
	@OneToOne
	@JoinColumn(name = "idCategoria")
	private Categoria categoria;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idEndereco")
	private Endereco endereco;
	
	
	public String getDataConclusao() {
		return dataConclusao;
	}

	public void setDataConclusao(String dataConclusao) {
		this.dataConclusao = dataConclusao;
	}

	public String getProgresso() {
		return progresso;
	}

	public void setProgresso(String progresso) {
		this.progresso = progresso;
	}

	public StatusProjeto getStatus() {
		return status;
	}

	public void setStatus(StatusProjeto status) {
		this.status = status;
	}

	public String getDataCadastro() {
		return dataCadastro;
	}

	public void setDataCadastro(String dataCadastro) {
		this.dataCadastro = dataCadastro;
	}
	
	@JsonIgnore
	public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}
	
	public Categoria getCategoria() {
		return categoria;
	}

	public void setCategoria(Categoria categoria) {
		this.categoria = categoria;
	}

	public Long getIdProjeto() {
		return idProjeto;
	}

	public void setIdProjeto(Long idProjeto) {
		this.idProjeto = idProjeto;
	}
	
	@JsonIgnore
	public Cliente getCliente() {
		return cliente;
	}

	public void setCliente(Cliente cliente) {
		this.cliente = cliente;
	}

	public Long getMedidaTerreno1() {
		return medidaTerreno1;
	}

	public void setMedidaTerreno1(Long medidaTerreno1) {
		this.medidaTerreno1 = medidaTerreno1;
	}

	public Long getMedidaTerreno2() {
		return medidaTerreno2;
	}

	public void setMedidaTerreno2(Long medidaTerreno2) {
		this.medidaTerreno2 = medidaTerreno2;
	}

	public Long getMedidaConstrucao() {
		return medidaConstrucao;
	}

	public void setMedidaConstrucao(Long medidaConstrucao) {
		this.medidaConstrucao = medidaConstrucao;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}
}
