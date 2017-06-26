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
			r=new Responsable(rs.getString("NIF"),rs.getString("password"),rs.getString("nom"),
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
	
	public List<Responsable> cercarRespos(Responsable r) throws SQLException{
		List<Responsable> respos=new ArrayList<Responsable>();
		Responsable re=null;
		consultaSQL="SELECT * FROM usuari WHERE ";
		if(r.getNIF()!=null){
			consultaSQL+="NIF='"+r.getNIF()+"' ";
		}
		if(r.getNom()!=null){
			if(r.getNIF()!=null){
				consultaSQL+="AND nom='"+r.getNom()+"' ";
			}else{
				consultaSQL+="nom='"+r.getNom()+"' ";
			}
		}
		if(r.getCognom1()!=null){
			if(r.getNIF()!=null || r.getNom()!=null){
				consultaSQL+="AND primer_cognom='"+r.getCognom1()+"';";
			}else{
				consultaSQL+="primer_cognom='"+r.getCognom1()+"';";
			}
		}
		ResultSet rs=g.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			re=new Responsable(rs.getString("NIF"),rs.getString("password"),rs.getString("nom"),rs.getString("primer_cognom"),rs.getString("segon_cognom"),rs.getString("mail"),rs.getInt("permisos"));
			re.setIdCentre(rs.getInt("id_centre"));
			respos.add(re);
		}
		rs.close();
		System.out.println(consultaSQL);
		return respos;
	}
	
	public void tancarConn(){
		g.tancarConnexio();
	}
}
