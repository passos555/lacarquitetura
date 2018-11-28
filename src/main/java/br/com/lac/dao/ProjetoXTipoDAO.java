package br.com.lac.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.ProjetoXTipo;

@Repository
@Transactional
public class ProjetoXTipoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void saveProjectXType(ProjetoXTipo pProjetoXTipo) {
		manager.persist(pProjetoXTipo);
	}

	
}
