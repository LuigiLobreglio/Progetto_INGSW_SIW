package persistence.dao;

import java.util.List;

import model.Ordine;

public interface OrdineDao {

	public Long save(Ordine ordine);  // Create	
	public List<Ordine> findAll();	//Retrieve  
	public List<Ordine> findByIdAccountProprietario(Long idAccountProprietario);     // Retrieve
	public void updateStatoOrdine(Long idAccountProprietario, Long idOrdine,  String statoOrdine);	//Update
	public void updateSpesaSpedizione(Long idAccountProprietario,  Long idOrdine, double spesaSpedizione);	//Update
	public void updateIndirizzoConsegna(Long idAccountProprietario, Long idOrdine, String indirizzoSpedizione);	//Update
}
