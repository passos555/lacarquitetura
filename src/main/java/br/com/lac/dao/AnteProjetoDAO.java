package br.com.lac.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.AnteProjeto;

@Repository
@Transactional
public class AnteProjetoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void save(AnteProjeto pAnteProjeto) {
		manager.persist(pAnteProjeto);
	}
	
	public AnteProjeto getByProjectId(Long pIdProjeto) {
		return manager.createQuery("select a from AnteProjeto a where a.idProjeto = :idProjeto", AnteProjeto.class)
				.setParameter("idProjeto", pIdProjeto).getSingleResult();
	}
	
}
