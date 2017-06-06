package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import controlador.Constants;
import controlador.GestorDB;

public class UsuariDAO {

	GestorDB gestorDB;
	
	public UsuariDAO(){
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public boolean iniciSessio(String nif, String pw){
		try {
			ResultSet rs = null;
			String consultaSQL = "SELECT * FROM usuari WHERE NIF='"+nif+"' AND password='"+pw+"'";
			rs = gestorDB.consultaRegistres(consultaSQL);
			
			
			if(rs.first()){
				return true;
			}else{
				return false;
			}
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	public void altaUsuari(Usuari usuari){
		String consultaSQL="INSERT INTO Usuari VALUES(id_usuari,'"+usuari.getNIF()+"','"+usuari.getPasswd()+"','"+usuari.getNom()+"','"+usuari.getCognom1()+"','"+usuari.getCognom2()+"',NOW(),'"+usuari.getMail()+"')";
		gestorDB.modificarRegistre(consultaSQL);
		
	}
	
	
	public int consultaID(String nif){
		int id = 0;
		try{
			
			ResultSet rs=null;
			String consultaSQL="SELECT Id_usuari FROM usuari WHERE nif='"+nif+"';";
			rs=gestorDB.consultaRegistres(consultaSQL);
			rs.next();
			id=rs.getInt("Id_usuari");
		}catch(SQLException e){
			System.out.println("Error consulta ID");
		}
		return id;
	}
	

	public Object[] consultaNifs(String nif){
		ResultSet rs = null;
		String consultaSQL = "SELECT NIF FROM usuari";
		rs = gestorDB.consultaRegistres(consultaSQL);
		ArrayList<Object> fila = new ArrayList<>();
		int i=0;
		try{
			while(rs.next()){
				for(i=0; i<1; i++){
					fila.add(rs.getObject(i+1));
				}
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return fila.toArray();
	}

	public void tancarConn() {
		gestorDB.tancarConnexio();
	}
}