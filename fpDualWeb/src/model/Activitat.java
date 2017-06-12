package model;

public class Activitat {
	
	private String id;
	private String codi;
	private String descripcio;
	
	public Activitat() {
		super();
	}
	
	public Activitat(String codi, String descripcio, String id) {
		super();
		this.id =id;
		this.codi = codi;
		this.descripcio = descripcio;
	}
	
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id = id;
	}
	public String getCodi() {
		return codi;
	}
	public void setCodi(String codi) {
		this.codi = codi;
	}
	public String getDescripcio() {
		return descripcio;
	}
	public void setDescripcio(String descripcio) {
		this.descripcio = descripcio;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((codi == null) ? 0 : codi.hashCode());
		result = prime * result + ((descripcio == null) ? 0 : descripcio.hashCode());
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
		Activitat other = (Activitat) obj;
		if (codi == null) {
			if (other.codi != null)
				return false;
		} else if (!codi.equals(other.codi))
			return false;
		if (descripcio == null) {
			if (other.descripcio != null)
				return false;
		} else if (!descripcio.equals(other.descripcio))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Activitat [codi=" + codi + ", descripcio=" + descripcio + "]";
	}
	
}