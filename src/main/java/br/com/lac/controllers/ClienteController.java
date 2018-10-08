package br.com.lac.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lac.dao.ClienteDAO;
import br.com.lac.dao.EnderecoDAO;
import br.com.lac.models.Cliente;
import br.com.lac.models.ClienteSecundario;
import br.com.lac.models.Endereco;
import br.com.lac.models.Estado;
import br.com.lac.models.Status;
import br.com.lac.models.TipoCliente;

@Controller
public class ClienteController {
	
	@Autowired
	private ClienteDAO clienteDao;
	
	@Autowired
	private EnderecoDAO enderecoDao;
	
	// Abre view de cadastro
	@RequestMapping("/clientes/novo")
	public ModelAndView open() {
		ModelAndView model = new ModelAndView("clientes/novo");
		model.addObject("tiposCliente", TipoCliente.values());
		model.addObject("estados", Estado.values());
		model.addObject("enderecos", enderecoDao.list());
		return model;
	}

	// Abre view de consulta
	@Cacheable(value = "clientList")
	@RequestMapping("/clientes/consulta")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		List<Cliente> lClientes = clienteDao.list();
		model.addObject("clientes", lClientes);
		model.addObject("tiposCliente", TipoCliente.values());
		return model;
	}

	// Salva novo cliente
	@CacheEvict(value = "clientList", allEntries = true)
	@RequestMapping(value = "/clientes/novo", method = RequestMethod.POST)
	public ModelAndView save(Cliente pCliente, 
							 ClienteSecundario pClienteSec, 
							 @RequestParam String pEndereco,
							 @RequestParam String pEnderecoSec,
							 RedirectAttributes redirectAttributes) {
		
		ModelAndView model = new ModelAndView("redirect:/clientes/novo");
		Endereco lEndereco = new Endereco();
		Endereco lEnderecoSec = new Endereco();
		
		if(!pCliente.getCpf().isEmpty()) {
			if (clienteDao.findClientByCpf(pCliente)) {
				redirectAttributes.addFlashAttribute("erro", "Este CPF já foi cadastrado!");
				return model;
			}
		}
		
		if(!pEndereco.replace(",",  "").equals("0")) {
			Long lIdEndereco = Long.parseLong(pEndereco.replace(",", ""));
			lEndereco = enderecoDao.getById(lIdEndereco);
			lEndereco.addCliente(pCliente);
			clienteDao.saveClient(pCliente);
			enderecoDao.saveEndereco(lEndereco);
		}
		
		pCliente.setStatus(Status.Ativo);
		pCliente.setSecundario(false);
		clienteDao.saveClient(pCliente);
		
		
		if(!pClienteSec.getNomeClienteSec().isEmpty()) {
			Cliente lClienteSec = new Cliente();
			lClienteSec.setNome(pClienteSec.getNomeClienteSec());
			lClienteSec.setEmail(pClienteSec.getEmailClienteSec());
			lClienteSec.setTelefone(pClienteSec.getTelefoneClienteSec());
			lClienteSec.setCpf(pClienteSec.getCpfClienteSec());
			lClienteSec.setRg(pClienteSec.getRgClienteSec());
			lClienteSec.setSecundario(true);
			lClienteSec.setStatus(Status.Ativo);
			lClienteSec.setTipoCliente(TipoCliente.Fisica);
			
			if(!lClienteSec.getCpf().isEmpty()) {
				if (clienteDao.findClientByCpf(lClienteSec)) {
					redirectAttributes.addFlashAttribute("erro", "Este CPF já foi cadastrado!");
					return model;
				}
			}
			clienteDao.saveClient(lClienteSec);
			pCliente.setClienteSec(lClienteSec);
			clienteDao.saveClient(pCliente);
			
			if(!pEnderecoSec.replace(",",  "").equals("0")) {
				Long lIdEnderecoSec = Long.parseLong(pEnderecoSec.replace(",", ""));
				lEnderecoSec = enderecoDao.getById(lIdEnderecoSec);
				clienteDao.saveClient(lClienteSec);
				lEnderecoSec.addCliente(lClienteSec);
				enderecoDao.saveEndereco(lEnderecoSec);
			}
		}
		
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
