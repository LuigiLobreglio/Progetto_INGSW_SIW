package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import model.VoceProdotto;
import persistence.SingletonDatabaseManager;
import persistence.dao.VoceProdottoDao;

/**
 * Servlet implementation class AggiornaCarrello
 */
@WebServlet("/aggiornaCarrello")
public class AggiornaCarrello extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AggiornaCarrello() {
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
		if(request.getParameter("tipoAggiornamento").toString().equals("update")) {
		VoceProdottoDao voceDao = SingletonDatabaseManager.getInstance().getDaoFactory().getVoceProdottoDAO();
		voceDao.update(Long.parseLong(request.getSession().getAttribute("idAccount").toString()), Long.parseLong(request.getParameter("idProdotto").toString()), Integer.parseInt(request.getParameter("quantita").toString()));
		List<VoceProdotto> vociCarrello=voceDao.findByIdAccountProprietario(Long.parseLong(request.getSession().getAttribute("idAccount").toString()));
		request.getSession().setAttribute("vociCarrello", vociCarrello);
		JSONObject controlloAggiornamento = new JSONObject();
		try {
			controlloAggiornamento.put("stato", new Boolean(true));				   
			String json = controlloAggiornamento.toString();
			System.out.println("QUantità");
			PrintWriter out=response.getWriter();
			out.write(json);
			out.close();
			} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
		
		else if(request.getParameter("tipoAggiornamento").toString().equals("delete")) {
			
			VoceProdottoDao voceDao = SingletonDatabaseManager.getInstance().getDaoFactory().getVoceProdottoDAO();
			voceDao.delete(Long.parseLong(request.getSession().getAttribute("idAccount").toString()), Long.parseLong(request.getParameter("idProdotto").toString()));
			List<VoceProdotto> vociCarrello=voceDao.findByIdAccountProprietario(Long.parseLong(request.getSession().getAttribute("idAccount").toString()));
			request.getSession().setAttribute("vociCarrello", vociCarrello);
			JSONObject controlloAggiornamento = new JSONObject();
			try {
				controlloAggiornamento.put("stato", new Boolean(true));				   
				String json = controlloAggiornamento.toString();
				System.out.println("Eliminare");
				PrintWriter out=response.getWriter();
				out.write(json);
				out.close();
				} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	
		
		
	}


}
