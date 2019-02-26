package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import org.json.JSONException;
import org.json.JSONObject;

import com.google.gson.Gson;

import model.IndirizzoSpedizione;
import persistence.SingletonDatabaseManager;
import persistence.dao.IndirizzoSpedizioneDao;

/**
 * Servlet implementation class AggiungiIndirizzoSpedizione
 */
@WebServlet("/aggiungiIndirizzo")
public class AggiornaIndirizzi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaIndirizzi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Servlet: AggiornaIndirizzi");
		IndirizzoSpedizioneDao indirizzoSpedizioneDao= SingletonDatabaseManager.getInstance().getDaoFactory().getIndirizzoSpedizioneDAO();

		if(String.valueOf(request.getParameter("tipo")).equals("aggiunta")){
			
			System.out.println("Si tratta di una aggiunta");

		

		System.out.println(request.getSession().getAttribute("idAccount").toString());
		System.out.println(request.getParameter("stato").toString());
		System.out.println(request.getParameter("citta").toString());
		String dettagli;

		if(String.valueOf(request.getParameter("dettagli")).isEmpty())
			dettagli="Nessuna";
		else 
			dettagli=String.valueOf(request.getParameter("dettagli"));
		IndirizzoSpedizione indirizzoSpedizione=new IndirizzoSpedizione(Long.parseLong(request.getSession().getAttribute("idAccount").toString()), request.getParameter("nomeDestinatario").toString(),request.getParameter("cognomeDestinatario").toString(),request.getParameter("stato").toString(), request.getParameter("citta").toString(), request.getParameter("codicePostale").toString(), request.getParameter("via").toString(), request.getParameter("numeroCivico"), dettagli);
		 indirizzoSpedizioneDao.save(indirizzoSpedizione);
		 
		 System.out.println("Indirizzo aggiunto con successo");

		 List<IndirizzoSpedizione> indirizziSpedizione=indirizzoSpedizioneDao.findByIdAccountProprietario(Long.parseUnsignedLong(String.valueOf(request.getSession().getAttribute("idAccount"))));
		 request.getSession().setAttribute("indirizzi", indirizziSpedizione);
		 
		 System.out.println("attributo di Sessione 'indirizzi' aggiornato con successo");

		  Gson gson = new Gson();
          String jsonIndirizzi = gson.toJson(indirizziSpedizione);
          System.out.println("jsonIndirizzi = " + jsonIndirizzi);		 
          response.getWriter().write(jsonIndirizzi);
          response.getWriter().close();
			//request.getRequestDispatcher("gestioneOrdine/checkout.jsp").forward(request, response);
		}
		
		else if(String.valueOf(request.getParameter("tipo")).equals("rimozione")) {
			System.out.println("Si tratta di una rimozione");
			indirizzoSpedizioneDao.delete(Long.parseUnsignedLong(String.valueOf(request.getParameter("idIndirizzo"))));
			 System.out.println("Indirizzo rimosso con successo");
			 
			 List<IndirizzoSpedizione> indirizziSpedizione=indirizzoSpedizioneDao.findByIdAccountProprietario(Long.parseUnsignedLong(String.valueOf(request.getSession().getAttribute("idAccount"))));
			 request.getSession().setAttribute("indirizzi", indirizziSpedizione);
			 
			 System.out.println("attributo di Sessione 'indirizzi' aggiornato con successo");

			  Gson gson = new Gson();
	          String jsonIndirizzi = gson.toJson(indirizziSpedizione);
	          System.out.println("jsonIndirizzi = " + jsonIndirizzi);		 
	          response.getWriter().write(jsonIndirizzi);
	          response.getWriter().close();

			
		}
}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
