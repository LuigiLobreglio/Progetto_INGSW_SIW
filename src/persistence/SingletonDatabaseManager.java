package persistence;

public class SingletonDatabaseManager {
	private static SingletonDatabaseManager instance = null;
	
	public static SingletonDatabaseManager getInstance(){
		if (instance == null){
			instance = new SingletonDatabaseManager();
		}
		return instance;
	}
	
	private DAOFactory daoFactory;
		
	private SingletonDatabaseManager() {
		daoFactory = DAOFactory.getDAOFactory();
	}
	
	public DAOFactory getDaoFactory() {
		return daoFactory;
	}
	
	

}