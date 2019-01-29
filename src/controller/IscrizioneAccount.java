package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class IscrizioneAccount
 */
@WebServlet(asyncSupported = true, urlPatterns = { "/iscriviCliente" })
public class IscrizioneAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IscrizioneAccount() {
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
	/*	String jsonReceived = "";
		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String line = reader.readLine();
		while (line != null) {
			jsonReceived = jsonReceived + line + "\n";
			line = reader.readLine();
		}
		System.out.println(jsonReceived);
		*/
	//	try {
			//JSONObject json = new JSONObject(jsonReceived);
			Account account= new Account();
			account.setNome(request.getParameter("nome"));
			account.setCognome(request.getParameter("cognome"));
			account.setSesso(request.getParameter("sesso"));
			account.setData_nascita(request.getParameter("dataNascita"));
			account.setIndirizzo_email(request.getParameter("email"));	
			account.setPassword(request.getParameter("password"));
			
			System.out.println("olikujyht");
		
			AccountDao accDao = SingletonDatabaseManager.getInstance().getDaoFactory().getAccountDAO();
			accDao.save(account);
			response.sendRedirect("/E-commerce/gestioneAccount/iscrizioneEffettuata.jsp");

		/*	RequestDispatcher rd = request.getRequestDispatcher("/gestioneAccount/iscrizioneEffettuata.jsp");
			rd.forward(request, response);
		*/
			
			/*	
		 
			JSONObject iscrizioneControllo = new JSONObject();
			
				iscrizioneControllo.put("controllo", new Boolean(true));				   
				String result = iscrizioneControllo.toString();
				out=response.getWriter();
				out.write(result);
				out.close();			
			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}*/
	}	

}
