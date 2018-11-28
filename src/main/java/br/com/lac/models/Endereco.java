package br.com.lac.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
public class Endereco {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idEndereco;
	private String cep;
	private String rua;
	private String bairro;
	private String cidade;
	private String complemento;
	private String condominio;
	private String quadra;
	private String lote;
	private Long cadastroPrefeitura;
	private Long numero;
	
	@Enumerated(EnumType.STRING)
	private Estado uf;
	
	@OneToMany(cascade = CascadeType.ALL,
	           orphanRemoval = true,
	           mappedBy="endereco")
	private List<Cliente> clientes = new ArrayList<>();
	
	@OneToMany(cascade = CascadeType.ALL,
	           orphanRemoval = true,
	           mappedBy="endereco")
	private List<Projeto> projetos = new ArrayList<>();
	
	public void addCliente(Cliente pCliente) {
		clientes.add(pCliente);
		pCliente.setEndereco(this);
    }
	
	public void removeCliente(Cliente pCliente) {
		clientes.remove(pCliente);
		pCliente.setEndereco(null);
	}
	
	public void addProjeto(Projeto pProjeto) {
		projetos.add(pProjeto);
		pProjeto.setEndereco(this);
    }
	
	public void removeProjeto(Projeto pProjeto) {
		projetos.remove(pProjeto);
		pProjeto.setEndereco(null);
	}
	
	@JsonIgnore
	public List<Projeto> getProjetos() {
		return projetos;
	}

	public void setProjetos(List<Projeto> projetos) {
		this.projetos = projetos;
	}
	
	@JsonIgnore
	public List<Cliente> getClientes() {
		return clientes;
	}

	public void setClientes(List<Cliente> clientes) {
		this.clientes = clientes;
	}

	public Long getIdEndereco() {
		return idEndereco;
	}
	public void setIdEndereco(Long idEndereco) {
		this.idEndereco = idEndereco;
	}
	public String getCep() {
		return cep;
	}
	public void setCep(String cep) {
		this.cep = cep;
	}
	public String getRua() {
		return rua;
	}
	public void setRua(String rua) {
		this.rua = rua;
	}
	public String getBairro() {
		return bairro;
	}
	public void setBairro(String bairro) {
		this.bairro = bairro;
	}
	public String getCidade() {
		return cidade;
	}
	public void setCidade(String cidade) {
		this.cidade = cidade;
	}
	public String getComplemento() {
		return complemento;
	}
	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}
	public String getCondominio() {
		return condominio;
	}
	public void setCondominio(String condominio) {
		this.condominio = condominio;
	}
	public String getQuadra() {
		return quadra;
	}
	public void setQuadra(String quadra) {
		this.quadra = quadra;
	}
	public String getLote() {
		return lote;
	}
	public void setLote(String lote) {
		this.lote = lote;
	}
	public Long getCadastroPrefeitura() {
		return cadastroPrefeitura;
	}
	public void setCadastroPrefeitura(Long cadastroPrefeitura) {
		this.cadastroPrefeitura = cadastroPrefeitura;
	}
	public Long getNumero() {
		return numero;
	}
	public void setNumero(Long numero) {
		this.numero = numero;
	}
	public Estado getUf() {
		return uf;
	}
	public void setUf(Estado uf) {
		this.uf = uf;
	}
}
