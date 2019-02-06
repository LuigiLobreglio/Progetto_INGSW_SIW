package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Prodotto;
import persistence.SingletonDatabaseManager;
import persistence.dao.IndirizzoSpedizioneDao;
import persistence.dao.ProdottoDao;

/**
 * Servlet implementation class CambiaPrezzi
 */
@WebServlet("E-commerce/CambiaPrezzi")
public class CambiaPrezzi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CambiaPrezzi() {
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
		
		IndirizzoSpedizioneDao indirizzoDao = SingletonDatabaseManager.getInstance().getDaoFactory().getIndirizzoSpedizioneDAO();
		//ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();

		indirizzoDao.setCambiaIndirizzo();
		System.out.println("Ciao");
	}

}
