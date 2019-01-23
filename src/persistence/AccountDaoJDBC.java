package persistence;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import model.Account;
import persistence.dao.AccountDao;

public class AccountDaoJDBC implements AccountDao {
	
	private DataSource dataSource;

	public AccountDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Account account) {
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into Account( nome, cognome, età, sesso, indirizzo_email, password) values (?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, account.getNome());
			statement.setString(2, account.getCognome());
			statement.setInt(3, account.getEtà());
			statement.setString(4, account.getSesso());
			statement.setString(5, account.getIndirizzoEmail());
			
			//Creating the MessageDigest object  
		    MessageDigest md;
				try {
					md = MessageDigest.getInstance("SHA-256");

					//Passing data to the created MessageDigest Object
					md.update(account.getPassword().getBytes());
		      
					//Compute the message digest
					byte[] digest = md.digest();      
		     
					//Converting the byte array in to HexString format
					StringBuffer hexString = new StringBuffer();
		      
						for (int i = 0;i<digest.length;i++) {
							hexString.append(Integer.toHexString(0xFF & digest[i]));
						}	
						
					statement.setString(6, hexString.toString());
	
				} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				}
				
			statement.executeUpdate();
			
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}


	@Override
	public Account findByPrimaryKey(int codice) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Account> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void update(Account account) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Account account) {
		// TODO Auto-generated method stub
		
	}

}
