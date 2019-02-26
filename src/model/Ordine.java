package model;



public class Ordine{

	
	private enum StatoOrdine{In_corso, Annullato, Effettuato, Non_effettuato}

	private Long idOrdine;
	private Long idAccountProprietario;
	private double spesaSpedizione;
	private double totaleOrdine;
	private StatoOrdine statoOrdine;
	private String dataEffettuazione;
	private String indirizzoSpedizione;
	public Ordine() {}
	
public Ordine(Long idAccountProprietario, double spesaSpedizione, double totaleOrdine,String statoOrdine) {
	this.idAccountProprietario=idAccountProprietario;
	this.spesaSpedizione=spesaSpedizione;
	this.totaleOrdine=totaleOrdine;
	this.statoOrdine= StatoOrdine.valueOf(statoOrdine);
	// TODO Auto-generated constructor stub
}
	



	public long getIdOrdine() {
		// TODO Auto-generated method stub
		return this.idOrdine;
	}

	public long getIdAccountProprietario() {
		// TODO Auto-generated method stub
		return this.idAccountProprietario;
	}
	
	public double getSpesaSpedizione() {
		// TODO Auto-generated method stub
		return this.spesaSpedizione;
	}

	public double getTotaleOrdine() {
		// TODO Auto-generated method stub
		return this.totaleOrdine;
	}

	public String getStatoOrdine() {
		// TODO Auto-generated method stub
		return this.statoOrdine.name();
	}

	public String getDataEffettuazione() {
		// TODO Auto-generated method stub
		return this.dataEffettuazione;
	}
	
	public String getIndirizzoSpedizione() {
		// TODO Auto-generated method stub
		return this.indirizzoSpedizione;
	}


	
	public void setCodice(Long idOrdine) {
		// TODO Auto-generated method stub
		this.idOrdine=idOrdine;	
	}

	public void setIdAccountProprietario(Long idAccountProprietario){
		// TODO Auto-generated method stub
		this.idAccountProprietario=idAccountProprietario;
	}

	public void setSpesaSpedizione(double spesaSpedizione) {
		// TODO Auto-generated method stub
		this.spesaSpedizione=spesaSpedizione;
	}

	public void setTotaleOrdine(double totaleOrdine) {
		// TODO Auto-generated method stub
		this.totaleOrdine=totaleOrdine;
	}

	public void setStatoOrdine(String statoOrdine){
		// TODO Auto-generated method stub
		this.statoOrdine=StatoOrdine.valueOf(statoOrdine);
	}

	public void setDataEffettuazione(String dataEffettuazione) {
		// TODO Auto-generated method stub
		this.dataEffettuazione=dataEffettuazione;
	}

	public void setIndirizzoSpedizione(String indirizzoSpedizione){
		// TODO Auto-generated method stub
		this.indirizzoSpedizione=indirizzoSpedizione;
	}
	
}
