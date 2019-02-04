package persistence;

import model.Account;
import model.Prodotto;
import persistence.dao.*;
import java.util.Date;
import java.util.GregorianCalendar;

import org.json.JSONObject;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			DataSource dataSource=new DataSource("jdbc:mysql://localhost:3306/mydb","luigilob170001","IngswSiw19");
	
		
		

	/*	AccountDao accountDao = new AccountDaoJDBC(dataSource);
		Account account1 = new Account("Luigi", "Lobreglio","1995-10-09", "m", "luigi.lobreglio@gmail.com", "IngswSiw19");
		accountDao.save(account1);
		*/
		Prodotto prodotto1=new Prodotto(Long.parseUnsignedLong("123456"),"Bevande","cocacola","WebContent/images/cocacola.jpeg","mela porto a scuola", 2);
		 
		JSONObject jsonProdotto1=new JSONObject(prodotto1);
		
		System.out.println(jsonProdotto1.toString());

		} 
		catch (Exception e) {
			System.err.println("MySqlDAOFactory.class: failed to load MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}

	}
	
}
