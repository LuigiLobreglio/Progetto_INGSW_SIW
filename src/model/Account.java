package model;



public class Account {

	
	private enum Sesso {m,f}

	private Long id;
	private String nome;
	private String cognome;
	private String data_nascita;
	private Sesso sesso;
	private String indirizzo_Email;
	private String password;
	private Long idFacebook;
	
	public Account() {}
	




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

	public String getData_nascita() {
		// TODO Auto-generated method stub
		return this.data_nascita;
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
	
	public long getidFacebook() {
		// TODO Auto-generated method stub
		return this.idFacebook;
	}
	
	public void setCodice(Long id) {
		// TODO Auto-generated method stub
		this.id=id;	
	}

	public void setNome(String nome) {
		// TODO Auto-generated method stub
		this.nome=nome;
	}

	public void setCognome(String cognome) {
		// TODO Auto-generated method stub
		this.cognome=cognome;
	}

	public void setData_nascita(String data_nascita) {
		// TODO Auto-generated method stub
		this.data_nascita=data_nascita;
	}

	public void setSesso(String sesso) {
		// TODO Auto-generated method stub
		this.sesso=Sesso.valueOf(sesso);
	}

	public void setIndirizzo_email(String indirizzo_email) {
		// TODO Auto-generated method stub
		this.indirizzo_Email=indirizzo_email;
		
	}

	public void setPassword(String password) {
		// TODO Auto-generated method stub
		this.password=password;
		
	}
	
	public void setidFacebook(Long idFacebook) {
		// TODO Auto-generated method stub
		this.idFacebook=idFacebook;	
	}


}
