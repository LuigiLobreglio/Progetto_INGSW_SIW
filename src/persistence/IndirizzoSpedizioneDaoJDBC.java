package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import model.IndirizzoSpedizione;
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
			String insert = "insert into IndirizzoSpedizione( idAccountProprietario, stato, citta, codicePostale, via, numeroCivico, dettagli) values (?,?,?,?,?,?,?)";

			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, indirizzoSpedizione.getIdAccountProprietario());
			statement.setString(2, indirizzoSpedizione.getStato());
			statement.setString(3, indirizzoSpedizione.getCitta());
			statement.setString(4, indirizzoSpedizione.getCodicePostale());
			statement.setString(5, indirizzoSpedizione.getVia());
			statement.setString(6, indirizzoSpedizione.getNumeroCivico());
			statement.setString(7, indirizzoSpedizione.getDettagli());

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
	public List<IndirizzoSpedizione> findByIdIndirizzo(Long idIndirizzo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<IndirizzoSpedizione> findByIdAccountProprietario(Long idAccountProprietario) {
		// TODO Auto-generated method stub
		return null;
	}

	
}