package controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.List;

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
 * Servlet implementation class ControlloDatiAccesso
 */
@WebServlet("/inviaCredenziali")
public class ControlloDatiAccesso extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PrintWriter out;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ControlloDatiAccesso() {
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
	/*	
		String jsonReceived = "";

		BufferedReader reader = new BufferedReader(new InputStreamReader(request.getInputStream()));
		String line = reader.readLine();
		while (line != null) {
			jsonReceived = jsonReceived + line + "\n";
			line = reader.readLine();
		}
		System.out.println(jsonReceived);
		try {
			JSONObject json = new JSONObject(jsonReceived);
			String email=json.getString("indEmail"); 
			System.out.println(email);
	*/		
			AccountDao accDao = SingletonDatabaseManager.getInstance().getDaoFactory().getAccountDAO();
			Account account=accDao.findByEmailKey(request.getParameter("indEmail"));
			System.out.println("Dopo il recupero degli account");


				if(account!=null) {
					
					String password= request.getParameter("password");
					MessageDigest md;
						try {
							md = MessageDigest.getInstance("SHA-256");

							//Passing data to the created MessageDigest Object
							md.update(password.getBytes());
				      
							//Compute the message digest
							byte[] digest = md.digest();      
				     
							//Converting the byte array in to HexString format
							StringBuffer hexString = new StringBuffer();
				      
							for (int i = 0;i<digest.length;i++) {
								hexString.append(Integer.toHexString(0xFF & digest[i]));
							}	
							
							password=hexString.toString();
							System.out.println(password);
							System.out.println(account.getPassword());
							
							if(password.equals(account.getPassword()))
							{
								request.getSession().setAttribute("nome", account.getNome());
								request.getSession().setAttribute("idAccount", account.getidAccount());
								//JSONObject result= new JSONObject();
								/*try {
									result.put("descrizione", new String("loginOk"));				   
									String jsonurl = result.toString();
									out=response.getWriter();
									out.write(jsonurl);
									out.close();

									} catch (JSONException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								
								
				*/
								response.sendRedirect("/E-commerce/index.jsp");
							}
							
							else
							{
								request.getSession().setAttribute("nome", null);
								request.getSession().setAttribute("idAccount", null);
						/*		JSONObject result= new JSONObject();
								try {
									result.put("descrizione", new String("password_errata"));				   
									String jsonurl = result.toString();
									out=response.getWriter();
									out.write(jsonurl);
									out.close();

									} catch (JSONException e) {
									// TODO Auto-generated catch block
									e.printStackTrace();
								}
								*/
								request.getSession().setAttribute("errore", new String("password_errata"));
								response.sendRedirect("/E-commerce/gestioneAccount/accessoNegato.jsp");

				
							}
								
						} catch (NoSuchAlgorithmException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
						}
					
				}
				
				else {
					request.getSession().setAttribute("nome", null);
					request.getSession().setAttribute("idAccount", null);
			/*		JSONObject result= new JSONObject();
					try {
						result.put("descrizione", new String("password_errata"));				   
						String jsonurl = result.toString();
						out=response.getWriter();
						out.write(jsonurl);
						out.close();

						} catch (JSONException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					*/
					request.getSession().setAttribute("errore", new String("email_errata"));
					response.sendRedirect("/E-commerce/gestioneAccount/accessoNegato.jsp");
					
				}
/*			
		} catch (JSONException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	*/	
	}

}
