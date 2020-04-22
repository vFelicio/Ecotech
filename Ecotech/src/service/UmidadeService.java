package service;

import model.Umidade;
import dao.UmidadeDAO;


public class UmidadeService {
	UmidadeDAO dao = new UmidadeDAO();
	
	public int criar(Umidade umidade) {
		return dao.criar(umidade);
	}
	
	public void atualizar(Umidade umidade){
		dao.atualizar(umidade);
	}
	
	public void excluir(int id){
		dao.excluir(id);
	}
	
	public Umidade carregar(int id){
		return dao.carregar(id);
	}

}
