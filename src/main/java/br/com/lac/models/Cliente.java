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

@Entity
public class Cliente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idCliente;
	private String nome1;
	private String nome2;
	private String email1;
	private String email2;
	private String telefone1;
	private String telefone2;
	private String cpf1;
	private String cpf2;
	private String rg1;
	private String rg2;
	private String cep;
	private String rua;
	private String bairro;
	private String cidade;
	private String estado;
	private String numero;
	private String complemento;

	@Enumerated(EnumType.STRING)
	private Status status;
	
	@OneToMany(cascade = CascadeType.ALL,
	           orphanRemoval = true)
	private List<Projeto> projetos = new ArrayList<>();
	
	public void addProjeto(Projeto projeto) {
		projetos.add(projeto);
		projeto.setCliente(this);
    }
 
    public void removeProjeto(Projeto projeto) {
    	projetos.remove(projeto);
    	projeto.setCliente(null);
    }
	
	public Long getIdCliente() {
		return idCliente;
	}

	public void setIdCliente(Long idCliente) {
		this.idCliente = idCliente;
	}

	public String getNome1() {
		return nome1;
	}

	public void setNome1(String nome1) {
		this.nome1 = nome1;
	}

	public String getNome2() {
		return nome2;
	}

	public void setNome2(String nome2) {
		this.nome2 = nome2;
	}

	public String getEmail1() {
		return email1;
	}

	public void setEmail1(String email1) {
		this.email1 = email1;
	}

	public String getEmail2() {
		return email2;
	}

	public void setEmail2(String email2) {
		this.email2 = email2;
	}

	public String getTelefone1() {
		return telefone1;
	}

	public void setTelefone1(String telefone1) {
		this.telefone1 = telefone1;
	}

	public String getTelefone2() {
		return telefone2;
	}

	public void setTelefone2(String telefone2) {
		this.telefone2 = telefone2;
	}

	public String getCpf1() {
		return cpf1;
	}

	public void setCpf1(String cpf1) {
		this.cpf1 = cpf1;
	}

	public String getCpf2() {
		return cpf2;
	}

	public void setCpf2(String cpf2) {
		this.cpf2 = cpf2;
	}

	public String getRg1() {
		return rg1;
	}

	public void setRg1(String rg1) {
		this.rg1 = rg1;
	}

	public String getRg2() {
		return rg2;
	}

	public void setRg2(String rg2) {
		this.rg2 = rg2;
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

	public String getEstado() {
		return estado;
	}

	public void setEstado(String estado) {
		this.estado = estado;
	}

	public String getNumero() {
		return numero;
	}

	public void setNumero(String numero) {
		this.numero = numero;
	}

	public String getComplemento() {
		return complemento;
	}

	public void setComplemento(String complemento) {
		this.complemento = complemento;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

}
