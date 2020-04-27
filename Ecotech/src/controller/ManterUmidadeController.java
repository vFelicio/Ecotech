package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Umidade;
import service.UmidadeService;

/**
 * Servlet implementation class ManterClienteController
 */
@WebServlet("/ManterUmidade.do")
public class ManterUmidadeController extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }
    
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        double pNivel = Double.parseDouble(request.getParameter("nivel"));
        

        
        //instanciar o javabean
        Umidade umidade = new Umidade();
        umidade.setNivel(pNivel);
       
        //instanciar o service
        UmidadeService cs = new UmidadeService();
        cs.criar(umidade);
        umidade = cs.carregar(umidade.getId());
        
        //enviar para o jsp
        request.setAttribute("umidade", umidade);
        
        RequestDispatcher view = 
        request.getRequestDispatcher("Umidade.jsp");
        view.forward(request, response);
        
    }
    
}
