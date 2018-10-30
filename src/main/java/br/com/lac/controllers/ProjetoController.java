package br.com.lac.controllers;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.lac.dao.AnteProjetoDAO;
import br.com.lac.dao.CategoriaDAO;
import br.com.lac.dao.ClienteDAO;
import br.com.lac.dao.EnderecoDAO;
import br.com.lac.dao.FaseDAO;
import br.com.lac.dao.LogProjetoDAO;
import br.com.lac.dao.PreProjetoDAO;
import br.com.lac.dao.ProjetoDAO;
import br.com.lac.dao.ProjetoFinalDAO;
import br.com.lac.dao.ProjetoXTipoDAO;
import br.com.lac.dao.TipoProjetoDAO;
import br.com.lac.dao.UsuarioDAO;
import br.com.lac.models.AnteProjeto;
import br.com.lac.models.Categoria;
import br.com.lac.models.Cliente;
import br.com.lac.models.Endereco;
import br.com.lac.models.Estado;
import br.com.lac.models.Fase;
import br.com.lac.models.LogProjeto;
import br.com.lac.models.PreProjeto;
import br.com.lac.models.Projeto;
import br.com.lac.models.ProjetoFinal;
import br.com.lac.models.ProjetoXTipo;
import br.com.lac.models.StatusFaseProjeto;
import br.com.lac.models.StatusProjeto;
import br.com.lac.models.TipoProjeto;
import br.com.lac.models.Usuario;

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
	
	@Autowired
	private UsuarioDAO usuarioDao;
	
	@Autowired
	private PreProjetoDAO preProjetoDao;
	
	@Autowired
	private ProjetoFinalDAO projetoFinalDao;
	
	@Autowired
	private LogProjetoDAO logProjetoDao;
	
	private DateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
	private Calendar cal = Calendar.getInstance();
	
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
		
		if(projetoDao.list().size() > 0) {
			for (Projeto lProjeto : projetoDao.list()) {
				
				Long lValidos = projetoDao.countAplicableFases(lProjeto.getIdProjeto());
				Long lConcluidos = projetoDao.countFinishedProject(lProjeto.getIdProjeto());
				Double lProgresso = (lConcluidos.doubleValue() / lValidos.doubleValue()) * 100;
				
				lProjeto.setProgresso(String.format("%,.2f", lProgresso));
				if(lProgresso >= 100) {
					lProjeto.setStatus(StatusProjeto.Concluido);
					lProjeto.setDataConclusao(sdf.format(cal.getTime()));
				}
					
			}
		}
		
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
		newPreProjeto(pProjeto);
		newAnteProjeto(pProjeto);
		newProjetoFinal(pProjeto);
		
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
	public ModelAndView details(@PathVariable("id") Long pId, Authentication pAuth) {
		
		ModelAndView model = new ModelAndView("projetos/detalhe");
		Projeto lProjeto = projetoDao.getById(pId);
		List<String> lTipos = projetoDao.getProjectTypesByProjectId(pId);
		AnteProjeto lAnteProjeto = anteProjetoDao.getByProjectId(pId);
		PreProjeto lPreProjeto = preProjetoDao.getByProjectId(pId);
		List<ProjetoFinal> lProjetoFinal = projetoFinalDao.getByProjectId(pId);
		List<Fase> lFasesAnteProjeto = faseDao.getFasesByAnteProjeto(lAnteProjeto.getIdAnteProjeto());
		List<Fase> lFasesPreProjeto = faseDao.getFasesByPreProjeto(lPreProjeto.getIdPreProjeto());
		List<Fase> lFasesProjetoFinal1 = null;
		List<Fase> lFasesProjetoFinal2 = null;
		
		if(lProjetoFinal.size() > 1) {
			lFasesProjetoFinal1 = faseDao.getFasesByProjetoFinal(lProjetoFinal.get(0).getIdProjetoFinal());
			lFasesProjetoFinal2 = faseDao.getFasesByProjetoFinal(lProjetoFinal.get(1).getIdProjetoFinal());
		}
		
		model.addObject("usuarioLogado", usuarioDao.findUsuarioByEmail(pAuth.getName()));
		model.addObject("projeto", lProjeto);
		model.addObject("tiposProjeto", lTipos);
		model.addObject("fasesAnteProjeto", lFasesAnteProjeto);
		model.addObject("fasesPreProjeto", lFasesPreProjeto);
		model.addObject("fasesProjetoFinal1", lFasesProjetoFinal1);
		model.addObject("fasesProjetoFinal2", lFasesProjetoFinal2);
		model.addObject("status", StatusProjeto.values());
		model.addObject("statusFase", StatusFaseProjeto.values());
		
		return model;
	}
	
	//Metodo que cria um novo anteProjeto com sua devias fases
	private void newAnteProjeto(Projeto pProjeto) {
		
		AnteProjeto lAnteProjeto = new AnteProjeto();
		lAnteProjeto.setProjeto(pProjeto);
		anteProjetoDao.save(lAnteProjeto);
		
		Fase lPlanta = new Fase("Planta humanizada");
		Fase lModelo = new Fase("Modelo 3D");
		Fase lRender = new Fase("Render");
		Fase lAprovacaoCliente = new Fase("Aprovação do cliente");
		Fase lAprovacaoPrefeitura = new Fase("Aprovação de prefeitura");
		Fase lAprovacaoCondominio = new Fase("Aprovação do condomínio");
		List<Fase> lFases = new ArrayList<>();
		
		lAnteProjeto.addFase(lPlanta);
		lAnteProjeto.addFase(lModelo);
		lAnteProjeto.addFase(lRender);
		lAnteProjeto.addFase(lAprovacaoCliente);
		lAnteProjeto.addFase(lAprovacaoPrefeitura);
		lAnteProjeto.addFase(lAprovacaoCondominio);
		
		faseDao.saveFases(lFases);
	}
	
	//Metodo que cria um novo preProjeto com sua devias fases
	private void newPreProjeto(Projeto pProjeto) {
		
		PreProjeto lPreProjeto = new PreProjeto();
		lPreProjeto.setProjeto(pProjeto);
		preProjetoDao.save(lPreProjeto);
		
		Fase lContrato = new Fase("Contrato");
		Fase lDocumento = new Fase("Documentos");
		Fase lLevantamento = new Fase("Levantamento Planialtimátrico");
		List<Fase> lFases = new ArrayList<>();
		
		lPreProjeto.addFase(lContrato);
		lPreProjeto.addFase(lDocumento);
		lPreProjeto.addFase(lLevantamento);
		
		faseDao.saveFases(lFases);
	}
	
	//Metodo que cria um novo preProjeto com sua devias fases
	private void newProjetoFinal(Projeto pProjeto) {
		
		ProjetoFinal lProjetoFinal1 = new ProjetoFinal();
		ProjetoFinal lProjetoFinal2 = new ProjetoFinal();
		lProjetoFinal1.setProjeto(pProjeto);
		lProjetoFinal2.setProjeto(pProjeto);
		projetoFinalDao.save(lProjetoFinal1);
		projetoFinalDao.save(lProjetoFinal2);
		
		Fase lImplantacao = new Fase("Implantação");
		Fase lConst = new Fase("Planta de à construir / a demolir");
		Fase lExecutiva = new Fase("Planta executiva");
		Fase lCobertura = new Fase("Planta de cobertura");
		Fase lCortes = new Fase("Cortes");
		Fase lElevacoes = new Fase("Elevações");
		Fase lHidraulica = new Fase("Projeto de hidráulica");
		Fase lEletrica = new Fase("Projeto de elétrica");
		Fase lCircuitos = new Fase("Circuitos de iluminação");
		Fase lGesso = new Fase("Planta de gesso");
		Fase lPisos = new Fase("Planta de paginação de pisos");
		Fase lParedes = new Fase("Paginação de paredes");
		Fase lPintura = new Fase("Planta de pintura e revestimento");
		Fase lMoveis = new Fase("Detalhamento de móveis");
		Fase lBook = new Fase("Book");
		List<Fase> lFases = new ArrayList<>();
		
		
		lProjetoFinal1.addFase(lImplantacao);
		lProjetoFinal1.addFase(lConst);
		lProjetoFinal1.addFase(lExecutiva);
		lProjetoFinal1.addFase(lCobertura);
		lProjetoFinal1.addFase(lCortes);
		lProjetoFinal1.addFase(lElevacoes);
		lProjetoFinal1.addFase(lHidraulica);
		lProjetoFinal1.addFase(lEletrica);
		lProjetoFinal2.addFase(lCircuitos);
		lProjetoFinal2.addFase(lGesso);
		lProjetoFinal2.addFase(lPisos);
		lProjetoFinal2.addFase(lParedes);
		lProjetoFinal2.addFase(lPintura);
		lProjetoFinal2.addFase(lMoveis);
		lProjetoFinal2.addFase(lBook);
		
		faseDao.saveFases(lFases);
	}
	
	@CacheEvict(value = "projetoList", allEntries = true)
	@RequestMapping(value = "/projetos/saveStatus" , method = RequestMethod.POST)
	public @ResponseBody Fase saveStatus(@RequestBody Fase pFaseJson, Authentication pAuth) {

		if(pFaseJson != null) {
			Projeto lProjeto = projetoDao.getById(projetoDao.getProjectByFaseId(pFaseJson.getIdFase()));
			Usuario lUsuario = usuarioDao.findUsuarioByEmail(pAuth.getName());
			String lAntes = faseDao.getFaseById(pFaseJson.getIdFase()).toString();
			faseDao.alterStatus(pFaseJson, lUsuario);
			String lDepois = faseDao.getFaseById(pFaseJson.getIdFase()).toString();
			gravaLog(lProjeto, pAuth, "Alteração de Fase", lAntes, lDepois);
		}
			
		return pFaseJson;
	}
	
	@CacheEvict(value = "projetoList", allEntries = true)
	@RequestMapping(value = "/projetos/savePrazo" , method = RequestMethod.POST)
	public @ResponseBody Fase savePrazo(@RequestBody Fase pFaseJson, Authentication pAuth) {
		
		if(pFaseJson != null) {
			Projeto lProjeto = projetoDao.getById(projetoDao.getProjectByFaseId(pFaseJson.getIdFase()));
			Usuario lUsuario = usuarioDao.findUsuarioByEmail(pAuth.getName());
			String lAntes = faseDao.getFaseById(pFaseJson.getIdFase()).toString();
			faseDao.alterPrazo(pFaseJson, lUsuario);
			String lDepois = faseDao.getFaseById(pFaseJson.getIdFase()).toString();
			gravaLog(lProjeto, pAuth, "Alteração de Fase", lAntes, lDepois);
		}
			
		return pFaseJson;
	}
	
	
	public void gravaLog(Projeto pProjeto, Authentication pAuth, String pTransacao, String pAntes, String pDepois) {
		
		LogProjeto lLogProjeto = new LogProjeto();
		lLogProjeto.setProjeto(pProjeto);
		lLogProjeto.setTransacao(pTransacao);
		lLogProjeto.setData(sdf.format(cal.getTime()));
		lLogProjeto.setUsuario(usuarioDao.findUsuarioByEmail(pAuth.getName()));
		lLogProjeto.setAntes(pAntes);
		lLogProjeto.setDepois(pDepois);
		logProjetoDao.gravar(lLogProjeto);
	}
	
	@RequestMapping(value = "/projetos/getJson" , method = RequestMethod.POST)
	public @ResponseBody Projeto getJson(@RequestBody Projeto pProjetoJson) {
		
		return projetoDao.getById(pProjetoJson.getIdProjeto());
	}
	
}
