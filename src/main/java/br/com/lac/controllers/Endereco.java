package br.com.lac.controllers;

import javax.persistence.Entity;

@Entity
public class Endereco {
	
	private long idEndereco;
	private String cep;
	private String rua;
	private String bairro;
	private String cidade;
	//private String estado;
	private String complemento;
	private String condominio;
	private String quadra;
	private String lote;
	private long cadastroPrefeitura;
	private long numero;
	
	public long getIdEndereco() {
		return idEndereco;
	}
	public void setIdEndereco(long idEndereco) {
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
	public long getCadastroPrefeitura() {
		return cadastroPrefeitura;
	}
	public void setCadastroPrefeitura(long cadastroPrefeitura) {
		this.cadastroPrefeitura = cadastroPrefeitura;
	}
	public long getNumero() {
		return numero;
	}
	public void setNumero(long numero) {
		this.numero = numero;
	}
	
	
	
}
