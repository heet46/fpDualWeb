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
	
	public void modificarTutor(Tutor t){
		consultaSQL="UPDATE tutor SET tecnologia='"+t.getTecnologia()+"' WHERE id_usuari="+t.getId_usuari()+";";
		g.modificarRegistre(consultaSQL);
	}
	
	public List<Usuari> consultaTutor() throws SQLException{
		consultaSQL="SELECT u.id_usuari,u.NIF,u.password,u.nom,u.primer_cognom,u.segon_cognom,u.mail "
				+ "FROM usuari AS u,tutor AS t "
				+ "WHERE t.id_usuari=u.id_usuari;";
		ResultSet rs=null;
		List<Usuari> llista=new ArrayList<Usuari>();
		rs=g.consultaRegistres(consultaSQL);
		while(rs.next()){
			llista.add(new Usuari(rs.getString("NIF"),rs.getString("password"),rs.getString("nom"),rs.getString("primer_cognom"),rs.getString("segon_cognom"),rs.getString("mail")));
			System.out.println(llista.get(0).getNIF());
		}
		return llista;
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
	
	public int idTutor(String nom) throws SQLException{
		int id=0;
		ResultSet rs = null;
		String consultaSQL = "SELECT t.id_usuari "
				+ "FROM tutor AS t, usuari AS u "
				+ "WHERE u.id_usuari=t.id_usuari AND u.nom='"+nom+"'";
		rs = g.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			id = rs.getInt(1);
		}
		return id;
	}
	
	public String consultaTecno(int id){
		String tecno="";
		consultaSQL="SELECT tecnologia FROM tutor WHERE Id_usuari="+id+";";
		ResultSet rs=g.consultaRegistres(consultaSQL);
		try {
			tecno=rs.getString("tecnologia");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return tecno;
	}
	
	public void tancarConn(){
		g.tancarConnexio();
	}
}