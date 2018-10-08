package br.com.lac.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import br.com.lac.dao.EnderecoDAO;
import br.com.lac.models.Endereco;

@Controller
public class EnderecoController {
	
	@Autowired
	private EnderecoDAO enderecoDao;
	
	@RequestMapping(value = "/enderecos/save" , method = RequestMethod.POST)
	public @ResponseBody Endereco save(@RequestBody Endereco pEnderecoJson) {
		
		if(pEnderecoJson != null)
			enderecoDao.saveEndereco(pEnderecoJson);
		
		return pEnderecoJson;
	}
	
}
