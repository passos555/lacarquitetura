package br.com.lac.models;

public enum StatusFaseProjeto {
	
	Andamento("Em andamento"),
	Concluido("Concluído"),
	Analise("Em análise"),
	Revisando("Revisando");
	
	private String name;

    StatusFaseProjeto(String name) {
        this.name = name;
    }

    public String getName() {
        return this.name;
    }    
    
    @Override
    public String toString() {
        return name;
    }
	
}
