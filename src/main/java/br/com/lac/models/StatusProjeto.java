package br.com.lac.models;

public enum StatusProjeto {
	
	Andamento("Em andamento"),
	Concluido("Concluído"),
	Aguardando("Aguardando cliente");
	
	private String name;

    StatusProjeto(String name) {
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
