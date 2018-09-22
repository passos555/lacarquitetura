package br.com.lac.models;

import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Projeto {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long idProjeto;
	
	
	
	private Long medidaTerreno1;
	private Long medidaTerreno2;
	private Long medidaConstrucao;
	private String rua;
	private String numero;
	private String complemento;
	private String bairro;
	private String cidade;
	private String condominio;
	private String quadra;
	private String lote;
	private String cadastroPrefeitura;
	private boolean contrato;
	private boolean documento;
	private boolean levantamento;
	private String observacao;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "idCliente")
    private Cliente cliente;
	
	@Enumerated(EnumType.STRING)
	private TipoProjeto tipoProjeto;
	
	public Long getIdProjeto() {
		return idProjeto;
	}

	public void setIdProjeto(Long idProjeto) {
		this.idProjeto = idProjeto;
	}

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

	public String getRua() {
		return rua;
	}

	public void setRua(String rua) {
		this.rua = rua;
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

	public String getCadastroPrefeitura() {
		return cadastroPrefeitura;
	}

	public void setCadastroPrefeitura(String cadastroPrefeitura) {
		this.cadastroPrefeitura = cadastroPrefeitura;
	}

	public boolean isContrato() {
		return contrato;
	}

	public void setContrato(boolean contrato) {
		this.contrato = contrato;
	}

	public boolean isDocumento() {
		return documento;
	}

	public void setDocumento(boolean documento) {
		this.documento = documento;
	}

	public boolean isLevantamento() {
		return levantamento;
	}

	public void setLevantamento(boolean levantamento) {
		this.levantamento = levantamento;
	}

	public String getObservacao() {
		return observacao;
	}

	public void setObservacao(String observacao) {
		this.observacao = observacao;
	}

	public TipoProjeto getTipoProjeto() {
		return tipoProjeto;
	}

	public void setTipoProjeto(TipoProjeto tipoProjeto) {
		this.tipoProjeto = tipoProjeto;
	}

	
	
}
