package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Categoria;

@Repository
@Transactional
public class CategoriaDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void saveCategory(Categoria pCategoria) {
		manager.persist(pCategoria);
	}
	
	public List<Categoria> list(){
		return manager.createQuery("select c from Categoria c", Categoria.class).getResultList();
	}
	
	public Categoria getById(Long pId) {
		return manager.createQuery("select c from Categoria c where c.idCategoria = :id", Categoria.class)
				.setParameter("id", pId).getSingleResult();
	}
	
	public boolean alterCategory(Categoria pCategoria) {
		
		boolean lResult = false;
		
		Categoria lCategoria = manager.createQuery("select c from Categoria c where c.idCategoria = :id", Categoria.class)
				.setParameter("id", pCategoria.getIdCategoria()).getSingleResult();
		
		if(lCategoria != null) {
			if(!pCategoria.getDescricao().equals(lCategoria.getDescricao())) {
				lResult = findCategoryByDescription(pCategoria.getDescricao());
			} 
			
			if(!lResult) {
				lCategoria.setDescricao(pCategoria.getDescricao());
				lCategoria.setObservacao(pCategoria.getObservacao());
				return true;
			} else
				return false;
		}
		
		return false;
	}
	
	public boolean findCategoryByDescription(String pName) {
		
		try {
			Categoria lCategoria = manager.createQuery("select c from Categoria c where c.descricao = :descricao", Categoria.class)
					.setParameter("descricao", pName).getSingleResult();
			
			if(lCategoria != null)
				return true;
			else
				return false;
			
		} catch (Exception e) {
			return false;
		}
	}
}
