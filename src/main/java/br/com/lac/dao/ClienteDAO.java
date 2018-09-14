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
		return manager.createQuery("select c from Cliente c order by c.nome1", Cliente.class).getResultList();
	}

	public boolean findClientByCpf(Cliente pCliente) {

		try {
			Cliente lCliente = manager
					.createQuery("select distinct(c) from Cliente c" + " where c.cpf1 = :cpf1 or c.cpf2 = :cpf2",
							Cliente.class)
					.setParameter("cpf1", pCliente.getCpf1()).setParameter("cpf2", pCliente.getCpf2())
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
				if(pCliente.getCpf1() != lCliente.getCpf1()) {
					lResult = findClientByCpf(lCliente); 
				}
				
				if(lResult) {
					lCliente.setNome1(pCliente.getNome1());
					lCliente.setNome2(pCliente.getNome2());
					lCliente.setEmail1(pCliente.getEmail1());
					lCliente.setEmail2(pCliente.getEmail2());
					lCliente.setTelefone1(pCliente.getTelefone1());
					lCliente.setTelefone2(pCliente.getTelefone2());
					lCliente.setCpf1(pCliente.getCpf1());
					lCliente.setCpf2(pCliente.getCpf2());
					lCliente.setRg1(pCliente.getRg1());
					lCliente.setRg2(pCliente.getRg2());
					lCliente.setCep(pCliente.getCep());
					lCliente.setRua(pCliente.getRua());
					lCliente.setBairro(pCliente.getBairro());
					lCliente.setCidade(pCliente.getCidade());
					lCliente.setEstado(pCliente.getEstado());
					lCliente.setNumero(pCliente.getNumero());
					lCliente.setComplemento(pCliente.getComplemento());
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
