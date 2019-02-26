package persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.text.DecimalFormatSymbols;
import java.text.NumberFormat;
import java.util.LinkedList;
import java.util.List;
import java.util.Locale;

import model.Prodotto;
import persistence.dao.ProdottoDao;

public class ProdottoDaoJDBC implements ProdottoDao {
	
	private DataSource dataSource;

	public ProdottoDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Prodotto prodotto){
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into Prodotto( idProdotto, categoria, nomeCommerciale, immagine, descrizione, prezzo) values (?,?,?,?,?,?)";
			
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, prodotto.getIdProdotto());
			statement.setString(2, prodotto.getCategoria());
			statement.setString(3, prodotto.getNomeCommerciale());		
			statement.setString(4, prodotto.getImmagine());
			statement.setString(5, prodotto.getDescrizione());
			statement.setDouble(6, prodotto.getPrezzo());
				
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
	public List<Prodotto> findAll() {
		// TODO Auto-generated method stub

		Connection connection = this.dataSource.getConnection();
		List<Prodotto> prodotti= new LinkedList<>();
		try {
			Prodotto prodotto;
			PreparedStatement statement;
			String query = "select * from prodotto";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				prodotto = new Prodotto();
				prodotto.setIdProdotto(result.getLong("idProdotto"));
				prodotto.setCategoria(result.getString("sesso"));
				prodotto.setNomeCommerciale(result.getString("nomeCommerciale"));
				prodotto.setImmagine(result.getString("immagine"));
				prodotto.setDescrizione(result.getString("descrizione"));	
				prodotto.setPrezzo(result.getDouble("prezzo"));				
			
				prodotti.add(prodotto);
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
		
		return prodotti;
	}


	@Override
	public Prodotto findByPrimaryKey(Long idProdotto) {
		Connection connection = this.dataSource.getConnection();
		Prodotto prodotto= new Prodotto();
		try {
			PreparedStatement statement;
			String query = "select * from prodotto where idProdotto='"+idProdotto+"'";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				prodotto = new Prodotto();
				prodotto.setIdProdotto(result.getLong("idProdotto"));
				prodotto.setCategoria(result.getString("categoria"));
				prodotto.setNomeCommerciale(result.getString("nomeCommerciale"));
				prodotto.setImmagine(result.getString("immagine"));
				prodotto.setDescrizione(result.getString("descrizione"));
				prodotto.setPrezzo(result.getDouble("prezzo"));							
				
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
		
		return prodotto;
	}

	
	@Override
	public List<Prodotto> findByCategoria(String categoria) {

		// TODO Auto-generated method stub

		Connection connection = this.dataSource.getConnection();
		List<Prodotto> prodotti= new LinkedList<>();
		try {
			Prodotto prodotto;
			PreparedStatement statement;
			String query = "select * from prodotto where categoria='"+categoria+"'";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				prodotto = new Prodotto();
				prodotto.setIdProdotto(result.getLong("idProdotto"));
				prodotto.setCategoria(result.getString("categoria"));
				prodotto.setNomeCommerciale(result.getString("nomeCommerciale"));
				prodotto.setImmagine(result.getString("immagine"));
				prodotto.setDescrizione(result.getString("descrizione"));	
				prodotto.setPrezzo(result.getDouble("prezzo"));							
						
				prodotti.add(prodotto);
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
		
		return prodotti;
	}

	
	@Override
	public List<String> findByStringaRicercaLive(String stringaRicerca) {
		// TODO Auto-generated method stub

		Connection connection = this.dataSource.getConnection();
		List<String> risultati= new LinkedList<>();
		try {
			PreparedStatement statement;
			String query = "select nomeCommerciale from prodotto where LOWER(nomeCommerciale) regexp  LOWER('.*\\\\s"+stringaRicerca+".*|^"+stringaRicerca+".*')";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				
				risultati.add(result.getString("nomeCommerciale"));
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
		
		
		return risultati;
	}


	@Override
	public List<Prodotto> findByNomeCommerciale(String[] nomeCommerciale) {
		// TODO Auto-generated method stub

		Connection connection = this.dataSource.getConnection();
		List<Prodotto> prodotti= new LinkedList<>();
		try {
			Prodotto prodotto;
			PreparedStatement statement;
			String query = "select distinct * from prodotto where ";
			for(int i=0; i<nomeCommerciale.length;i++) {
				
				query=query+"LOWER(nomeCommerciale) regexp LOWER('^"+nomeCommerciale[i]+"$|.*\\\\s"+nomeCommerciale[i]+"\\\\s.*|^"+nomeCommerciale[i]+"\\\\s.*|.*\\\\s"+nomeCommerciale[i]+"$') AND ";
			}
			query= query.substring(0, query.length() - 4);

			System.out.println(query);
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				prodotto = new Prodotto();
				prodotto.setIdProdotto(result.getLong("idProdotto"));
				prodotto.setCategoria(result.getString("categoria"));
				prodotto.setNomeCommerciale(result.getString("nomeCommerciale"));
				prodotto.setImmagine(result.getString("immagine"));
				prodotto.setDescrizione(result.getString("descrizione"));	
				prodotto.setPrezzo(result.getDouble("prezzo"));							
						
				prodotti.add(prodotto);
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
		
		return prodotti;
	}


	@Override
	public List<Prodotto> findByParametriAvanzati(Long idProdotto, String categoria, String[] nomeCommerciale, int prezzo_min, int prezzo_max){
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();
		List<Prodotto> prodotti= new LinkedList<>();
		try {
			Prodotto prodotto;
			PreparedStatement statement;
			String query = "select distinct * from prodotto where ";
			String query_id="";
			if(idProdotto!=null){
				
				query_id="idProdotto='"+idProdotto+"' ";
	
			
			}
			String query_cat=" ";
			if(!categoria.equals("null")){
				if(idProdotto!=null)
					query_cat=" AND ";
					
				query_cat=query_cat+"categoria='"+categoria+"' ";
			}
			
			String query_nome=" ";
			if(!(nomeCommerciale[0].isEmpty())){
				if(idProdotto!=null || !categoria.equals("null"))
					query_nome=" AND ";
					
					for(int i=0; i<nomeCommerciale.length;i++) {
					
						query_nome=query_nome+"LOWER(nomeCommerciale) regexp LOWER('^"+nomeCommerciale[i]+"$|.*\\\\s"+nomeCommerciale[i]+"\\\\s.*|^"+nomeCommerciale[i]+"\\\\s.*|.*\\\\s"+nomeCommerciale[i]+"$') AND ";
					}
					
					query_nome= query_nome.substring(0, query_nome.length() - 4);
			}
			
			String query_prezzo_min=" ";
			if(prezzo_min!=0){
				if(idProdotto!=null ||  !categoria.equals("null") || !(nomeCommerciale[0].isEmpty()))
					query_prezzo_min=" AND ";
					
				query_prezzo_min=query_prezzo_min+"prezzo>="+prezzo_min+" ";
			}

			String query_prezzo_max=" ";
			if(prezzo_max!=Integer.MAX_VALUE){
				if(idProdotto!=null || !categoria.equals("null") || !(nomeCommerciale[0].isEmpty())|| prezzo_min!=0)
					query_prezzo_max=" AND ";
			
				query_prezzo_max=query_prezzo_max+"prezzo<="+prezzo_max+" ";
			}
			
			query=query+query_id+query_cat+query_nome+query_prezzo_min+query_prezzo_max;
			System.out.println(query);
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				prodotto = new Prodotto();
				prodotto.setIdProdotto(result.getLong("idProdotto"));
				prodotto.setCategoria(result.getString("categoria"));
				prodotto.setNomeCommerciale(result.getString("nomeCommerciale"));
				prodotto.setImmagine(result.getString("immagine"));
				prodotto.setDescrizione(result.getString("descrizione"));		
				prodotto.setPrezzo(result.getDouble("prezzo"));							
				prodotti.add(prodotto);
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
		
		return prodotti;
	}





	




	@Override
	public void update(Prodotto prodotto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(Prodotto prodotto) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void setProfessore() {
		// TODO Auto-generated method stub
		Connection connection = this.dataSource.getConnection();

		try {
			PreparedStatement statement;

			String update_query = " UPDATE mydb.Prodotto SET prezzo = '1.0' ";

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


