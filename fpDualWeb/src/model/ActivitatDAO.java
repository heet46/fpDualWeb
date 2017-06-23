package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class ActivitatDAO {
	GestorDB gestorDB;
	
	public ActivitatDAO(){
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public void altaActivitat(Activitat activitat) throws SQLException{
		String consultaSQL = "INSERT INTO ACTIVITAT(CODI, DESCRIPCIO) VALUES('"+activitat.getCodi()+"', '"+activitat.getDescripcio()+"')";
		if(gestorDB.modificarRegistre(consultaSQL)!=0){
			System.out.println("Alta realitzada amb èxit");
		}
	}
	
	public void altaActivitatManual(Activitat activitat) throws SQLException {
		String consultaSQL = "INSERT INTO ACTIVITAT(ID_ACTIVITAT, CODI, DESCRIPCIO) VALUES('"+activitat.getId()+"', '"+activitat.getCodi()+"', '"+activitat.getDescripcio()+"')";
		if(gestorDB.modificarRegistre(consultaSQL)!=0){
			System.out.println("Alta realitzada amb èxit");
		}
	}
	
	public void baixaActivitat(Activitat activitat) throws SQLException{
		String consultaSQL = "DELETE FROM ACTIVITAT WHERE ID_ACTIVITAT="+activitat.getId()+"";
		if(gestorDB.modificarRegistre(consultaSQL)!=0){
			System.out.println("Baixa realitzada amb èxit");
			consultaSQL = "ALTER TABLE ACTIVITAT AUTO_INCREMENT = 1";
			gestorDB.modificarRegistre(consultaSQL);
		}else{
			System.out.println("No s'ha trobat l'ID");
		}
	}
	
	public void modificarActivitat(Activitat activitat) throws SQLException{
		String consultaSQL = "UPDATE ACTIVITAT SET CODI='"+activitat.getCodi()+"', DESCRIPCIO='"+activitat.getDescripcio()+"' WHERE ID_ACTIVITAT="+activitat.getId()+"";
		if(gestorDB.modificarRegistre(consultaSQL)!=0){
			System.out.println("Modificació realitzada amb èxit");
		}
	}
	
	public List<Integer> consultarID(){
		String sentencia = "SELECT id_activitat FROM activitat";
		ResultSet rs;
		List<Integer> dades = new ArrayList<Integer>();
		try{
			rs = gestorDB.consultaRegistres(sentencia);
			while(rs.next())
				dades.add(rs.getInt(1));
		}catch(SQLException e){
			e.printStackTrace();
		}
		return dades;
	}
	
	public List<Integer> otorgarID(){
		String sentencia = "SELECT MAX(id_activitat) FROM activitat";
		ResultSet rs;
		List<Integer> dades = new ArrayList<Integer>();
		try{
			rs = gestorDB.consultaRegistres(sentencia);
			while(rs.next())
				dades.add(rs.getInt(1));
		}catch(SQLException e){
			e.printStackTrace();
		}
		return dades;
	}
	
	public List<String> llistaActivitat(){
		ResultSet rs;
		List<String> dades = new ArrayList<String>();
		String sentencia = "SELECT * FROM ACTIVITAT";
		rs=gestorDB.consultaRegistres(sentencia);
		String s="";
		try {
			while(rs.next()){
				s="";
				s += rs.getInt(1)+"\t";
				s += rs.getString(2)+"\t";
				s += rs.getString(3);
				dades.add(s);
			}
		} catch (SQLException e) {
			System.err.println("Error llistat");
		}
		return dades;
	}
	
	public List<Activitat> llistaTotesActivitats() throws SQLException{
		ResultSet rs;
		List<Activitat> activitats = new ArrayList<Activitat>();
		String sentencia = "SELECT * FROM ACTIVITAT";
		rs = gestorDB.consultaRegistres(sentencia);
		while(rs.next()){
			Activitat activitat = new Activitat();
			activitat.setId(rs.getString(1));
			activitat.setCodi(rs.getString(2));
			activitat.setDescripcio(rs.getString(3));
			activitats.add(activitat);
		}
		return activitats;
	}
	
	public List<Activitat> cercarActivitat(Activitat activitat) throws SQLException{
		ResultSet rs;
		List<Activitat> activitats = new ArrayList<Activitat>();
		String sentencia = "SELECT A.ID_ACTIVITAT, A.CODI, A.DESCRIPCIO FROM ACTIVITAT AS A WHERE A.CODI IN"+activitat.getCodi()+" AND A.DESCRIPCIO LIKE"+activitat.getDescripcio()+"";
		rs = gestorDB.consultaRegistres(sentencia);
		while(rs.next()){
			Activitat act = new Activitat();
			act.setId(rs.getString(1));
			act.setCodi(rs.getString(2));
			act.setDescripcio(rs.getString(3));
			activitats.add(act);
		}
		rs.close();
		
		return activitats;
	}
	
	public void tancarConn(){
		gestorDB.tancarConnexio();
	}

	
}