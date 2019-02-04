package controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.google.gson.Gson;

import persistence.SingletonDatabaseManager;
import persistence.dao.ProdottoDao;

import model.Prodotto;


/**
 * Servlet implementation class RicercaProdotto
 */
@WebServlet("/RicercaProdotto")
public class RicercaProdotto extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RicercaProdotto() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		if(request.getParameter("tipo").toString()=="byNome") {

			String[] nomeCommerciale=request.getParameter("nomeCommerciale").toString().split("\\s+");
			for(int i=0; i<nomeCommerciale.length;i++) {
				
				nomeCommerciale[i].replaceAll("'", "\\\\'");
			}

			ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();
			
			List<Prodotto> prodottiRicerca= prodottoDao.findByNomeCommerciale(nomeCommerciale);
			
			request.setAttribute("prodotti", prodottiRicerca  );
			RequestDispatcher rd = request.getRequestDispatcher("vistaProdotti.jsp");
			rd.forward(request, response);
			
		}
		
		Long idProdotto;
		String categoria;
		String nomeCommerciale;
		int prezzoMin;
		int prezzoMax;
		


		//idProdotto
		if(request.getParameter("idProdotto").isEmpty()) {
			
			idProdotto=null;
		}
		
		else
			
			idProdotto=Long.parseLong(request.getParameter("idProdotto"));
		
		
		categoria=request.getParameter("categoria");
		nomeCommerciale=request.getParameter("nomeCommerciale");
		
		//prezzomin		
		if(request.getParameter("prezzoMin").isEmpty()) 
			
			prezzoMin=0;
		
		else
			
			prezzoMin=Integer.parseInt(request.getParameter("prezzoMin"));
		
		
		//prezzoMax
		if(request.getParameter("prezzoMax").isEmpty()) 
			
			prezzoMax=Integer.MAX_VALUE;
		
		else
			
			prezzoMax=Integer.parseInt(request.getParameter("prezzoMax"));
		
		
		ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();
		
	//	List<Prodotto> prodottoRicercaAvanzata=prodottoDao.findByParametriAvanzati(idProdotto, categoria, nomeCommerciale, prezzoMin, prezzoMax);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Prima del controllo del tipo");
		System.out.println(request.getParameter("tipo").toString());

		if( request.getParameter("tipo").toString().equals("live")) {
			
			System.out.println("Sono nell'if");

			ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();
			String[] liveKeys=request.getParameter("liveKey").toString().split("\\s+");
			System.out.println(request.getParameter("liveKey").replaceFirst("\\s++$", ""));
			System.out.println(request.getParameter("liveKey").replaceFirst("\\s++$", "").replaceAll("'", "\\\\'"));

			List<String> risultatiLive=prodottoDao.findByStringaRicercaLive(request.getParameter("liveKey").replaceFirst("\\s++$", "").replaceAll("'", "\\\\'"));
			
			System.out.println("Sono andato nel database");

			
			
			        	List<String> sorted = risultatiLive.stream()
	        	        .sorted((s1, s2) -> s1.length() - s2.length())
	        	        .collect(Collectors.toList());
			 
			System.out.println(sorted);
			
            Gson gson = new Gson();
            String jsonNames = gson.toJson(sorted);
            System.out.println("jsonNames = " + jsonNames);
            
        	response.getWriter().println(jsonNames);
			
		}
	}

}
