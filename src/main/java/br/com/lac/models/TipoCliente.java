package br.com.lac.models;

public enum TipoCliente {

	Fisica("Pessoa Física"),
    Juridica("Pessoa Jurídica");
    
    private String name;

    TipoCliente(String name) {
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
