package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Projeto;
import br.com.lac.models.StatusFaseProjeto;
import br.com.lac.models.StatusProjeto;

@Repository
@Transactional
public class ProjetoDAO {

	@PersistenceContext
	private EntityManager manager;
	
	public void saveProject(Projeto pProjeto) {
		manager.persist(pProjeto);
	}
	
	public boolean alterProject(Projeto pProjeto) {
		
		Projeto lProjeto = getById(pProjeto.getIdProjeto());
		
		if(lProjeto != null) {
			lProjeto.setMedidaConstrucao(pProjeto.getMedidaConstrucao());
			lProjeto.setMedidaTerreno1(pProjeto.getMedidaTerreno1());
			lProjeto.setMedidaTerreno2(pProjeto.getMedidaTerreno2());
			lProjeto.setStatus(pProjeto.getStatus());
			return true;
		} else
			return false;
	}
	
	public Long countProjct() {
		
		Long lCount = (Long)manager.createQuery("select count(p) from Projeto p").getSingleResult();
		
		if(lCount != null)
			return lCount;
		else
			return (long) 0;
	}
	
	public Long countProjectByStatus(StatusProjeto pStatus) {
		
		Long lCount = (Long)manager.createQuery("select count(p) from Projeto p where p.status = :status")
				.setParameter("status", pStatus)
				.getSingleResult();
		
		if(lCount != null)
			return lCount;
		else
			return (long) 0;
		
	}
	
	public Long countAplicableFases(Long pId) {
		
		Long lCount = (Long)manager.createQuery("select count(f) from Fase f"
				+ " left join f.anteProjeto"
				+ " left join f.preProjeto"
				+ " left join f.projetoFinal"
				+ " where f.status != :status"
				+ " and (f.anteProjeto.projeto.idProjeto = :id"
				+ " or f.preProjeto.projeto.idProjeto = :id"
				+ " or f.projetoFinal.projeto.idProjeto = :id)")
				.setParameter("status", StatusFaseProjeto.Nao)
				.setParameter("id", pId)
				.getSingleResult();
		
		if(lCount != null)
			return lCount;
		else
			return (long) 0;
		
	}
	
	public Long countFinishedProject(Long pId) {
		
		Long lCount = (Long)manager.createQuery("select count(f) from Fase f"
				+ " left join f.anteProjeto"
				+ " left join f.preProjeto"
				+ " left join f.projetoFinal"
				+ " where f.status = :status"
				+ " and (f.anteProjeto.projeto.idProjeto = :id"
				+ " or f.preProjeto.projeto.idProjeto = :id"
				+ " or f.projetoFinal.projeto.idProjeto = :id)")
				.setParameter("status", StatusFaseProjeto.Concluido)
				.setParameter("id", pId)
				.getSingleResult();
		
		if(lCount != null)
			return lCount;
		else
			return (long) 0;
		
	}

	public List<Projeto> list() {
		return manager.createQuery("select p from Projeto p", Projeto.class).getResultList();
	}
	
	public Projeto getById(Long pId) {
		return manager.createQuery("select p from Projeto p where p.idProjeto = :id", Projeto.class)
				.setParameter("id", pId)
				.getSingleResult();
	}
	
	public List<String> getProjectTypesByProjectId(Long pId){
		return manager.createQuery("select t.descricao from ProjetoXTipo pt "
				+ "left join pt.tipo t "
				+ "where pt.projeto.idProjeto = :id", String.class)
				.setParameter("id", pId)
				.getResultList();
	}
	
	public Long getProjectByFaseId(Long pId) {
		return manager.createQuery("select coalesce(f.preProjeto.projeto.idProjeto, f.anteProjeto.projeto.idProjeto, f.projetoFinal.projeto.idProjeto) from Fase f"
				+ " left join f.preProjeto"
				+ " left join f.anteProjeto"
				+ " left join f.projetoFinal"
				+ " where f.idFase = :id", Long.class)
				.setParameter("id", pId)
				.getSingleResult();
		
	}
	
}
