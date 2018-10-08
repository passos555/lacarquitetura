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

import br.com.lac.dao.CategoriaDAO;
import br.com.lac.models.Categoria;

@Controller
public class CategoriaController {

	@Autowired
	private CategoriaDAO categoriaDao;
	
	//Abre view de cadastro
	@RequestMapping("/categorias/novo")
	public ModelAndView open() {
		ModelAndView model = new ModelAndView("categorias/novo");
		return model;
	}
	
	//Lista categorias
	@Cacheable(value = "categoryList")
	@RequestMapping("/categorias/consulta")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView("categorias/consulta");
		model.addObject("categorias", categoriaDao.list());
		return model;
	}
	
	// Salva nova categoria
	@CacheEvict(value = "categoryList", allEntries = true)
	@RequestMapping(value = "/categorias/novo", method = RequestMethod.POST)
	public ModelAndView saveCategory(Categoria pCategoria, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/categorias/novo");
		
		if(categoriaDao.findCategoryByDescription(pCategoria.getDescricao())) {
			redirectAttributes.addFlashAttribute("erro", "Esta categoria já foi cadastrada!");
			return model;
		}
		
		categoriaDao.saveCategory(pCategoria);
		redirectAttributes.addFlashAttribute("sucesso", "Categoria cadastrada com sucesso!");
		return model;
	}
	
	//Salva nova categoria com Json
	@CacheEvict(value = "categoryList", allEntries = true)
	@RequestMapping(value = "/categorias/novoJson", method = RequestMethod.POST)
	public @ResponseBody Categoria saveCategoryJson(@RequestBody Categoria pCategoriaJson){
		System.out.println(pCategoriaJson.getDescricao());
		if(pCategoriaJson != null)
			categoriaDao.saveCategory(pCategoriaJson);
		
		return pCategoriaJson;
		
	}
	
	//Altera categoria
	@CacheEvict(value = "categoryList", allEntries = true)
	@RequestMapping(value = "/categorias/altera", method = RequestMethod.POST)
	public ModelAndView alterCategory(Categoria pCategoria, RedirectAttributes redirectAttributes){
		
		ModelAndView model = new ModelAndView("redirect:/categorias/consulta");
		
		if(categoriaDao.alterCategory(pCategoria)) 
			redirectAttributes.addFlashAttribute("sucesso", "Categoria alterada com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Esta categoria já foi cadastrada!");
			
		
		return model;
	}
	
}
