package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class RegistreDAO {
	GestorDB gestorDB;
	
	public RegistreDAO(){
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public void afegirRegistre(Registre reg) throws SQLException{
		String consultaSQL = "INSERT INTO registre VALUES("+reg.getActivitat().getId()+","+reg.getAlumne().getIdUsuari()+",'"+reg.getData()+"',"+reg.getHores()+")";
		System.out.println(consultaSQL);
		gestorDB.modificarRegistre(consultaSQL);
	}
	
	public List<Object> valorsData(Registre reg) throws SQLException{
		List<Object> valors = new ArrayList<Object>();
		ResultSet rs = null;
		String consultaSQL = "SELECT * FROM registre WHERE data='"+reg.getData()+"'";
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			valors.add(rs.getInt(1));
			valors.add(rs.getInt(2));
			valors.add(rs.getDate(3));
			valors.add(rs.getInt(4));
		}

		return valors;
	}
	
	public List<String> llistaActivitats() throws SQLException{
		List<String> llista = new ArrayList<String>();
		ResultSet rs = null;
		String consultaSQL = "SELECT DISTINCT codi FROM activitat";
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			llista.add(rs.getString(1));
		}
		return llista;
	}
	
	public int sumaHores(Registre reg) throws SQLException{
		int suma = 0;
		ResultSet rs = null;
		String consultaSQL = "SELECT SUM(r.hores) "
				+ "FROM registre AS r "
				+ "WHERE r.data LIKE '"+reg.getData()+"'";
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		while(rs.next()){
			suma = rs.getInt(1);
		}
		return suma;
	}
	
	public int idActivitat(String codi) throws SQLException{
		int id = 0;
		ResultSet rs = null;
		String consultaSQL = "SELECT a.id_activitat "
				+ "FROM activitat AS a "
				+ "WHERE a.codi='"+codi+"'";
		System.out.println(consultaSQL);
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			id = rs.getInt(1);
		}
		
		return id;
	}
		
	public void tancarConn(){
		gestorDB.tancarConnexio();
	}
}
