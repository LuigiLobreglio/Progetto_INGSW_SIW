package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Ordine;
import model.VoceProdotto;
import persistence.SingletonDatabaseManager;
import persistence.dao.OrdineDao;
import persistence.dao.VoceProdottoDao;

/**
 * Servlet implementation class PreparaOrdine
 */
@WebServlet("/preparaOrdine")
public class PreparaOrdine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PreparaOrdine() {
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
		System.out.println(request.getParameter("totaleOrdine").toString());
		request.getSession().setAttribute("vociCarrello", vociCarrello);
		Ordine ordine= new Ordine(Long.parseLong(request.getSession().getAttribute("idAccount").toString()), 0.0, Double.parseDouble(request.getParameter("totaleOrdine").toString()), "In_corso");

		request.getSession().setAttribute("ordine", ordine);
		response.sendRedirect("gestioneOrdine/checkout.jsp");


		
		
	
	}

}
