package persistence.dao;

import java.util.List;

import model.VoceProdotto;
 
public interface VoceProdottoDao {

	public void save(VoceProdotto voceProdotto);  // Create	
	public List<VoceProdotto> findAll();	//Retrieve  
	public List<VoceProdotto> findByIdAccountProprietario(Long idAccountProprietario);     // Retrieve
	public void update(Long idAccountProprietario, Long idProd,  int quantita);	//Update
	public void updateInOrdine(Long idAccountProprietario, boolean inOrdine, Long idOrdinePossibile);	//Update
	public void delete(Long idAccountProprietario, Long idProd);	//Delete	

}
