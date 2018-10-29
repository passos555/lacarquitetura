package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.LogProjeto;

@Repository
@Transactional
public class LogProjetoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void gravar(LogProjeto pLogProjeto) {
		manager.persist(pLogProjeto);
	}
	
	public List<LogProjeto> list(){
		return manager.createQuery("select lp from LogProjeto lp", LogProjeto.class).getResultList();
	}
}
