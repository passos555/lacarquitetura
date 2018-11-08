package br.com.lac.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.lac.dao.ClienteDAO;
import br.com.lac.dao.ProjetoDAO;
import br.com.lac.dao.UsuarioDAO;
import br.com.lac.models.StatusProjeto;

@Controller
public class HomeController {

	@Autowired
	private ProjetoDAO projetoDao;
	
	@Autowired
	private ClienteDAO clienteDao;
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@RequestMapping("/")
	public ModelAndView index() {
		ModelAndView model = new ModelAndView("home");
		
		model.addObject("projetos", projetoDao.countProjct());
		model.addObject("projetosAndamento", projetoDao.countProjectByStatus(StatusProjeto.Andamento));
		model.addObject("projetosAguardando", projetoDao.countProjectByStatus(StatusProjeto.Aguardando));
		model.addObject("projetosConcluido", projetoDao.countProjectByStatus(StatusProjeto.Concluido));
		
		model.addObject("clientes", clienteDao.countClients());
		
		model.addObject("usuarios", usuarioDao.countUsers());
		
		return model;
	}
}
