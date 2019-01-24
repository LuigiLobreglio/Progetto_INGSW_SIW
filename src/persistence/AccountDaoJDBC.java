package persistence;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.GregorianCalendar;
import java.util.LinkedList;
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
			String insert = "insert into Account( nome, cognome, data_nascita, sesso, indirizzo_email, password) values (?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, account.getNome());
			statement.setString(2, account.getCognome());
			Date d= Date.valueOf(account.getData_nascita());
			statement.setDate(3, d);		
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

		Connection connection = this.dataSource.getConnection();
		List<Account> accounts = new LinkedList<>();
		try {
			Account account;
			PreparedStatement statement;
			String query = "select * from account";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				account = new Account();
				account.setNome(result.getString("nome"));				
				account.setCognome(result.getString("cognome"));
				account.setData_nascita(result.getDate("data_nascita").toString() );	
				account.setSesso(result.getString("sesso"));
				account.setIndirizzo_email(result.getString("indirizzo_email"));
				account.setPassword(result.getString("password"));
				
				accounts.add(account);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}	 finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		
		System.out.println(accounts.size());
		return accounts;
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
