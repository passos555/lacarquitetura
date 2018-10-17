package br.com.lac.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lac.dao.AnteProjetoDAO;
import br.com.lac.dao.CategoriaDAO;
import br.com.lac.dao.ClienteDAO;
import br.com.lac.dao.EnderecoDAO;
import br.com.lac.dao.FaseDAO;
import br.com.lac.dao.ProjetoDAO;
import br.com.lac.dao.ProjetoXTipoDAO;
import br.com.lac.dao.TipoProjetoDAO;
import br.com.lac.models.AnteProjeto;
import br.com.lac.models.Categoria;
import br.com.lac.models.Cliente;
import br.com.lac.models.Endereco;
import br.com.lac.models.Estado;
import br.com.lac.models.Fase;
import br.com.lac.models.Projeto;
import br.com.lac.models.ProjetoXTipo;
import br.com.lac.models.StatusProjeto;
import br.com.lac.models.TipoProjeto;

@Controller
public class ProjetoController {
	
	@Autowired
	private ClienteDAO clienteDao;
	
	@Autowired
	private CategoriaDAO categoriaDao;
	
	@Autowired
	private TipoProjetoDAO tipoProjetoDao;
	
	@Autowired
	private EnderecoDAO enderecoDao;
	
	@Autowired
	private ProjetoDAO projetoDao;
	
	@Autowired
	private ProjetoXTipoDAO projetoXtipoDao;
	
	@Autowired
	private AnteProjetoDAO anteProjetoDao;
	
	@Autowired
	private FaseDAO faseDao;
	
	//Abre view de cadastro
	@RequestMapping("/projetos/novo")
	public ModelAndView open() {
		
		ModelAndView model = new ModelAndView("projetos/novo");
		model.addObject("clientes", clienteDao.list());
		model.addObject("categorias", categoriaDao.list());
		model.addObject("tipos", tipoProjetoDao.list());
		model.addObject("enderecos", enderecoDao.list());
		model.addObject("estados", Estado.values());
		
		return model;
	}
	
	@Cacheable(value = "projetoList")
	@RequestMapping("/projetos/consulta")
	public ModelAndView list() {
		
		ModelAndView model = new ModelAndView();
		model.addObject("projetos", projetoDao.list());
		
		return model;
	}
	
	//Adiciona novo projeto
	@CacheEvict(value = "projetoList", allEntries = true)
	@RequestMapping(value = "/projetos/novo", method = RequestMethod.POST)
	public ModelAndView save(Projeto pProjeto,
							 @RequestParam String pEndereco,
							 @RequestParam String pCategoria,
							 @RequestParam String pTipoProjeto,
							 @RequestParam String pCliente,
							 RedirectAttributes redirectAttributes) {
		
		ModelAndView model = new ModelAndView("redirect:/projetos/novo");
		
		DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
		Calendar cal = Calendar.getInstance();
		Endereco lEndereco = null;
		Categoria lCategoria = null;
		TipoProjeto lTipoProjeto = null;
		Cliente lCliente = null;
		String[] lTipos = pTipoProjeto.split(",");
		
		
		if(!pCategoria.replace(",", "").equals("0")) {
			Long lIdCategoria = Long.parseLong(pCategoria.replace(",", ""));
			lCategoria = categoriaDao.getById(lIdCategoria);
			pProjeto.setCategoria(lCategoria);
		}
		
		projetoDao.saveProject(pProjeto);
		newAnteProjeto(pProjeto);
		
		if(!pCliente.replace(",", "").equals("0")) {
			Long lIdCliente = Long.parseLong(pCliente.replace(",", ""));
			lCliente = clienteDao.getById(lIdCliente);
			pProjeto.setCliente(lCliente);
			lCliente.addProjeto(pProjeto);
			clienteDao.saveClient(lCliente);
		}
		
		for (String idTipo : lTipos) {
			if(idTipo != null && !idTipo.trim().isEmpty()) {
				ProjetoXTipo lProjetoXTipo = new ProjetoXTipo();
				System.out.println(idTipo);
				Long lIdTipo = Long.parseLong(idTipo);
				lTipoProjeto = tipoProjetoDao.getById(lIdTipo);
				
				lProjetoXTipo.setProjeto(pProjeto);
				lProjetoXTipo.setTipo(lTipoProjeto);
				projetoXtipoDao.saveProjectXType(lProjetoXTipo);
			}
		}
		
		if(!pEndereco.replace(",",  "").equals("0")) {
			Long lIdEndereco = Long.parseLong(pEndereco.replace(",", ""));
			lEndereco = enderecoDao.getById(lIdEndereco);
			lEndereco.addProjeto(pProjeto);
			projetoDao.saveProject(pProjeto);
			enderecoDao.saveEndereco(lEndereco);
		}
		
		pProjeto.setDataCadastro(sdf.format(cal.getTime()));
		pProjeto.setStatus(StatusProjeto.Andamento);
		projetoDao.saveProject(pProjeto);
		redirectAttributes.addFlashAttribute("sucesso", "Projeto cadastrado com sucesso!");
		
		return model;
	}
	
	//Abre pagina de detalhes do projeto
	@RequestMapping("/projetos/detalhe/{id}")
	public ModelAndView details(@PathVariable("id") Long pId) {
		
		ModelAndView model = new ModelAndView("projetos/detalhe");
		Projeto lProjeto = projetoDao.getById(pId);
		AnteProjeto lAnteProjeto = anteProjetoDao.getByProjectId(pId);
		
		model.addObject("projeto", lProjeto);
		model.addObject("anteProjeto", lAnteProjeto);
		model.addObject("status", StatusProjeto.values());
		
		return model;
	}
	
	//Metodo que cria um novo anteProjeto com sua devias fases
	private void newAnteProjeto(Projeto pProjeto) {
		
		AnteProjeto lAnteProjeto = new AnteProjeto();
		lAnteProjeto.setProjeto(pProjeto);
		anteProjetoDao.save(lAnteProjeto);
		
		Fase lContrato = new Fase("Contrato");
		Fase lDocumento = new Fase("Documentos");
		Fase lLevantamento = new Fase("Levantamento Planialtimátrico");
		List<Fase> lFases = new ArrayList<>();
		
		lAnteProjeto.addFase(lContrato);
		lAnteProjeto.addFase(lDocumento);
		lAnteProjeto.addFase(lLevantamento);
		
		faseDao.saveFases(lFases);
		//anteProjetoDao.save(lAnteProjeto);
	}
	
}
