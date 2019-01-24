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
		System.out.println("1");
		
		AccountDao accountDao= SingletonDatabaseManager.getInstance().getDaoFactory().getAccountDAO();

		List<Account> accounts=accountDao.findAll();
			System.out.println("lkjhgfd");

		response.setContentType("text");
		JSONObject emailControllata= new JSONObject();
		boolean disp=true;
		for (Account a : accounts) {
			if(a.getIndirizzoEmail().equals(email)) {
				disp=false;
				break;
			}
		}

	      try {
			emailControllata.put("disponibile", disp);
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	        
	      String json = emailControllata.toString();
	      out=response.getWriter();
	      out.write(json);
	      out.close();

	}

}
