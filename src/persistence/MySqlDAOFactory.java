package persistence;

import persistence.dao.AccountDao;
import persistence.dao.ProdottoDao;

class MySqlDAOFactory extends DAOFactory{

private static  DataSource dataSource;
	

	// --------------------------------------------

	static {
		try {
			System.out.println("Qui");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			dataSource=new DataSource("jdbc:mysql://localhost:3306/mydb","luigilob170001","IngswSiw19");
		
			System.out.println("Quo");

		} 
		catch (Exception e) {
			System.err.println("MySqlDAOFactory.class: failed to load MySQL JDBC driver\n"+e);
			e.printStackTrace();
		}
	}

	
	// --------------------------------------------
	
	
	@Override
	public AccountDao getAccountDAO() {
		// TODO Auto-generated method stub
		return new AccountDaoJDBC(dataSource);
	}


	@Override
	public ProdottoDao getProdottoDAO() {
		// TODO Auto-generated method stub
		return new ProdottoDaoJDBC(dataSource);
	}

}
