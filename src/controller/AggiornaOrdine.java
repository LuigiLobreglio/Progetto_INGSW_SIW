package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.IndirizzoSpedizione;
import model.Ordine;
import persistence.SingletonDatabaseManager;
import persistence.dao.IndirizzoSpedizioneDao;
import persistence.dao.OrdineDao;

/**
 * Servlet implementation class AggiornaOrdine
 */
@WebServlet("/aggiornaOrdine")
public class AggiornaOrdine extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaOrdine() {
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
		
		System.out.println("Servlet: AggiornaOrdine");
		if(String.valueOf(request.getParameter("tipo")).equals("spedizione")) {
			
			Long idOrdine=(((Ordine) 	request.getSession().getAttribute("ordine")).getIdOrdine());
			System.out.println("Acquisito l'id dell'ordine da aggiornare");
			IndirizzoSpedizioneDao indirizzoSpedizioneDao= SingletonDatabaseManager.getInstance().getDaoFactory().getIndirizzoSpedizioneDAO();
			IndirizzoSpedizione indirizzoSpedizione=indirizzoSpedizioneDao.findByIdIndirizzo(Long.parseUnsignedLong(String.valueOf(request.getParameter("idIndirizzo"))));
			request.getSession().setAttribute("indirizzoScelto", indirizzoSpedizione);
			System.out.println("Acquisizione dell'oggetto indirizzoSpedizione, con id uguale al parametro passato, e settaggio dell'attributo indirizzoScelto, andati a buon fine");

			Gson gson = new Gson();
	        String jsonIndirizzoScelto = gson.toJson(indirizzoSpedizione);
	        System.out.println("jsonIndirizzioScelto = " + jsonIndirizzoScelto);	
	       
	        double spesaSpedizione;
	        StringBuilder str = new StringBuilder(jsonIndirizzoScelto);
			if(String.valueOf(indirizzoSpedizione.getStato()).equals("IT"))
			{ 
			
				spesaSpedizione=6.00;
		      // insert character value at offset 8
		      str.insert(jsonIndirizzoScelto.length()-1, ",\"spesaSpedizione\":\"6\"");
			}
			else {
				
				spesaSpedizione=12.00;
			      str.insert(jsonIndirizzoScelto.length()-1, ",\"spesaSpedizione\":\"12\"");
			}

			OrdineDao ordineDao=SingletonDatabaseManager.getInstance().getDaoFactory().getOrdineDAO();
			ordineDao.updateIndirizzoConsegna(Long.parseUnsignedLong(String.valueOf(request.getSession().getAttribute("idAccount"))), idOrdine, jsonIndirizzoScelto);
			System.out.println("Aggironamento dell'indirizzo di spedizione per l'ordine, andato a buon fine");


			ordineDao.updateSpesaSpedizione(Long.parseUnsignedLong(String.valueOf(request.getSession().getAttribute("idAccount"))), idOrdine, spesaSpedizione);	
			System.out.println(String.valueOf(str));

			response.getWriter().write(String.valueOf(str));

	          response.getWriter().close();

		}
	}

}
