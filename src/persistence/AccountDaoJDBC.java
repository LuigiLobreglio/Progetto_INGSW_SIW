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
			String insert = "insert into Account( nome, cognome, data_nascita, sesso, indirizzo_email, password, idFacebook) values (?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, account.getNome());
			statement.setString(2, account.getCognome());
			try{
				
				Date d= Date.valueOf(account.getData_nascita());
				statement.setDate(3, d);		

				
			}catch (IllegalArgumentException e) {
				statement.setDate(3, null);		
			}
			
			try{
			
				statement.setString(4, account.getSesso());

				
			}catch (NullPointerException e) {
				statement.setString(4, null);
			}

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
			statement.setLong(7, account.getidFacebook());

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
				account.setData_nascita(String.valueOf(result.getDate("data_nascita")) );	
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
		
		return accounts;
	}
	
	
	@Override
	public Account findByEmailKey(String email) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		Account account= new Account();

		try {
			PreparedStatement statement;
			String query = "select * from account where indirizzo_email='"+email+"' and idFacebook is null";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
				if (result.next()) {
					account.setCodice(result.getLong("idAccount"));				
					account.setNome(result.getString("nome"));				
					account.setCognome(result.getString("cognome"));
					account.setData_nascita(String.valueOf(result.getDate("data_nascita")) );	
					account.setSesso(result.getString("sesso"));
					account.setIndirizzo_email(result.getString("indirizzo_email"));
					account.setPassword(result.getString("password"));
				}
				else
				
					return null;			

		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}	 finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		
		
		return account;	

	}

	@Override
	public void update(Account account) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Account account) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Long findByIdFacebook(Long idFacebook) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		try {
			PreparedStatement statement;
			String query = "select idAccount from mydb.account where exists(select * from mydb.account as acc where account.idAccount=acc.idAccount and idFacebook='"+idFacebook+"')  ";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			if(result.next()) {
			
				System.out.println(String.valueOf("idAccount= "+result.getLong("idAccount")));
				return result.getLong("idAccount");
			}
			else 
				
				return null;
			
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		}	 finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		
		}


}
