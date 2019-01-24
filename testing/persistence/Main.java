package persistence;

import model.Account;
import persistence.dao.*;
import java.util.Date;
import java.util.GregorianCalendar;

public class Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			DataSource dataSource=new DataSource("jdbc:mysql://localhost:3306/mydb","luigilob170001","IngswSiw19");
	
		
		

		AccountDao accountDao = new AccountDaoJDBC(dataSource);
		Account account1 = new Account("Luigi", "Lobreglio","1995-10-09", "m", "luigi.lobreglio@gmail.com", "IngswSiw19");
		accountDao.save(account1);
 

		} 
		catch (Exception e) {
			System.err.println("MySqlDAOFactory.class: failed to load MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}

	}
	
}
