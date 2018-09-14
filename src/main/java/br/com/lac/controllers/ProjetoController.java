package br.com.lac.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.lac.dao.ClienteDAO;
import br.com.lac.models.CategoriaProjeto;
import br.com.lac.models.TipoProjeto;

@Controller
public class ProjetoController {
	
	@Autowired
	private ClienteDAO clienteDao;
	
	//Abre view de cadstro
	@RequestMapping("/projetos/novo")
	public ModelAndView open() {
		
		ModelAndView model = new ModelAndView("projetos/novo");
		model.addObject("tipoProjeto", TipoProjeto.values());
		model.addObject("categoriaProjeto", CategoriaProjeto.values());
		model.addObject("clientes", clienteDao.list());
		
		return model;
	}
	
	
}
