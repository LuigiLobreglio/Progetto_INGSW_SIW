package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.VoceProdotto;
import persistence.SingletonDatabaseManager;
import persistence.dao.VoceProdottoDao;

/**
 * Servlet implementation class MostraCarrello
 */
@WebServlet("/mostraCarrello")
public class MostraCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MostraCarrello() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		VoceProdottoDao voceDao = SingletonDatabaseManager.getInstance().getDaoFactory().getVoceProdottoDAO();
		List<VoceProdotto> vociCarrello=voceDao.findByIdAccountProprietario(Long.parseLong(request.getSession().getAttribute("idAccount").toString()));
		System.out.println("dopo la ricerca");
		request.getSession().setAttribute("vociCarrello", vociCarrello);
		System.out.println("dopo attribuzione");
		response.sendRedirect("gestioneCarrello/vistaCarrello.jsp");
	}

}
