package br.com.lac.models;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Cliente {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idCliente;
	private String nome;
	private String email;
	private String telefone;
	private String cpf;
	private String cnpj;
	private String rg;
	private Boolean secundario;
	
	@OneToOne
	@JoinColumn(name = "idClienteSec", nullable = true)
	private Cliente ClienteSec;
	
	private TipoCliente tipoCliente;
	
	@Enumerated(EnumType.STRING)
	private Status status;
	
	@OneToMany(cascade = CascadeType.ALL,
	           orphanRemoval = true)
	private List<Projeto> projetos = new ArrayList<>();
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idEndereco")
	private Endereco endereco;
	
	public void addProjeto(Projeto projeto) {
		projetos.add(projeto);
		projeto.setCliente(this);
    }
	
    public Endereco getEndereco() {
		return endereco;
	}

	public void setEndereco(Endereco endereco) {
		this.endereco = endereco;
	}

	public Boolean getSecundario() {
		return secundario;
	}

	public void setSecundario(Boolean secundario) {
		this.secundario = secundario;
	}

	public Cliente getClienteSec() {
		return ClienteSec;
	}

	public void setClienteSec(Cliente clienteSec) {
		ClienteSec = clienteSec;
	}

	public String getCnpj() {
		return cnpj;
	}

	public void setCnpj(String cnpj) {
		this.cnpj = cnpj;
	}

	public TipoCliente getTipoCliente() {
		return tipoCliente;
	}
    
	public void setTipoCliente(TipoCliente tipoCliente) {
		this.tipoCliente = tipoCliente;
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

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTelefone() {
		return telefone;
	}

	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}

	public String getCpf() {
		return cpf;
	}

	public void setCpf(String cpf) {
		this.cpf = cpf;
	}

	public String getRg() {
		return rg;
	}

	public void setRg(String rg) {
		this.rg = rg;
	}

	public Status getStatus() {
		return status;
	}

	public void setStatus(Status status) {
		this.status = status;
	}

	@Override
	public boolean equals(Object pObject) {
		if(this == pObject) return true;
		if(!(pObject instanceof Cliente)) return false;
		return idCliente != null && idCliente.equals(((Cliente) pObject).idCliente);
	}
	@Override
    public int hashCode() {
        return 31;
    }
	
	
	

}
