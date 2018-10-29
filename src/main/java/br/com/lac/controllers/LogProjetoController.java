package br.com.lac.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.lac.dao.LogProjetoDAO;

@Controller
public class LogProjetoController {
	
	@Autowired
	private LogProjetoDAO logProjetoDao;
	
	@RequestMapping("/logs/projetos")
	public ModelAndView list() {
		
		ModelAndView model = new ModelAndView();
		model.addObject("logProjetos", logProjetoDao.list());
		
		return model;
	}
	
}
