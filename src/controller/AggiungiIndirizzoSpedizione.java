package controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import model.IndirizzoSpedizione;
import persistence.SingletonDatabaseManager;
import persistence.dao.IndirizzoSpedizioneDao;

/**
 * Servlet implementation class AggiungiIndirizzoSpedizione
 */
@WebServlet("/aggiungiIndirizzo")
public class AggiungiIndirizzoSpedizione extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiungiIndirizzoSpedizione() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		System.out.println(request.getSession().getAttribute("idAccount").toString());
		System.out.println(request.getParameter("stato").toString());
		System.out.println(request.getParameter("citta").toString());
		IndirizzoSpedizione indirizzoSpedizione=new IndirizzoSpedizione(Long.parseLong(request.getSession().getAttribute("idAccount").toString()), request.getParameter("stato").toString(), request.getParameter("citta").toString(), request.getParameter("codicePostale").toString(), request.getParameter("via").toString(), request.getParameter("numeroCivico"), request.getParameter("dettagli").toString());
		 IndirizzoSpedizioneDao indirizzoSpedizioneDao= SingletonDatabaseManager.getInstance().getDaoFactory().getIndirizzoSpedizioneDAO();
		 indirizzoSpedizioneDao.save(indirizzoSpedizione);
		 request.getSession().setAttribute("aggiunta", true);
		 
			request.getRequestDispatcher("gestioneOrdine/checkout.jsp").forward(request, response);
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
