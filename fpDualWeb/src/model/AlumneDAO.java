package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class AlumneDAO {
	GestorDB gestorDB;
	
	public AlumneDAO(){
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
	public void altaAlumne(Alumne alumne) throws SQLException{

		
		String consultaSQL = "INSERT INTO alumne(id_usuari,data_inici,data_fi,id_centre,id_tutor) "
				+ "SELECT id_usuari, '"+alumne.getDataInici()+"','"+alumne.getDataFi()+"', "+alumne.centre.getIdCentre()+", "+alumne.tutor.id_usuari+" "
				+ "FROM usuari WHERE NIF LIKE '"+alumne.getNIF()+"'";
		System.out.println(consultaSQL);
		gestorDB.modificarRegistre(consultaSQL);
		
	}
	
	public void baixaAlumne(int id) throws SQLException{
		String consultaSQL = "DELETE FROM alumne WHERE id_usuari="+id;
		gestorDB.modificarRegistre(consultaSQL);
		consultaSQL = "DELETE FROM usuari WHERE id_usuari="+id;
		gestorDB.modificarRegistre(consultaSQL);
	}
	
	public Object[] consultaAlumnes() throws SQLException{
		ResultSet rs = null;
		String consultaSQL = "SELECT u.id_usuari, u.nom, u.primer_cognom, a.data_inici, a.data_fi, c.NOM, a.id_tutor "
				+ "FROM alumne AS a, usuari AS u, centre AS c "
				+ "WHERE u.id_usuari=a.id_usuari AND a.id_centre=c.Id_centre";
		ArrayList<Object> fila = new ArrayList<Object>();
		int i = 0;

		rs = gestorDB.consultaRegistres(consultaSQL);
		while(rs.next()){
			for(i=0; i<7; i++){
				fila.add(rs.getObject(i+1));
			}
		}
		
		rs.close();
		return fila.toArray();
	}
	
	public void modificarAlumne(Usuari usuari, Alumne alumne) throws SQLException{
		String consultaSQL = "UPDATE  alumne AS a "
					+ "INNER JOIN usuari AS u "
					+ "ON a.id_usuari = u.id_usuari "
					+ "SET u.NIF='"+usuari.getNIF()+"', u.password='"+usuari.getPasswd()+"', u.nom='"+usuari.getNom()+"', u.primer_cognom='"+usuari.getCognom1()+"', u.segon_cognom='"+usuari.getCognom2()+"', u.mail='"+usuari.getMail()+"', a.data_inici='"+alumne.getDataInici()+"', a.data_fi='"+alumne.getDataFi()+"', a.id_tutor="+alumne.tutor.id_usuari+", a.id_centre="+alumne.centre.getIdCentre()+" "
					+ "WHERE u.id_usuari="+usuari.getIdUsuari();
		System.out.println(consultaSQL);
		gestorDB.modificarRegistre(consultaSQL);
	}
	
	public List<String> consultaIDAlumne() throws SQLException{
		String consultaSQL="SELECT u.id_usuari, u.nom, u.primer_cognom FROM usuari AS u, alumne AS a WHERE a.id_usuari=u.id_usuari";
		ResultSet rs = null;
		List<String> dades = new ArrayList<String>();

		rs = gestorDB.consultaRegistres(consultaSQL);
		while (rs.next()) {
			String strTmp = "";
			strTmp += rs.getInt("id_usuari")+", ";
			strTmp += rs.getString("nom")+" ";
			strTmp += rs.getString("primer_cognom");
			dades.add(strTmp);
		}
		
		rs.close();
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
		
		rs.close();
		
		return alumnes;
	}
	
	public List<String> nomsTutors() throws SQLException{
		List<String> tutors = new ArrayList<String>();
		ResultSet rs = null;
		String consultaSQL = "SELECT u.nom "
				+ "FROM tutor AS t, usuari AS u "
				+ "WHERE t.id_usuari=u.id_usuari";
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			tutors.add(rs.getString(1));
		}
		
		rs.close();
		return tutors;
	}
	
	public List<String> valorsAlumne(int id) throws SQLException{
		List<String> valors = new ArrayList<String>();
		ResultSet rs = null;
		String consultaSQL = "SELECT u.NIF, u.password, u.nom, u.primer_cognom, u.segon_cognom, u.mail, a.data_inici, a.data_fi, u2.nom, c.Nom "
				+ "FROM usuari AS u, usuari AS u2, alumne AS a, centre AS c "
				+ "WHERE u2.id_usuari=a.id_tutor AND u.id_usuari=a.id_usuari AND c.Id_centre=a.id_centre AND u.id_usuari="+id;
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		while(rs.next()){
			valors.add(rs.getString(1)); //NIF
			valors.add(rs.getString(2)); //pw
			valors.add(rs.getString(3)); //nom
			valors.add(rs.getString(4)); //cognom1			 
			valors.add(rs.getString(5)); //cognom2
			valors.add(rs.getString(6)); //mail
			System.out.println(rs.getString(6));
			
			Date dIn = rs.getDate(7);
			String dataInici = df.format(dIn);
			valors.add(dataInici);		 //data inici
			
			Date dFi = rs.getDate(8);
			String dataFinal = df.format(dFi);
			valors.add(dataFinal); 		 //data fi
			
			valors.add(rs.getString(9)); //tutor
			valors.add(rs.getString(10));//centre
		}
		
		rs.close();
		return valors;
	}
	
	public List<Alumne> cercarAlumne(Alumne alumne) throws SQLException{
		List<Alumne> valors = new ArrayList<Alumne>();
		ResultSet rs = null;
		String consultaSQL = "SELECT u.id_usuari, u.NIF, u.nom AS nom_alumne, u.primer_cognom, u.segon_cognom, u.mail, u2.nom AS nom_tutor, c.Nom AS nom_centre "
				+ "FROM usuari AS u, usuari AS u2, alumne AS a, centre AS c "
				+ "WHERE u2.id_usuari=a.id_tutor AND u.id_usuari=a.id_usuari AND c.Id_centre=a.id_centre";
		if(alumne.getNIF() != "" && alumne.getNIF() != null){
			consultaSQL += " AND u.NIF LIKE '%"+alumne.getNIF()+"%'";
		}
		if(alumne.getNom() != "" && alumne.getNom() != null){
			consultaSQL += " AND u.nom LIKE '%"+alumne.getNom()+"%'";
		}
		if(alumne.getCognom1() != "" && alumne.getCognom1() != null){
			consultaSQL += " AND u.primer_cognom LIKE '%"+alumne.getCognom1()+"%'";
		}
		if(alumne.getCognom2() != "" && alumne.getCognom2() != null){
			consultaSQL += " AND u.segon_cognom LIKE '%"+alumne.getCognom2()+"%'";
		}
		if(alumne.getMail() != "" && alumne.getMail() != null){
			consultaSQL += " AND u.mail LIKE '%"+alumne.getMail()+"%'";
		}
		if(alumne.getTutor().getNom() != "" && alumne.getTutor().getNom() != null){
			consultaSQL += " AND u2.nom LIKE '%"+alumne.getTutor().getNom()+"%'";
		}
		if(alumne.getCentre().getNom() != "" && alumne.getCentre().getNom() != null){
			consultaSQL += " AND c.nom LIKE '%"+alumne.getCentre().getNom()+"%'";
		}
		
		System.out.println(consultaSQL);
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			Alumne a = new Alumne();
			Centre c = new Centre();
			Tutor t = new Tutor();
			a.setIdUsuari(rs.getInt(1));
			a.setNIF(rs.getString(2));
			a.setNom(rs.getString(3));
			a.setCognom1(rs.getString(4));
			a.setCognom2(rs.getString(5));
			a.setMail(rs.getString(6));
			t.setNom(rs.getString(7));
			a.setTutor(t);
			c.setNom(rs.getString(8));
			a.setCentre(c);
			valors.add(a);
		}
		
		rs.close();
		
		return valors;
	}
	
	public void tancarConn(){
		gestorDB.tancarConnexio();
	}
}