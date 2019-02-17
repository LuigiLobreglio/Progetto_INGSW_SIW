package persistence.dao;

import java.util.List;

import model.Account;

public interface AccountDao {
	public void save(Account account);  // Create
	public Account findByPrimaryKey(int codice);     // Retrieve
	public Account findByEmailKey(String email);     // Retrieve
	public boolean findByIdFacebook(Long idFacebook); //Retrieve
	public List<Account> findAll();       
	public void update(Account account); //Update
	public void delete(Account account); //Delete	

}
