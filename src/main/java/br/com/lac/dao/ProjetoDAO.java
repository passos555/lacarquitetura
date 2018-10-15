package br.com.lac.dao;

import java.util.List;

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

	public List<Projeto> list() {
		return manager.createQuery("select p from Projeto p", Projeto.class).getResultList();
	}
	
	public Projeto getById(Long pId) {
		return manager.createQuery("select p from Projeto p where p.idProjeto = :id", Projeto.class)
				.setParameter("id", pId)
				.getSingleResult();
	}
}
