package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.ProjetoFinal;

@Repository
@Transactional
public class ProjetoFinalDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void save(ProjetoFinal pProjetoFinal) {
		manager.persist(pProjetoFinal);
	}
	
	public List<ProjetoFinal> getByProjectId(Long pId) {
		return manager.createQuery("select pf from ProjetoFinal pf where pf.projeto.idProjeto = :id", ProjetoFinal.class)
				.setParameter("id", pId).getResultList();
	}
	
}
