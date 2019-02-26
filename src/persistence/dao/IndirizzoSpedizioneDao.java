package persistence.dao;

import java.util.List;

import model.IndirizzoSpedizione;

public interface IndirizzoSpedizioneDao {
	public void save(IndirizzoSpedizione indirizzoSpedizione);  // Create
	public IndirizzoSpedizione findByIdIndirizzo(Long idIndirizzo);     // Retrieve
	public List<IndirizzoSpedizione> findByIdAccountProprietario(Long idAccountProprietario);     // Retrieve
	public void delete(Long idIndirizzo); // Delete
}
 