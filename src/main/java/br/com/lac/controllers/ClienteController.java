package br.com.lac.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lac.dao.ClienteDAO;
import br.com.lac.models.Cliente;
import br.com.lac.models.Status;

@Controller
public class ClienteController {

	@Autowired
	private ClienteDAO clienteDao;

	// Abre view de cadastro
	@RequestMapping("/clientes/novo")
	public ModelAndView open() {
		ModelAndView model = new ModelAndView("clientes/novo");

		return model;
	}

	// Abre view de consulta
	@Cacheable(value = "clientList")
	@RequestMapping("/clientes/consulta")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		List<Cliente> lClientes = clienteDao.list();
		model.addObject("clientes", lClientes);
		return model;
	}

	// Salva novo cliente
	@CacheEvict(value = "clientList", allEntries = true)
	@RequestMapping(value = "/clientes/novo", method = RequestMethod.POST)
	public ModelAndView save(Cliente pCliente, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/clientes/novo");

		if (clienteDao.findClientByCpf(pCliente)) {
			redirectAttributes.addFlashAttribute("erro", "Este CPF já foi cadastrado!");
			return model;
		}

		pCliente.setStatus(Status.Ativo);
		clienteDao.saveClient(pCliente);
		redirectAttributes.addFlashAttribute("sucesso", "Cliente cadastrado com sucesso!");
		return model;
	}

	// Altera Cliente
	@CacheEvict(value = "clientList", allEntries = true)
	@RequestMapping(value = "/clientes/altera", method = RequestMethod.POST)
	public ModelAndView alter(Cliente pCliente, RedirectAttributes redirectAttributes) {
		ModelAndView model = new ModelAndView("redirect:/clientes/consulta");

		boolean result = clienteDao.alterClient(pCliente);
		if (result)
			redirectAttributes.addFlashAttribute("sucesso", "Cliente alterado com sucesso!");
		else
			redirectAttributes.addFlashAttribute("erro", "Cliente não foi alterado!");

		return model;
	}

}
