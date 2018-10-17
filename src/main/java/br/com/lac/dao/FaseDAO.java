package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Fase;

@Repository
@Transactional
public class FaseDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void saveFases(List<Fase> pFase) {
		for (Fase fase : pFase) {
			manager.persist(fase);
		}
	}
}
