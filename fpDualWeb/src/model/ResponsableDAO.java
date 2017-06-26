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
		Responsable r = null;
		rs=g.consultaRegistres(consultaSQL);
		while(rs.next()){
			r=new Responsable(rs.getString("NIF"),rs.getString("nom"),rs.getString("password"),
					rs.getString("primer_cognom"),rs.getString("segon_cognom"),rs.getString("mail"),
					rs.getInt("permisos"));
			r.setIdCentre(rs.getInt("id_centre"));
			llista.add(r);
		}
		return llista;
	}
	
	public void baixaResponsable(String NIF) throws SQLException{
		consultaSQL="DELETE FROM usuari WHERE NIF='"+NIF+"';";
		g.modificarRegistre(consultaSQL);
	}
}
