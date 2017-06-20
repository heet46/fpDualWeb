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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codi == null) ? 0 : codi.hashCode());
		result = prime * result + idCentre;
		result = prime * result + ((nom == null) ? 0 : nom.hashCode());
		result = prime * result + ((tlf == null) ? 0 : tlf.hashCode());
		result = prime * result + ((web == null) ? 0 : web.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Centre other = (Centre) obj;
		if (codi == null) {
			if (other.codi != null)
				return false;
		} else if (!codi.equals(other.codi))
			return false;
		if (idCentre != other.idCentre)
			return false;
		if (nom == null) {
			if (other.nom != null)
				return false;
		} else if (!nom.equals(other.nom))
			return false;
		if (tlf == null) {
			if (other.tlf != null)
				return false;
		} else if (!tlf.equals(other.tlf))
			return false;
		if (web == null) {
			if (other.web != null)
				return false;
		} else if (!web.equals(other.web))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Centre [idCentre=" + idCentre + ", codi=" + codi + ", nom=" + nom + ", tlf=" + tlf + ", web=" + web
				+ "]";
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