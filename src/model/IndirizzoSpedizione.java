package model;


public class IndirizzoSpedizione {

	private Long idIndirizzo;
	private Long idAccountProprietario;
	private String stato;
	private String citta;
	private String codicePostale;
	private String via;
	private String numeroCivico;
	private String dettagli;

	public IndirizzoSpedizione() {}
	
	public IndirizzoSpedizione(Long idAccountProprietario, String stato, String citta, String codicePostale, String via, String numeroCivico, String dettagli) {
		this.idAccountProprietario=idAccountProprietario;
		this.stato=stato;
		this.citta=citta;
		this.codicePostale=codicePostale;
		this.via=via;
		this.numeroCivico=numeroCivico;
		this.dettagli=dettagli;
	// TODO Auto-generated constructor stub
	}


	public long getidIndirizzo() {
		// TODO Auto-generated method stub
		return this.idIndirizzo;
	}
	
	public long getIdAccountProprietario() {
		// TODO Auto-generated method stub
		return this.idAccountProprietario;
	}

	public String getStato() {
		// TODO Auto-generated method stub
		return this.stato;
	}
	
	public String getCitta() {
		// TODO Auto-generated method stub
		return this.citta;
	}
	
	public String getCodicePostale() {
		// TODO Auto-generated method stub
		return this.codicePostale;
	}

	public String getVia() {
		// TODO Auto-generated method stub
		return this.via;
	}

	public String getNumeroCivico() {
		// TODO Auto-generated method stub
		return this.numeroCivico;
	}

	public String getDettagli() {
		// TODO Auto-generated method stub
		return this.dettagli;
	}
	
	public void setCodice(Long idIndirizzo) {
		// TODO Auto-generated method stub
		this.idIndirizzo=idIndirizzo;	
	}

	public void setIdAccountProprietario(Long idAccountProprietario) {
		// TODO Auto-generated method stub
		this.idAccountProprietario=idAccountProprietario;	
	}

	public void setStato(String stato) {
		// TODO Auto-generated method stub
		this.stato=stato;
	}

	public void setCitta(String citta) {
		// TODO Auto-generated method stub
		this.citta=citta;
	}

	public void setCodicePostale(String codicePostale) {
		// TODO Auto-generated method stub
		this.codicePostale=codicePostale;
	}

	public void setVia(String via) {
		// TODO Auto-generated method stub
		this.via=via;
	}

	public void setNumeroCivico(String numeroCivico) {
		// TODO Auto-generated method stub
		this.numeroCivico=numeroCivico;
		
	}

	public void setDettagli(String dettagli) {
		// TODO Auto-generated method stub
		this.dettagli=dettagli;
		
	}


}
