package persistence.dao;

import java.util.List;

import model.Prodotto;

public interface ProdottoDao {
	public void save(Prodotto prodotto);  // Create	
	public List<Prodotto> findAll();	//Retrieve  
	public Prodotto findByPrimaryKey(Long idProdotto);     // Retrieve
	public List<Prodotto> findByCategoria(String categoria);     // Retrieve
	public List<String> findByStringaRicercaLive(String stringaRicerca); //Retrieve
	public List<Prodotto> findByNomeCommerciale(String[] nomeCommerciale);     // Retrieve
	public List<Prodotto> findByParametriAvanzati(Long idProdotto, String categoria, String[] nomeCommerciale, int prezzo_min, int prezzo_max);	//Retrieve
	public void update(Prodotto prodotto);	//Update
	public void delete(Prodotto prodotto);	//Delete	

}