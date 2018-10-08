package br.com.lac.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.lac.dao.CategoriaDAO;
import br.com.lac.dao.ClienteDAO;
import br.com.lac.dao.TipoProjetoDAO;

@Controller
public class ProjetoController {
	
	@Autowired
	private ClienteDAO clienteDao;
	
	@Autowired
	private CategoriaDAO categoriaDao;
	
	@Autowired
	private TipoProjetoDAO tipoProjetoDao;
	
	//Abre view de cadastro
	@RequestMapping("/projetos/novo")
	public ModelAndView open() {
		
		ModelAndView model = new ModelAndView("projetos/novo");
		model.addObject("clientes", clienteDao.list());
		model.addObject("categorias", categoriaDao.list());
		model.addObject("tipos", tipoProjetoDao.list());
		
		return model;
	}
	
	
}
