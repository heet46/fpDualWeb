package model;

public class Responsable extends Usuari {

	Centre centre;
		
	public Responsable() {
		super();
	}
	
	
	
	public Responsable(String NIF, String passwd, String nom, String cognom1, String cognom2, String mail, int permis) {
		super(NIF, passwd, nom, cognom1, cognom2, mail, permis);
	}



	public Responsable(Usuari u, Centre centre, Tutor tutor) {
		super(u.getNIF(), u.getPasswd(), u.getNom(), u.getCognom1(), u.getCognom2(), u.getMail(),u.getPermis());

		this.centre = centre;
	}

	public int getIdUsuariResponsable(){
		return getIdUsuari();
	}
	
	public Centre getCentre() {
		return centre;
	}
	public void setCentre(Centre centre) {
		this.centre = centre;
	}
}
