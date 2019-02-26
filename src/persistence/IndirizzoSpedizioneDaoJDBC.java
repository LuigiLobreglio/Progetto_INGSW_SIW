package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import model.IndirizzoSpedizione;
import model.Prodotto;
import model.VoceProdotto;
import persistence.dao.IndirizzoSpedizioneDao;

public class IndirizzoSpedizioneDaoJDBC implements IndirizzoSpedizioneDao {

	private DataSource dataSource;

	public IndirizzoSpedizioneDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(IndirizzoSpedizione indirizzoSpedizione) {
		// TODO Auto-generated method stub
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into IndirizzoSpedizione( idAccountProprietario, nomeDestinatario, cognomeDestinatario, stato, citta, codicePostale, via, numeroCivico, dettagli) values (?,?,?,?,?,?,?,?,?)";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong  (1, indirizzoSpedizione.getIdAccountProprietario());
			statement.setString(2, indirizzoSpedizione.getNomeDestinatario());
			statement.setString(3, indirizzoSpedizione.getCognomeDestinatario());
			statement.setString(4, indirizzoSpedizione.getStato());
			statement.setString(5, indirizzoSpedizione.getCitta());
			statement.setString(6, indirizzoSpedizione.getCodicePostale());
			statement.setString(7, indirizzoSpedizione.getVia());
			statement.setString(8, indirizzoSpedizione.getNumeroCivico());
			statement.setString(9, indirizzoSpedizione.getDettagli());


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
	public IndirizzoSpedizione findByIdIndirizzo(Long idIndirizzo) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		IndirizzoSpedizione indirizzoSpedizione= new IndirizzoSpedizione();
		try {
			PreparedStatement statement;
			String query = "select * from mydb.indirizzoSpedizione where idIndirizzo='"+idIndirizzo+"'";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				indirizzoSpedizione = new IndirizzoSpedizione();
				indirizzoSpedizione.setCodice(result.getLong("idIndirizzo"));
				indirizzoSpedizione.setIdAccountProprietario(result.getLong("idAccountProprietario"));
				indirizzoSpedizione.setNomeDestinatario(result.getString("nomeDestinatario"));
				indirizzoSpedizione.setCognomeDestinatario(result.getString("cognomeDestinatario"));
				indirizzoSpedizione.setStato(result.getString("stato"));
				indirizzoSpedizione.setCitta(result.getString("citta"));
				indirizzoSpedizione.setCodicePostale(result.getString("codicePostale"));
				indirizzoSpedizione.setVia(result.getString("via"));
				indirizzoSpedizione.setNumeroCivico(result.getString("numeroCivico"));
				indirizzoSpedizione.setDettagli(result.getString("dettagli"));			
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
		
		return indirizzoSpedizione;	
		
	}

	@Override
	public List<IndirizzoSpedizione> findByIdAccountProprietario(Long idAccountProprietario) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		List<IndirizzoSpedizione> indirizziSpedizione= new LinkedList<>();
		try {
			VoceProdotto voceProdotto;
			PreparedStatement statement;
			String query = "select * from indirizzoSpedizione where idAccountProprietario='"+idAccountProprietario+"' ";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				IndirizzoSpedizione indirizzoSpedizione = new IndirizzoSpedizione();
				indirizzoSpedizione.setCodice(result.getLong("idIndirizzo"));
				indirizzoSpedizione.setIdAccountProprietario(result.getLong("idAccountProprietario"));
				indirizzoSpedizione.setNomeDestinatario(result.getString("nomeDestinatario"));
				indirizzoSpedizione.setCognomeDestinatario(result.getString("cognomeDestinatario"));
				indirizzoSpedizione.setStato(result.getString("stato"));
				indirizzoSpedizione.setCitta(result.getString("citta"));
				indirizzoSpedizione.setCodicePostale(result.getString("codicePostale"));
				indirizzoSpedizione.setVia(result.getString("via"));
				indirizzoSpedizione.setNumeroCivico(result.getString("numeroCivico"));
				indirizzoSpedizione.setDettagli(result.getString("dettagli"));
		
			
				indirizziSpedizione.add(indirizzoSpedizione);
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

		return indirizziSpedizione;
	}

	@Override
	public void delete(Long idIndirizzo) {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String delete_query = " DELETE FROM mydb.indirizzoSpedizione  WHERE (idIndirizzo = '"+idIndirizzo+"') ";

			statement = connection.prepareStatement(delete_query);
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