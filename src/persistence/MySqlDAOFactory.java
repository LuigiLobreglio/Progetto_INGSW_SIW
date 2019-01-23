package persistence;

import persistence.dao.AccountDao;

class MySqlDAOFactory extends DAOFactory{

private static  DataSource dataSource;
	

	// --------------------------------------------

	static {
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			dataSource=new DataSource("jdbc:mysql://localhost:3306/mydb","luigilob170001","IngswSiw19");
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
		return null;
	}

}
