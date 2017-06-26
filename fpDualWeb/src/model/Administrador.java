package model;

public class Administrador extends Usuari {
	int id_usuari;
	Usuari u = new Usuari();

	public Administrador(int id_usuari, String tecnologia) {
		this.id_usuari = id_usuari;
	}

	public Administrador() {
		super();
	}

	@Override
	public String toString() {
		return "Tutor [id_usuari=" + id_usuari + "]";
	}

	public int getId_usuari() {
		return id_usuari;
	}

	public void setId_usuari(int id_usuari) {
		this.id_usuari = id_usuari;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id_usuari;
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
		Administrador other = (Administrador) obj;
		if (id_usuari != other.id_usuari)
			return false;
		return true;
	}

}