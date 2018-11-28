package br.com.lac.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lac.dao.TipoProjetoDAO;
import br.com.lac.models.TipoProjeto;

@Controller
public class TipoProjetoController {

	@Autowired
	private TipoProjetoDAO tipoProjetoDao;

	// Abre view de cadastro
	@RequestMapping("/tipos/novo")
	public ModelAndView open() {
		ModelAndView model = new ModelAndView("tipos/novo");
		return model;
	}
	
	//Lista categorias
	@Cacheable(value = "projectTypeList")
	@RequestMapping("/tipos/consulta")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("tipos/consulta");
		model.addObject("tipos", tipoProjetoDao.list());
		return model;
	}
	
	// Salva novo tipo
	@CacheEvict(value = "projectTypeList", allEntries = true)
	@RequestMapping(value = "/tipos/novo", method = RequestMethod.POST)
	public ModelAndView saveProjectType(TipoProjeto pTipoProjeto, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/tipos/novo");

		if (tipoProjetoDao.findProjectTypeByDescription(pTipoProjeto.getDescricao())) {
			redirectAttributes.addFlashAttribute("erro", "Este tipo já foi cadastrado!");
			return model;
		}

		tipoProjetoDao.saveProjectType(pTipoProjeto);
		redirectAttributes.addFlashAttribute("sucesso", "Tipo cadastrado com sucesso!");
		return model;
	}

	// Salva novo tipo com Json
	@CacheEvict(value = "projectTypeList", allEntries = true)
	@RequestMapping(value = "/tipos/novoJson", method = RequestMethod.POST)
	public @ResponseBody TipoProjeto saveProjectTypeJson(@RequestBody TipoProjeto pTipoProjetoJson) throws Error {

		if (tipoProjetoDao.findProjectTypeByDescription(pTipoProjetoJson.getDescricao())) {
			throw new Error("Este tipo já foi cadastrado!");
		}
		
		tipoProjetoDao.saveProjectType(pTipoProjetoJson);
		return pTipoProjetoJson;
	}
	
	//Altera tipo projeto
	@CacheEvict(value = "projectTypeList", allEntries = true)
	@RequestMapping(value = "/tipos/altera", method = RequestMethod.POST)
	public ModelAndView alterProjectType(TipoProjeto pTipoProjeto, RedirectAttributes redirectAttributes){
		
		ModelAndView model = new ModelAndView("redirect:/tipos/consulta");
		
		if(tipoProjetoDao.alterProjectType(pTipoProjeto)) 
			redirectAttributes.addFlashAttribute("sucesso", "Tipo de projeto alterado com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Este tipo de projeto já foi cadastrado!");
			
		
		return model;
	}

}
