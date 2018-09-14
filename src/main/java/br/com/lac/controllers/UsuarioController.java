package br.com.lac.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lac.dao.UsuarioDAO;
import br.com.lac.models.Permissao;
import br.com.lac.models.Status;
import br.com.lac.models.Usuario;

@Controller
public class UsuarioController {

	@Autowired
	private UsuarioDAO usuarioDao;

	// Abre view de cadastro
	@RequestMapping("/usuarios/novo")
	public ModelAndView open() {
		ModelAndView model = new ModelAndView("usuarios/novo");
		model.addObject("permissoes", Permissao.values());
		return model;
	}

	// Salva novo usuário
	@CacheEvict(value = "userList", allEntries = true)
	@RequestMapping(value = "/usuario/novo", method = RequestMethod.POST)
	public ModelAndView save(Usuario pUsuario, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/novo");

		if (usuarioDao.findUsuarioByEmail(pUsuario.getEmail()) != null) {
			redirectAttributes.addFlashAttribute("erro", "Este email já está sendo usado!");
			return model;
		}
		pUsuario.setStatus(Status.Ativo);
		usuarioDao.saveUser(pUsuario);
		redirectAttributes.addFlashAttribute("sucesso", "Usuário cadastrado com sucesso!");
		return model;
	}

	// Abre view de consulta
	@Cacheable(value = "userList")
	@RequestMapping("/usuarios/consulta")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("usuarios/consulta");
		List<Usuario> usuarios = usuarioDao.list();
		model.addObject("usuarios", usuarios);
		model.addObject("permissoes", Permissao.values());
		return model;
	}

	// Altera usuário
	@CacheEvict(value = "userList", allEntries = true)
	@RequestMapping(value = "/usuarios/altera", method = RequestMethod.POST)
	public ModelAndView alter(Usuario pUsuario, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/usuarios/consulta");
		
		boolean result = usuarioDao.alterUser(pUsuario);
		if (result)
			redirectAttributes.addFlashAttribute("sucesso", "Usuário alterado com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Usuário não foi alterado!");

		return model;
	}

	// Ajax - troca status do usuário
	@RequestMapping("/usuarios/changeStatusById")
	public @ResponseBody Usuario changeStatusById(@RequestParam Long id) {
		return usuarioDao.changeStatusById(id);
	}
}
