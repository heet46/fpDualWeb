package model;

import java.util.Date;

public class Usuari {

	private int idUsuari;
	private String NIF;
	private String passwd;
	private String nom;
	private String cognom1;
	private String cognom2;
	private Date dataAlta;
	private String mail;
	
	public Usuari() {}
	
	public Usuari(String NIF, String passwd, String nom, String cognom1, String cognom2,
			String mail) {
		super();
		this.NIF = NIF;
		this.passwd = passwd;
		this.nom = nom;
		this.cognom1 = cognom1;
		this.cognom2 = cognom2;
		this.mail = mail;
	}
	
	// GETTERS & SETTERS
	public int getIdUsuari() {
		return idUsuari;
	}
	
	public void setIdUsuari(int idUsuari) {
		this.idUsuari = idUsuari;
	}
	public String getNIF() {
		return NIF;
	}
	public void setNIF(String NIF) {
		this.NIF = NIF;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getCognom1() {
		return cognom1;
	}
	public void setCognom1(String cognom1) {
		this.cognom1 = cognom1;
	}
	public String getCognom2() {
		return cognom2;
	}
	public void setCognom2(String cognom2) {
		this.cognom2 = cognom2;
	}
	public Date getDataAlta() {
		return dataAlta;
	}
	public void setDataAlta(Date dataAlta) {
		this.dataAlta = dataAlta;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	
	
}