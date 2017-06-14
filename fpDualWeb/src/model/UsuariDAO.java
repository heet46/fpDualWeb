package model;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class UsuariDAO {

	GestorDB gestorDB;
	
	public UsuariDAO(){
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public List<String> validarLogin(Usuari usuari){
		ResultSet rs = null;
		List<String> llista = new ArrayList<String>();
	    try {
			rs = gestorDB.consultaRegistres("SELECT NIF, password FROM usuari WHERE NIF='"+usuari.getNIF()+"' AND password='"+usuari.getPasswd()+"'");
			while(rs.next()){
				llista.add(rs.getString("NIF"));
				llista.add(rs.getString("password"));
			}
		} catch (SQLException e) {
			System.out.println("error xsda");
		}
		
		return llista;
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
	
	
	public int consultaID(String nif) throws SQLException{
		String consultaSQL="SELECT id_usuari FROM usuari WHERE nif='"+nif+"';";
		ResultSet rs=gestorDB.consultaRegistres(consultaSQL);
		int id=0;
		while(rs.next()){
			id=rs.getInt("id_usuari");
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
	
	public List<String> valorsUsuari(String nif, String passwd) throws SQLException{
		List<String> llista = new ArrayList<String>();
		ResultSet rs = null;
		String consultaSQL = "SELECT u.nom, u.primer_cognom, u.mail "
				+ "FROM usuari AS u "
				+ "WHERE u.NIF='"+nif+"' AND u.password='"+passwd+"'";
		rs = gestorDB.consultaRegistres(consultaSQL);
		while(rs.next()){
			llista.add(rs.getString("nom"));
			llista.add(rs.getString("primer_cognom"));
			llista.add(rs.getString("mail"));
		}
		return llista;
	}

	public void tancarConn() {
		gestorDB.tancarConnexio();
	}
}