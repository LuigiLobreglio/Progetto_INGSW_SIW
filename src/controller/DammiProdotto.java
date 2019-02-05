package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import persistence.SingletonDatabaseManager;
import persistence.dao.ProdottoDao;

/**
 * Servlet implementation class DammiProdotto
 */
@WebServlet("/visualizzaProdotto")
public class DammiProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DammiProdotto() {
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
		
		
		ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();
		
		Prodotto prodottoRicerca= prodottoDao.findByPrimaryKey(Long.parseLong(request.getParameter("idProdotto").toString()));
		request.getSession().setAttribute("prodotto", prodottoRicerca  );
		request.getSession().setAttribute("inizio", true);
		response.sendRedirect("/E-commerce/gestioneRicerca/vistaDettagliProdotto.jsp");

	}

}
