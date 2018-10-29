package br.com.lac.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.lac.models.Status;
import br.com.lac.models.Usuario;

@Repository
@Transactional
@EnableGlobalMethodSecurity(prePostEnabled = true, proxyTargetClass = true)
public class UsuarioDAO implements UserDetailsService {

	@PersistenceContext
	private EntityManager manager;

	private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();

	public void saveUser(Usuario pUsuario) {
		String hasSenha = passwordEncoder.encode(pUsuario.getSenha());
		pUsuario.setSenha(hasSenha);
		manager.persist(pUsuario);
	}
	
	public Long countUsers() {
		
		Long lCount = (Long)manager.createQuery("select count(u) from Usuario u").getSingleResult();
		
		if(lCount != null)
			return lCount;
		else
			return (long) 0;
	}

	public Usuario findUsuarioByEmail(String pEmail) {
		try {
			Usuario lUsuario = manager
					.createQuery("select distinct(u) from Usuario u" + " where u.email = :email", Usuario.class)
					.setParameter("email", pEmail).getSingleResult();
			if (lUsuario != null)
				return lUsuario;
			else
				return null;

		} catch (Exception e) {
			return null;
		}
	}

	public Usuario findUsuarioById(Long pId) {
		return manager.createQuery("select distinct(u) from Usuario u where u.idUsuario = :id", Usuario.class)
				.setParameter("id", pId).getSingleResult();
	}

	public boolean alterUser(Usuario pUsuario) {
		try {
			Usuario lUsuario = (Usuario) manager.find(Usuario.class, pUsuario.getIdUsuario());
			if (lUsuario != null) {

				if (pUsuario.getSenha() != "") {
					pUsuario.setSenha(passwordEncoder.encode(pUsuario.getSenha()));
					lUsuario.setSenha(pUsuario.getSenha());
				}
				if(pUsuario.getNome() != "")
					lUsuario.setNome(pUsuario.getNome());
				if(pUsuario.getEmail() != "")
					lUsuario.setEmail(pUsuario.getEmail());
				
				lUsuario.setPermissao(pUsuario.getPermissao());
				
				return true;
			}
		} catch (Exception e) {
			return false;
		}
		return false;
	}

	public Usuario loginUsuario(String pEmail, String pSenha) {
		try {
			Usuario lUsuario = this.findUsuarioByEmail(pEmail);
			if (lUsuario != null && lUsuario.getSenha().equals(pSenha))
				return lUsuario;
		} catch (Exception e) {
			return null;
		}

		return null;
	}

	public List<Usuario> list() {
		return manager.createQuery("select u from Usuario u", Usuario.class).getResultList();
	}

	public Usuario loadUserByUsername(String pEmail) {
		List<Usuario> lUsuarios = manager.createQuery("select u from Usuario u where email = :email", Usuario.class)
				.setParameter("email", pEmail).getResultList();

		if (lUsuarios.isEmpty()) {
			throw new UsernameNotFoundException("Usuario " + pEmail + " não foi encontrado");
		}

		return lUsuarios.get(0);
	}

	public Usuario changeStatusById(Long pId) {

		Usuario lUsuario = manager.createQuery("select u from Usuario u where idUsuario = :id", Usuario.class)
				.setParameter("id", pId).getSingleResult();

		if (lUsuario != null) {
			if (lUsuario.getStatus().equals(Status.Ativo)) {
				lUsuario.setStatus(Status.Inativo);
				return lUsuario;
			} else {
				lUsuario.setStatus(Status.Ativo);
				return lUsuario;
			}
		}

		return null;
	}
}