package persistence;

import persistence.dao.AccountDao;
import persistence.dao.IndirizzoSpedizioneDao;
import persistence.dao.OrdineDao;
import persistence.dao.ProdottoDao;
import persistence.dao.VoceProdottoDao;

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
		return new AccountDaoJDBC(dataSource);
	}


	@Override
	public ProdottoDao getProdottoDAO() {
		// TODO Auto-generated method stub
		return new ProdottoDaoJDBC(dataSource);
	}	
	
	
	@Override
	public VoceProdottoDao getVoceProdottoDAO() {
		// TODO Auto-generated method stub
		return new VoceProdottoDaoJDBC(dataSource);
	}


	@Override
	public OrdineDao getOrdineDAO() {
		// TODO Auto-generated method stub
		return new OrdineDaoJDBC(dataSource);
	}


	@Override
	public IndirizzoSpedizioneDao getIndirizzoSpedizioneDAO() {
		// TODO Auto-generated method stub
		return new IndirizzoSpedizioneDaoJDBC(dataSource);
	}

}
