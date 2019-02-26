package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.mysql.jdbc.Statement;

import model.Ordine;
import model.VoceProdotto;
import persistence.dao.OrdineDao;

public class OrdineDaoJDBC  implements OrdineDao{

	
	private DataSource dataSource;

	public OrdineDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}
	
	@Override
	public Long save(Ordine ordine) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into Ordine( idAccountProprietario, totaleOrdine, statoOrdine) values (?,?,?)";
			
			PreparedStatement statement = connection.prepareStatement(insert,new String[]{"Id"});

			statement.setLong(1, ordine.getIdAccountProprietario());		
			statement.setDouble(2, ordine.getTotaleOrdine());
			statement.setString(3, ordine.getStatoOrdine());
			
			System.out.println("Stampa di prova");
			statement.executeUpdate();
			
			 ResultSet rs = statement.getGeneratedKeys();
			    if(rs.next()) {
			    //In this exp, the autoKey val is in 1st col
			    return rs.getLong(1);
			    //now this's a real value of col Id
			    }
			
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return null;
	}

	@Override
	public List<Ordine> findAll() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<Ordine> findByIdAccountProprietario(Long idAccountProprietario) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		List<Ordine> ordini= new LinkedList<>();
		try {
			Ordine ordine;
			PreparedStatement statement;
			String query = "select * from Ordine where idAccountProprietario='"+idAccountProprietario+"'";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				ordine = new Ordine();
				ordine.setCodice(result.getLong("idOrdine"));
				ordine.setIdAccountProprietario(result.getLong("idAccountProprietario"));	
				ordine.setSpesaSpedizione(result.getDouble("spesaSpedizione"));	
				ordine.setTotaleOrdine(result.getDouble("totaleOrdine"));	
				ordine.setStatoOrdine(result.getString("statoOrdine"));	
				ordine.setDataEffettuazione(result.getDate("dataEffettuazione").toString());
			
				ordini.add(ordine);
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
		
		return ordini;
	
	}

	@Override
	public void updateStatoOrdine(Long idAccountProprietario, Long idOrdine, String statoOrdine) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String update_query = " UPDATE mydb.ordine SET statoOrdine = '"+statoOrdine+"'  WHERE (idAccountProprietario = '"+idAccountProprietario+"') AND (idOrdine= '"+idOrdine+"')";

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
	public void updateSpesaSpedizione(Long idAccountProprietario, Long idOrdine, double spesaSpedizione) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String update_query = " UPDATE mydb.ordine SET spesaSpedizione = '"+spesaSpedizione+"'  WHERE (idAccountProprietario = '"+idAccountProprietario+"') AND (idOrdine= '"+idOrdine+"')";

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
	public void updateIndirizzoConsegna(Long idAccountProprietario, Long idOrdine, String indirizzoSpedizione) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String update_query = " UPDATE mydb.ordine SET indirizzoSPedizione = '"+indirizzoSpedizione+"'  WHERE (idAccountProprietario = '"+idAccountProprietario+"') AND (idOrdine= '"+idOrdine+"')";

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

}
