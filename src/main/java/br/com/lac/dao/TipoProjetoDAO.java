package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.TipoProjeto;

@Repository
@Transactional
public class TipoProjetoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void saveProjectType(TipoProjeto pTipoProjeto) {
		manager.persist(pTipoProjeto);
	}
	
	public List<TipoProjeto> list(){
		return manager.createQuery("select tp from TipoProjeto tp", TipoProjeto.class).getResultList();
	}
	
	
	public boolean alterProjectType(TipoProjeto pTipoProjeto) {
		
		boolean lResult = false;
		
		TipoProjeto lTipoProjeto = manager.createQuery("select tp from TipoProjeto tp where tp.idTipoProjeto = :id", TipoProjeto.class)
				.setParameter("id", pTipoProjeto.getIdTipoProjeto()).getSingleResult();
		
		if(lTipoProjeto != null) {
			if(!pTipoProjeto.getDescricao().equals(lTipoProjeto.getDescricao())) {
				lResult = findProjectTypeByDescription(pTipoProjeto.getDescricao());
			} 
			
			if(!lResult) {
				lTipoProjeto.setDescricao(pTipoProjeto.getDescricao());
				lTipoProjeto.setObservacao(pTipoProjeto.getObservacao());
				return true;
			} else
				return false;
		}
		
		return false;
	}
	
	
	public boolean findProjectTypeByDescription(String pName) {
		
		try {
			TipoProjeto lTipoProjeto = manager.createQuery("select tp from TipoProjeto tp where tp.descricao = :descricao", TipoProjeto.class)
					.setParameter("descricao", pName).getSingleResult();
			
			if(lTipoProjeto != null)
				return true;
			else
				return false;
			
		} catch (Exception e) {
			return false;
		}
	}
}
