package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
	
	public void altaTutor(Tutor t) throws SQLException{
		consultaSQL="INSERT INTO tutor VALUES("+t.getId_usuari()+",'"+t.getTecnologia()+"');";
		g.modificarRegistre(consultaSQL);
	}
	
	public void baixaTutor(int id) throws SQLException{
		
		consultaSQL="DELETE FROM tutor WHERE id_usuari="+id+";";
		g.modificarRegistre(consultaSQL);
		consultaSQL="DELETE FROM usuari WHERE id_usuari="+id+";";
		g.modificarRegistre(consultaSQL);
		
	}
	
	public void modificarTutor(Tutor t) throws SQLException{
		consultaSQL="UPDATE tutor SET tecnologia='"+t.getTecnologia()+"' WHERE id_usuari="+t.getId_usuari()+";";
		g.modificarRegistre(consultaSQL);
	}
	
	public List<Usuari> consultaTutor() throws SQLException{
		consultaSQL="SELECT * "
				+ "FROM usuari AS u,tutor AS t "
				+ "WHERE t.id_usuari=u.id_usuari;";
		ResultSet rs=null;
		List<Usuari> llista=new ArrayList<Usuari>();
		rs=g.consultaRegistres(consultaSQL);
		while(rs.next()){
			llista.add(new Usuari(rs.getString("NIF"),rs.getString("password"),rs.getString("nom"),rs.getString("primer_cognom"),rs.getString("segon_cognom"),rs.getString("mail"),rs.getInt("permisos")));
			System.out.println(llista.get(0).getNIF());
		}
		rs.close();
		return llista;
	}
	
	public List<Integer> consultaIDTutor() throws SQLException{
		consultaSQL="SELECT id_usuari FROM tutor;";
		ResultSet rs;
		List<Integer> dades = new ArrayList<Integer>();
		rs=g.consultaRegistres(consultaSQL);
		while(rs.next()){
			dades.add(rs.getInt("id_usuari"));			
		}
		rs.close();
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
		rs.close();
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
		rs.close();
		return id;
	}
	
	public List<Usuari> cercarTutors(Usuari u) throws SQLException{
		List<Usuari> tutors=new ArrayList<Usuari>();
		consultaSQL="SELECT * FROM usuari,tutor WHERE usuari.Id_usuari=tutor.Id_usuari AND ";
		if(u.getNIF()!=null){
			consultaSQL+="usuari.NIF='"+u.getNIF()+"' ";
		}
		if(u.getNom()!=null){
			if(u.getNIF()!=null){
				consultaSQL+="AND usuari.nom='"+u.getNom()+"' ";
			}else{
				consultaSQL+="usuari.nom='"+u.getNom()+"' ";
			}
		}
		if(u.getCognom1()!=null){
			if(u.getNIF()!=null || u.getNom()!=null){
				consultaSQL+="AND usuari.primer_cognom='"+u.getCognom1()+"';";
			}else{
				consultaSQL+="usuari.primer_cognom='"+u.getCognom1()+"';";
			}
		}
		ResultSet rs=g.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			tutors.add(new Usuari(rs.getString("NIF"),rs.getString("password"),rs.getString("nom"),rs.getString("primer_cognom"),rs.getString("segon_cognom"),rs.getString("mail"),rs.getInt("permisos")));
		}
		rs.close();
		return tutors;
	}
	
	public boolean comprobarAlumnes(Tutor t) throws SQLException{
		consultaSQL="SELECT alumne.Id_usuari FROM alumne,tutor WHERE tutor.Id_usuari=alumne.id_tutor AND tutor.Id_usuari='"+t.getId_usuari()+"';";
		boolean existeix=false;
		ResultSet rs=g.consultaRegistres(consultaSQL);
		if(rs.first()){
			existeix=true;
		}
		rs.close();
		return existeix;
	}
	
	public List<Usuari> consultaTutorsCentre(Tutor t) throws SQLException{
		List<Integer> ids=new ArrayList<Integer>();
		List<Usuari> tutors=new ArrayList<Usuari>();
		consultaSQL="SELECT tu.id_usuari "+"FROM tutor as tu,alumne as al,responsable as re,usuari as us "+
				"WHERE tu.id_usuari=al.id_tutor AND us.id_usuari=al.id_usuari "+
				" AND us.id_centre=re.Id_centre AND re.Id_usuari="+t.getId_usuari()+";";
		ResultSet rs=g.consultaRegistres(consultaSQL);
		while(rs.next()){
			ids.add(rs.getInt("Id_usuari"));
		}
		rs.close();
		for(int i=0;i!=ids.size();i++){
			consultaSQL="SELECT us.*"+" FROM usuari as us,tutor as tu "+"WHERE us.id_usuari=tu.id_usuari AND "+
						"tu.id_usuari="+ids.get(i)+";";
			rs=g.consultaRegistres(consultaSQL);
			while(rs.next()){
				tutors.add(new Usuari(rs.getString("NIF"),"",rs.getString("nom"),rs.getString("primer_cognom"),"",rs.getString("mail"),rs.getInt("permisos")));
			}
		}
		return tutors;
	}
	
	public void tancarConn(){
		g.tancarConnexio();
	}
}