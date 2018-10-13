package br.com.lac.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Projeto;

@Repository
@Transactional
public class ProjetoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void saveProject(Projeto pProjeto) {
		manager.persist(pProjeto);
	}
}
