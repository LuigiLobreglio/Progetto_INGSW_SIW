package model;

public class Account {

	
	private enum Sesso {m,f}

	private Long id;
	private String nome;
	private String cognome;
	private int età;
	private Sesso sesso;
	private String indirizzo_Email;
	private String password;
	
public Account(String nome, String cognome, int età, String sesso, String indirizzo_Email, String password) {
	this.nome=nome;
	this.cognome=cognome;
	this.età=età;
	this.sesso= Sesso.valueOf(sesso);
	this.indirizzo_Email=indirizzo_Email;
	this.password=password;
	// TODO Auto-generated constructor stub
}
	

	public void setCodice(Long id) {
		// TODO Auto-generated method stub
		this.id=id;
		
	}

	public long getidAccount() {
		// TODO Auto-generated method stub
		return this.id;
	}

	public String getNome() {
		// TODO Auto-generated method stub
		return this.nome;
	}
	
	public String getCognome() {
		// TODO Auto-generated method stub
		return this.cognome;
	}

	public int getEtà() {
		// TODO Auto-generated method stub
		return this.età;
	}

	public String getSesso() {
		// TODO Auto-generated method stub
		return this.sesso.name();
	}

	public String getIndirizzoEmail() {
		// TODO Auto-generated method stub
		return this.indirizzo_Email;
	}

	public String getPassword() {
		// TODO Auto-generated method stub
		return this.password;
	}


}
