package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Cliente;

@Repository
@Transactional
public class ClienteDAO {

	@PersistenceContext
	private EntityManager manager;

	public void saveClient(Cliente cliente) {
		manager.persist(cliente);
	}

	public List<Cliente> list() {
		return manager.createQuery("select c from Cliente c", Cliente.class).getResultList();
	}
	
	public Cliente getById(Long pId) {
		return manager.createQuery("select c from Cliente c where c.idCliente = :id", Cliente.class)
				.setParameter("id", pId).getSingleResult();
	}
	
	public boolean findClientByCpf(Cliente pCliente) {

		try {
			Cliente lCliente = manager
					.createQuery("select distinct(c) from Cliente c" + " where c.cpf = :cpf",
							Cliente.class)
					.setParameter("cpf", pCliente.getCpf())
					.getSingleResult();

			if (lCliente != null)
				return true;
			else
				return false;
		} catch (Exception e) {
			return false;
		}

	}

	public boolean alterClient(Cliente pCliente) {
		try {
			boolean lResult = false;
			Cliente lCliente = (Cliente) manager.find(Cliente.class, pCliente.getIdCliente());
			if (lCliente != null) {
				if(pCliente.getCpf() != lCliente.getCpf()) {
					lResult = findClientByCpf(lCliente); 
				}
				
				if(lResult) {
					lCliente.setNome(pCliente.getNome());
					lCliente.setEmail(pCliente.getEmail());
					lCliente.setTelefone(pCliente.getTelefone());
					lCliente.setCpf(pCliente.getCpf());
					lCliente.setRg(pCliente.getRg());
					return true;
				}else
					return false;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

}
