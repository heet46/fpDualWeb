package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class ResponsableDAO {
	String consultaSQL;
	Statement stmt;
	GestorDB g;
		
	public ResponsableDAO(){
		g=new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public List<Responsable> consultaRespos() throws SQLException{
		consultaSQL="SELECT * FROM usuari WHERE permisos=3";
		ResultSet rs=null;
		List<Responsable> llista=new ArrayList<Responsable>();
		Responsable r = new Responsable();
		rs=g.consultaRegistres(consultaSQL);
		while(rs.next()){
			r.setNIF(rs.getString("NIF"));
			r.setNom(rs.getString("nom"));
			r.setPasswd(rs.getString("password"));
			r.setCognom1(rs.getString("primer_cognom"));
			r.setCognom2(rs.getString("segon_cognom"));
			r.setDataAlta(rs.getDate("data_alta"));
			r.setMail(rs.getString("mail"));
			r.setPermis(rs.getInt("permisos"));
			r.setIdCentre(rs.getInt("id_centre"));
			llista.add(r);
		}
		return llista;
	}
}
