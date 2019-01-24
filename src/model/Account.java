package model;

import java.util.Date;
import java.util.GregorianCalendar;

public class Account {

	
	private enum Sesso {m,f}

	private Long id;
	private String nome;
	private String cognome;
	private String data_nascita;
	private Sesso sesso;
	private String indirizzo_Email;
	private String password;
	
	public Account() {}
	
public Account(String nome, String cognome, String data_nascita, String sesso, String indirizzo_Email, String password) {
	this.nome=nome;
	this.cognome=cognome;
	this.data_nascita=data_nascita;
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


}
