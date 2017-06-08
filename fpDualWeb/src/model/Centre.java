package model;

public class Centre {
	private int idCentre;
	private String codi;
	private String nom;
	private String tlf;
	private String web;

	public Centre(int idCentre, String codi, String nom, String tlf, String web) {
		super();
		this.idCentre = idCentre;
		this.codi = codi;
		this.nom = nom;
		this.tlf = tlf;
		this.web = web;
	}

	public Centre() {
		super();
	}

	public int getIdCentre() {
		return idCentre;
	}

	public void setIdCentre(int idCentre) {
		this.idCentre = idCentre;
	}

	public String getCodi() {
		return codi;
	}

	public void setCodi(String codi) {
		this.codi = codi;
	}

	public String getNom() {
		return nom;
	}

	public void setNom(String nom) {
		this.nom = nom;
	}

	public String getTlf() {
		return tlf;
	}

	public void setTlf(String tlf) {
		this.tlf = tlf;
	}

	public String getWeb() {
		return web;
	}

	public void setWeb(String web) {
		this.web = web;
	}

}