package persistence;

import persistence.dao.AccountDao;
import persistence.dao.ProdottoDao;

public abstract class DAOFactory {
	
	// --- Metodo fabbrica per la creazione di fabbriche concrete ---
	
	public static DAOFactory getDAOFactory() {
		
			return new MySqlDAOFactory();
	}
	
	// --- Le fabbriche concrete ereditano e implementano i seguenti metodi astratti ---
	
	/**
	 * Metodi per accedere ai dati degli oggetti dell'applicazione
	 */
	public abstract AccountDao getAccountDAO();
	public abstract ProdottoDao getProdottoDAO();

}
