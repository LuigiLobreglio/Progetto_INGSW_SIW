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
	
		System.out.println("Servlet IscrizioneAccount.java");

		Account account= new Account();
		AccountDao accDao = SingletonDatabaseManager.getInstance().getDaoFactory().getAccountDAO();
		String idFacebook=String.valueOf(request.getParameter("idFacebook"));
		System.out.println(idFacebook);
		
			if(idFacebook!="null"){
				
				System.out.println("idFacebook non nullo, quindi iscrizione o accesso con Facebook");
				String idAccount;

				if( String.valueOf(accDao.findByIdFacebook(Long.parseUnsignedLong(idFacebook)))!="null") {
					System.out.println("idFacebook presente nel database, iscrizione effettuata precedentemente, quindi accesso");
				/*	response.setContentType("text/plain");
					response.setCharacterEncoding("UTF-8");
					out=response.getWriter();
					out.write(idAccount);
					out.close();
				*/
					idAccount=String.valueOf(accDao.findByIdFacebook(Long.parseUnsignedLong(idFacebook)));

				}
				
				else {
					
					System.out.println("idFacebook non presente nel database, iscrizione non effettuata precedentemente, quindi salvataggio");

					account.setNome(request.getParameter("nome"));
					account.setCognome(request.getParameter("cognome"));
					account.setIndirizzo_email(request.getParameter("indirizzo_Email"));	
					account.setPassword("facebook");
					account.setidFacebook(Long.parseUnsignedLong(idFacebook));
				
					accDao.save(account);
					
					idAccount=String.valueOf(accDao.findByIdFacebook(Long.parseUnsignedLong(idFacebook)));


					//request.getRequestDispatcher("/inviaCredenziali").forward(request, response);
				}
				
				request.getRequestDispatcher("/inviaCredenziali?id="+idAccount).forward(request, response);

			}
			else {
				
				System.out.println("idFacebook  nullo, quindi si tratta di iscrizione standard");

				account.setNome(request.getParameter("nome"));
				account.setCognome(request.getParameter("cognome"));
				account.setSesso(request.getParameter("sesso"));
				System.out.println("dataNascita");
				System.out.println(String.valueOf(request.getParameter("dataNascita")));
				account.setData_nascita(request.getParameter("dataNascita"));
				account.setIndirizzo_email(request.getParameter("email"));	
				account.setPassword(request.getParameter("password"));
		
				accDao.save(account);
			
				response.sendRedirect("/E-commerce/gestioneAccount/iscrizioneEffettuata.jsp");
			}

	}	

}
