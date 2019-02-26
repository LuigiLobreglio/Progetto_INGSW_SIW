package controller;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
		
		

		if(String.valueOf(request.getParameter("tipo")).equals("byNome") ) {

			String[] nomeCommerciale=request.getParameter("nomeCommerciale").toString().split("\\s+");
			for(int i=0; i<nomeCommerciale.length;i++) {
				
				nomeCommerciale[i]=nomeCommerciale[i].replaceAll("'", "\\\\'");
			}

			ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();
			
			List<Prodotto> prodottiRicerca= prodottoDao.findByNomeCommerciale(nomeCommerciale);
			System.out.println(prodottiRicerca.size());
			request.getSession().setAttribute("prodotti", prodottiRicerca  );
			request.getSession().setAttribute("inizio", false);
			RequestDispatcher rd = request.getRequestDispatcher("gestioneRicerca/vistaProdotti.jsp");
			rd.forward(request, response);
			
		}
		
		else if(String.valueOf(request.getParameter("tipo")).equals("avanzata") ) {

			Long idProdotto;
			String categoria;
			String[] nomeCommerciale=null;
			int prezzoMin;
			int prezzoMax;

			//idProdotto
			if(request.getParameter("idProdotto").isEmpty()) { 
				
				idProdotto=null;
			}
			
			else 
				
				idProdotto=Long.parseLong(request.getParameter("idProdotto"));
	
			//categoria	
			if(String.valueOf(request.getParameter("categoria")).equals("Tutte le categorie")){
				categoria="null";
				
			}
			else
				
				categoria=request.getParameter("categoria");
			
			//nomeCommerciale		
			System.out.println(request.getParameter("nomeCommerciale").toString().isEmpty());

			nomeCommerciale=request.getParameter("nomeCommerciale").toString().split("\\s+");
			for(int i=0; i<nomeCommerciale.length;i++) {
				
				nomeCommerciale[i]=nomeCommerciale[i].replaceAll("'", "\\\\'");
			}
						System.out.println(nomeCommerciale[0].isEmpty());
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
			
			if(request.getParameter("idProdotto").isEmpty() && request.getParameter("categoria").toString().equals("Tutte le categorie") && nomeCommerciale[0].isEmpty() && request.getParameter("prezzoMin").isEmpty() && request.getParameter("prezzoMax").isEmpty()){
				
				request.getSession().setAttribute("prodotti", null);
				request.getSession().setAttribute("inizio", false);
				RequestDispatcher rd = request.getRequestDispatcher("gestioneRicerca/vistaProdotti.jsp");
				rd.forward(request, response);
			}
			else {
				
				ProdottoDao prodottoDao=SingletonDatabaseManager.getInstance().getDaoFactory().getProdottoDAO();
				
				List<Prodotto> prodottiRicercaAvanzata=prodottoDao.findByParametriAvanzati(idProdotto, categoria, nomeCommerciale, prezzoMin, prezzoMax);
			
				request.getSession().setAttribute("prodotti", prodottiRicercaAvanzata);
				request.getSession().setAttribute("inizio", false);
				RequestDispatcher rd = request.getRequestDispatcher("gestioneRicerca/vistaProdotti.jsp");
				rd.forward(request, response);
			}
			
		}
		
		else {
			
			request.getSession().setAttribute("inizio", null);
			response.sendRedirect(request.getContextPath()+"/gestioneRicerca/vistaProdotti.jsp");

		}
		

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
