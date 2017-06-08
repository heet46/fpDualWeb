package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class AlumneDAO {
	GestorDB gestorDB;
	
	public AlumneDAO(){
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public void altaAlumne(Alumne alumne){

		
		String consultaSQL = "INSERT INTO alumne(id_usuari,data_inici,data_fi,id_centre,id_tutor) "
				+ "SELECT id_usuari, '"+alumne.getDataInici()+"','"+alumne.getDataFi()+"', "+alumne.centre.getIdCentre()+", "+alumne.tutor.getId_usuari()+" "
				+ "FROM usuari WHERE NIF LIKE '"+alumne.getNIF()+"'";
		gestorDB.modificarRegistre(consultaSQL);
		
	}
	
	public void baixaAlumne(int id){
		String consultaSQL = "DELETE FROM alumne WHERE id_usuari="+id;
		gestorDB.modificarRegistre(consultaSQL);
		consultaSQL = "DELETE FROM usuari WHERE id_usuari="+id;
		gestorDB.modificarRegistre(consultaSQL);
	}
	
	public Object[] consultaAlumnes(){
		ResultSet rs = null;
		String consultaSQL = "SELECT u.id_usuari, u.nom, u.primer_cognom, a.data_inici, a.data_fi, c.NOM, a.id_tutor "
				+ "FROM alumne AS a, usuari AS u, centre AS c "
				+ "WHERE u.id_usuari=a.id_usuari AND a.id_centre=c.Id_centre";
		ArrayList<Object> fila = new ArrayList<>();
		int i = 0;
		try{
			rs = gestorDB.consultaRegistres(consultaSQL);
			while(rs.next()){
				for(i=0; i<7; i++){
					fila.add(rs.getObject(i+1));
				}
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return fila.toArray();
	}
	
	public List<String> consultaIDAlumne(){
		String consultaSQL="SELECT u.id_usuari, u.nom, u.primer_cognom FROM usuari AS u, alumne AS a WHERE a.id_usuari=u.id_usuari";
		ResultSet rs = null;
		List<String> dades = new ArrayList<String>();
		int i=0;
		try {
			rs = gestorDB.consultaRegistres(consultaSQL);
			while (rs.next()) {
				String strTmp = "";
				strTmp += rs.getInt("id_usuari")+", ";
				strTmp += rs.getString("nom")+" ";
				strTmp += rs.getString("primer_cognom");
				dades.add(strTmp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dades;
	}
	
	public void tancarConn(){
		gestorDB.tancarConnexio();
	}
}