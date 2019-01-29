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

import model.Account;
import persistence.SingletonDatabaseManager;
import persistence.dao.AccountDao;

/**
 * Servlet implementation class DisponibilitaEmail
 */
@WebServlet("/controlloStatoEmail")
public class DisponibilitaEmail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisponibilitaEmail() {
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
		String email=request.getParameter("id_email");
		Boolean disp=true;
		System.out.println("Prima di connettersi al database");
		
		AccountDao accountDao= SingletonDatabaseManager.getInstance().getDaoFactory().getAccountDAO();

		List<Account> accounts=accountDao.findAll();
		System.out.println("Dopo il recupero degli account");


		for (Account a : accounts) {
			if(a.getIndirizzoEmail().equals(email)) {
					
				disp=false;
				break;
			}
		}
		
		System.out.println("Dopo il controllo sulle email degli account");

		
		if(disp) {
			
			JSONObject emailControllata = new JSONObject();
			try {
				emailControllata.put("disponibile", new Boolean(true));				   
				String json = emailControllata.toString();
				System.out.println("Disponibile");
				out=response.getWriter();
				out.write(json);
				out.close();
				} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		
		else {
			
			JSONObject emailControllata = new JSONObject();
			try {
				emailControllata.put("disponibile", new Boolean(false));				   
				String json = emailControllata.toString();
				System.out.println("Non disponibile");
				out=response.getWriter();
				out.write(json);
				out.close();
				System.out.println("Dopo chiusura");

				
				} catch (JSONException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}

}
