package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Endereco;

@Repository
@Transactional
public class EnderecoDAO {
	
	@PersistenceContext
	private EntityManager manager;
	
	public void saveEndereco(Endereco pEndereco) {
		manager.persist(pEndereco);
	}
	
	public List<Endereco> list() {
		return manager.createQuery("select e from Endereco e", Endereco.class).getResultList();
	}
	
	public Endereco getById(Long pId) {
		return manager.createQuery("select e from Endereco e where e.idEndereco = :pId", Endereco.class)
				.setParameter("pId", pId).getSingleResult();
	}
	
}
