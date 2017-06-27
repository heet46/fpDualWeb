package model;

public class Registre {

	private String data;
	private int hores;
	private Alumne alumne;
	private Activitat activitat;
	
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public int getHores() {
		return hores;
	}
	public void setHores(int hores) {
		this.hores = hores;
	}
	public Alumne getAlumne() {
		return alumne;
	}
	public void setAlumne(Alumne alumne) {
		this.alumne = alumne;
	}
	public Activitat getActivitat() {
		return activitat;
	}
	public void setActivitat(Activitat activitat) {
		this.activitat = activitat;
	}
}