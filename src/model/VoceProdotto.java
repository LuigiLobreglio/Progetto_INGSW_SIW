package model;


public class VoceProdotto {


	

	private Long idProd;
	private Long idAccountProprietario;
	private int quantita;
	private String immagine;
	private String nomeCommerciale;
	private double prezzo;
	private boolean inOrdine;
	private Long idOrdinePossibile;



	
	public VoceProdotto() {}
	
	public VoceProdotto( Long idProd, Long idAccountProprietario, int quantita, String immagine, String nomeCommerciale, double prezzo, boolean inOrdine) {
		
		this.idProd=idProd;
		this.idAccountProprietario=idAccountProprietario;
		this.quantita=quantita;
		this.immagine=immagine;
		this.nomeCommerciale=nomeCommerciale;
		this.prezzo=prezzo;
		this.inOrdine=inOrdine;
	}
	



	public long getIdProd() {
		// TODO Auto-generated method stub
		return this.idProd;
	}
	public long getIdAccountProprietario() {
		// TODO Auto-generated method stub
		return this.idAccountProprietario;
	}
	
	

	public int getQuantita() {
		// TODO Auto-generated method stub
		return this.quantita;
	}
	
	public String getImmagine() {
		// TODO Auto-generated method stub
		return this.immagine;
	}
	
	public String getNomeCommerciale() {
		// TODO Auto-generated method stub
		return this.nomeCommerciale;
	}	
	
	public double getPrezzo() {
		// TODO Auto-generated method stub
		return this.prezzo;
	}
	
	public boolean getInOrdine() {
		// TODO Auto-generated method stub
		return this.inOrdine;
	}
	
	public Long getIdOrdinePossibile() {
		// TODO Auto-generated method stub
		return this.idOrdinePossibile;
	}

	
	
	public void setIdProd(Long idProd) {
		// TODO Auto-generated method stub
		this.idProd=idProd;	
	}	
	
	public void setIdAccountProprietario(Long idAccountProprietario) {
		// TODO Auto-generated method stub
		this.idAccountProprietario=idAccountProprietario;	
	}


	public void setQuantita(int quantita) {
		// TODO Auto-generated method stub
		this.quantita=quantita;
		
	}
	
	public void setImmagine(String immagine) {
		// TODO Auto-generated method stub
		this.immagine=immagine;
	}	
	
	public void setNomeCommerciale (String nomeCommerciale) {
		// TODO Auto-generated method stub
		this.nomeCommerciale=nomeCommerciale;
	}
	
	public void setPrezzo (double prezzo) {
		
		this.prezzo=prezzo;
	}
	
	public void setInOrdine (boolean inOrdine) {
		
		this.inOrdine=inOrdine;
	}
	
	
	public void setIdOrdinePossibile (Long idOrdinePossibile) {
		
		this.idOrdinePossibile=idOrdinePossibile;
	}

}
