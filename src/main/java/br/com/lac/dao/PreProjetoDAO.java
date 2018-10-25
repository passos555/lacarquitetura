package br.com.lac.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.PreProjeto;

@Repository
@Transactional
public class PreProjetoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void save(PreProjeto pPreProjeto) {
		manager.persist(pPreProjeto);
	}
	
	public PreProjeto getByProjectId(Long pId) {
		return manager.createQuery("select p from PreProjeto p where p.projeto.idProjeto = :id", PreProjeto.class)
				.setParameter("id", pId).getSingleResult();
	}
	
}
