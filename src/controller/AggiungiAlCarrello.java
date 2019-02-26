package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.VoceProdotto;
import persistence.SingletonDatabaseManager;
import persistence.dao.AccountDao;
import persistence.dao.VoceProdottoDao;

/**
 * Servlet implementation class AggiungiAlCarrello
 */
@WebServlet("/aggiungiAlCarrello")
public class AggiungiAlCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiAlCarrello() {
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
			
		if(request.getSession().getAttribute("idAccount")!=null){
			
			System.out.println(request.getParameter("idProd").toString());
			VoceProdotto voceProdotto=new VoceProdotto(Long.parseUnsignedLong(request.getParameter("idProd").toString()), Long.parseUnsignedLong(request.getSession().getAttribute("idAccount").toString()),1, request.getParameter("immagine").toString(), request.getParameter("nomeCommerciale").toString(), Double.parseDouble(request.getParameter("prezzo").toString()),false);
			VoceProdottoDao voceDao = SingletonDatabaseManager.getInstance().getDaoFactory().getVoceProdottoDAO();
			voceDao.save(voceProdotto);
			
			System.out.println("fino a qui tutto bene");
		
		
		request.getRequestDispatcher("/mostraCarrello").forward(request, response);


		}
	}

}
