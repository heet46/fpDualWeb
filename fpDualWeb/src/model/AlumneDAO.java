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
	
	public List<Alumne> llistaTotsAlumnes() throws SQLException{
		List<Alumne> alumnes = new ArrayList<Alumne>();
		ResultSet rs = null;
		String consultaSQL = "SELECT u.id_usuari, u.nom AS nom_alumne, u.primer_cognom, c.Nom AS nom_centre, u2.nom AS nom_tutor "
				+ "FROM usuari AS u, usuari AS u2, alumne AS a, centre AS c "
				+ "WHERE u2.id_usuari=a.id_tutor AND u.id_usuari=a.id_usuari AND c.Id_centre=a.id_centre";
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			Alumne alumne = new Alumne();
			Centre centre = new Centre();
			Tutor tutor = new Tutor();
			alumne.setIdUsuari(rs.getInt(1));
			alumne.setNom(rs.getString(2));
			alumne.setCognom1(rs.getString(3));
			centre.setNom(rs.getString(4));
			alumne.setCentre(centre);
			tutor.setNom(rs.getString(5));
			alumne.setTutor(tutor);
			alumnes.add(alumne);
		}
		
		return alumnes;
	}
	
	public void tancarConn(){
		gestorDB.tancarConnexio();
	}
}