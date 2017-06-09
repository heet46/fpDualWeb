package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class TutorDAO {
	String consultaSQL;
	Statement stmt;
	GestorDB g;
	
	public TutorDAO(){
		g=new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public void altaTutor(Tutor t){
		consultaSQL="INSERT INTO tutor VALUES("+t.getId_usuari()+",'"+t.getTecnologia()+"');";
		g.modificarRegistre(consultaSQL);
		
	}
	
	public void baixaTutor(int id){
		
		consultaSQL="DELETE FROM tutor WHERE id_usuari="+id+";";
		g.modificarRegistre(consultaSQL);
		consultaSQL="DELETE FROM usuari WHERE id_usuari="+id+";";
		g.modificarRegistre(consultaSQL);
		
	}
	
	public Usuari[] consultaTutor(){
		consultaSQL="SELECT usuari.nom,usuari.NIF,usuari.data_alta,usuari.mail "
				+ "FROM usuari,tutor WHERE tutor.id_usuari=usuari.id_usuari;";
		ResultSet rs;
		List<Usuari> llista=new ArrayList<Usuari>();
		try {
			rs=g.consultaRegistres(consultaSQL);
			while(rs.next()){
				llista.add(new Usuari(rs.getString("NIF"),rs.getString("password"),rs.getString("nom"),rs.getString("primer_cognom"),rs.getString("segon_cognom"),rs.getString("mail")));
			}
		} catch (SQLException e) {
			System.out.println("Error consulta tutor "+e.toString());
		}
		Usuari[] u=(Usuari[]) llista.toArray();
		return u;
	}
	
	public List<Integer> consultaIDTutor(){
		consultaSQL="SELECT id_usuari FROM tutor;";
		ResultSet rs;
		List<Integer> dades = new ArrayList<Integer>();
		try {
			rs=g.consultaRegistres(consultaSQL);
			while(rs.next()){
				dades.add(rs.getInt("id_usuari"));			}
		} catch (SQLException e) {
			System.out.println("Error consulta id tutor "+e.toString());
		}
		return dades;
	}
	
	public List<String> nomsTutors() throws SQLException{
		List<String> tutors = new ArrayList<String>();
		ResultSet rs = null;
		String consultaSQL = "SELECT u.nom "
				+ "FROM tutor AS t, usuari AS u "
				+ "WHERE t.id_usuari=u.id_usuari";
		
		rs = g.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			tutors.add(rs.getString(1));
		}
		return tutors;
	}
	
	public void tancarConn(){
		g.tancarConnexio();
	}
}