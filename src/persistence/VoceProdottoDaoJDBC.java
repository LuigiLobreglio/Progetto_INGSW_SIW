package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.Prodotto;
import model.VoceProdotto;
import persistence.dao.VoceProdottoDao;

public class VoceProdottoDaoJDBC implements VoceProdottoDao {
	
	private DataSource dataSource;

	public VoceProdottoDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(VoceProdotto voceProdotto) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into VoceProdotto( quantita, idProd, idAccountProprietario, immagine, nomeCommerciale, prezzo) values (?,?,?,?,?,?)";
			
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setInt(1, voceProdotto.getQuantita());		
			statement.setLong(2, voceProdotto.getIdProd());
			statement.setLong(3, voceProdotto.getIdAccountProprietario());
			statement.setString(4, voceProdotto.getImmagine());
			statement.setString(5, voceProdotto.getNomeCommerciale());
			statement.setDouble(6, voceProdotto.getPrezzo());


				
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
	public List<VoceProdotto> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<VoceProdotto> findByIdAccountProprietario(Long idAccountProprietario) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		List<VoceProdotto> vociProdotto= new LinkedList<>();
		try {
			VoceProdotto voceProdotto;
			PreparedStatement statement;
			String query = "select * from voceProdotto where idAccountProprietario='"+idAccountProprietario+"'";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				voceProdotto = new VoceProdotto();
				voceProdotto.setQuantita(result.getInt("quantita"));
				voceProdotto.setIdProd(result.getLong("idProd"));
				voceProdotto.setIdAccountProprietario(result.getLong("idAccountProprietario"));	
				voceProdotto.setImmagine(result.getString("immagine"));	
				voceProdotto.setNomeCommerciale(result.getString("nomeCommerciale"));	
				voceProdotto.setPrezzo(result.getDouble("prezzo"));	
			
				vociProdotto.add(voceProdotto);
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
		
		return vociProdotto;
	}

	@Override
	public void update(Long idAccountProprietario, Long idProd, int quantita) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String update_query = " UPDATE mydb.voceProdotto SET quantita = '"+quantita+"'  WHERE (idProd = '"+idProd+"') AND (idAccountProprietario= '"+idAccountProprietario+"')";

			statement = connection.prepareStatement(update_query);
			statement.executeUpdate();
	
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

	@Override
	public void delete(Long idAccountProprietario, Long idProd) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String delete_query = " DELETE FROM mydb.voceProdotto  WHERE (idProd = '"+idProd+"') AND (idAccountProprietario= '"+idAccountProprietario+"')";

			statement = connection.prepareStatement(delete_query);
			statement.executeQuery();
	
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
