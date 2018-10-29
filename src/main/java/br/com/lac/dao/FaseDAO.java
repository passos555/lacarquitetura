package br.com.lac.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Fase;
import br.com.lac.models.Usuario;

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

	public Fase getFaseById(Long pId) {
		return manager.createQuery("select f from Fase f where f.idFase = :id", Fase.class)
				.setParameter("id", pId)
				.getSingleResult();
	}
	
	public List<Fase> getFasesByAnteProjeto(Long pId){
		return manager.createQuery("select f from Fase f where f.anteProjeto.idAnteProjeto = :id", Fase.class)
				.setParameter("id", pId).getResultList();
	}
	
	public List<Fase> getFasesByPreProjeto(Long pId){
		return manager.createQuery("select f from Fase f where f.preProjeto.idPreProjeto = :id", Fase.class)
				.setParameter("id", pId).getResultList();
	}
	
	public List<Fase> getFasesByProjetoFinal(Long pId){
		return manager.createQuery("select f from Fase f where f.projetoFinal.idProjetoFinal = :id", Fase.class)
				.setParameter("id", pId).getResultList();
	}
	
	public Fase alterStatus(Fase pFase, Usuario pUsuario) {
		
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();
		
		Fase lFase = manager.createQuery("select f from Fase f where f.idFase = :id", Fase.class)
				.setParameter("id", pFase.getIdFase()).getSingleResult();
		
		if(lFase != null) {
			lFase.setStatus(pFase.getStatus());
			lFase.setUltimoResponsavel(pUsuario);
			lFase.setDataAlteracao(sdf.format(cal.getTime()));
			return lFase;
		} else 
			return pFase;
		
	}
	
	public Fase alterPrazo(Fase pFase, Usuario pUsuario) {
		
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();
		
		Fase lFase = manager.createQuery("select f from Fase f where f.idFase = :id", Fase.class)
				.setParameter("id", pFase.getIdFase()).getSingleResult();
		
		if(lFase != null) {
			lFase.setPrazo(pFase.getPrazo());
			lFase.setUltimoResponsavel(pUsuario);
			lFase.setDataAlteracao(sdf.format(cal.getTime()));
			return lFase;
		} else 
			return pFase;
		
	}
}
