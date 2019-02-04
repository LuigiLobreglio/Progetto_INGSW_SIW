package model;


public class Prodotto {

	
	private enum Categoria {Cereali_e_Derivati, Carne, Pesce, LattieroCaserai, Uova, Ortaggi, Legumi, Frutta, OliiGrassiCondimento, Bevande, Altro}
	

	private Long idProdotto;
	private Categoria categoria;
	private String nomeCommerciale;
	private String immagine;
	private String descrizione;
	private int prezzo;
	
	public Prodotto() {}
	
	public Prodotto( Long idProdotto, String categoria, String nomeCommerciale, String immagine, String descrizione,int prezzo) {
		
		this.idProdotto=idProdotto;
		this.categoria=Categoria.valueOf(categoria);
		this.nomeCommerciale=nomeCommerciale;
		this.immagine=immagine;
		this.descrizione=descrizione;
		this.prezzo=prezzo;		
	}
	



	public long getIdProdotto() {
		// TODO Auto-generated method stub
		return this.idProdotto;
	}
	
	public String getCategoria() {
		// TODO Auto-generated method stub
		return this.categoria.name();
	}
	
	public String getNomeCommerciale() {
		// TODO Auto-generated method stub
		return this.nomeCommerciale;
	}
	
	public String getImmagine() {
		// TODO Auto-generated method stub
		return this.immagine;
	}

	public String getDescrizione() {
		// TODO Auto-generated method stub
		return this.descrizione;
	}

	public int getPrezzo() {
		// TODO Auto-generated method stub
		return this.prezzo;
	}

	
	
	public void setIdProdotto(Long idProdotto) {
		// TODO Auto-generated method stub
		this.idProdotto=idProdotto;	
	}

	public void setCategoria(String categoria) {
		// TODO Auto-generated method stub
		this.categoria=Categoria.valueOf(categoria);
	}

	public void setNomeCommerciale(String nomeCommerciale) {
		// TODO Auto-generated method stub
		this.nomeCommerciale=nomeCommerciale;
	}

	public void setImmagine(String immagine) {
		// TODO Auto-generated method stub
		this.immagine=immagine;
	}

	public void setDescrizione(String descrizione) {
		// TODO Auto-generated method stub
		this.descrizione=descrizione;
	}

	public void setPrezzo(int prezzo) {
		// TODO Auto-generated method stub
		this.prezzo=prezzo;
		
	}

}
