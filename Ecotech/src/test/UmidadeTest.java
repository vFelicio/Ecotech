package test;


import static org.junit.Assert.assertEquals;
import model.Umidade;

import org.junit.Before;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runners.MethodSorters;

import service.UmidadeService;

@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class UmidadeTest {
	Umidade umidade, copia;
	UmidadeService clienteService;
	static int id = 0;

	/*
	 * Antes de rodar este teste, certifique-se que nao ha no banco nenhuma
	 * linha com o id igual ao do escolhido para o to instanciado abaixo. Se
	 * houver, delete. 
	 * Certifique-se também que sobrecarregou o equals na classe
	 * Cliente. 
	 * Certifique-se que a fixture cliente1 foi criada no banco.
	 * Além disso, a ordem de execução dos testes é importante; por
	 * isso a anotação FixMethodOrder logo acima do nome desta classe
	 */
	@Before
	public void setUp() throws Exception {
		System.out.println("setup");
		umidade = new Umidade();
		umidade.setId(id);
		umidade.setNivel("Batista Cepelos");

		copia = new Umidade();
		copia.setId(id);
		copia.setNivel("Batista Cepelos");

		clienteService = new UmidadeService();
		System.out.println(umidade);
		System.out.println(copia);
		System.out.println(id);
	}
	
	@Test
	public void test00Carregar() {
		System.out.println("carregar");
		//para funcionar o cliente 1 deve ter sido carregado no banco por fora
		Umidade fixture = new Umidade();
		fixture.setId(1);
		fixture.setNivel("Carlos Drummond de Andrade");
		
		UmidadeService novoService = new UmidadeService();
		Umidade novo = novoService.carregar(1);
		assertEquals("testa inclusao", novo, fixture);
	}

	@Test
	public void test01Criar() {
		System.out.println("criar");
		id = clienteService.criar(umidade);
		System.out.println(id);
		copia.setId(id);
		assertEquals("testa criacao", umidade, copia);
	}

	@Test
	public void test02Atualizar() {
		System.out.println("atualizar");
     //		

	}

	@Test
	public void test03Excluir() {
		System.out.println("excluir");
		copia.setId(-1);
		copia.setNivel(null);
		clienteService.excluir(id);
		umidade = clienteService.carregar(id);
		assertEquals("testa exclusao", umidade, copia);
	}
}