package model;

public class Tutor extends Usuari{
	int id_usuari;
	String tecnologia;
	Usuari u=new Usuari();
	public Tutor(int id_usuari, String tecnologia) {
		this.tecnologia = tecnologia;
		this.id_usuari=id_usuari;
	}
	
	
	public Tutor(){
		super();
	}
	
	
	@Override
	public String toString() {
		return "Tutor [id_usuari=" + id_usuari +", tecnologia=" + tecnologia + "]";
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = super.hashCode();
		result = prime * result + id_usuari;
		result = prime * result + ((tecnologia == null) ? 0 : tecnologia.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (!super.equals(obj))
			return false;
		if (getClass() != obj.getClass())
			return false;
		Tutor other = (Tutor) obj;
		if (id_usuari != other.id_usuari)
			return false;
		if (tecnologia == null) {
			if (other.tecnologia != null)
				return false;
		} else if (!tecnologia.equals(other.tecnologia))
			return false;
		return true;
	}


	public int getId_usuari() {
		return id_usuari;
	}
	public void setId_usuari(int id_usuari) {
		this.id_usuari = id_usuari;
	}
	public String getTecnologia() {
		return tecnologia;
	}
	public void setTecnologia(String tecnologia) {
		this.tecnologia = tecnologia;
	}
	
	
}