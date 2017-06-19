package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class CentreDAO {
	GestorDB gestorDB;
	String sentenciaSQL;

	public CentreDAO() {
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}

	public List<Integer> consultaIDCentre() {
		String consultaSQL = "SELECT Id_centre FROM centre;";
		ResultSet rs;
		List<Integer> dades = new ArrayList<Integer>();
		try {

			rs = gestorDB.consultaRegistres(consultaSQL);
			while (rs.next()) {
				dades.add(rs.getInt("id_centre"));
			}

			rs = gestorDB.consultaRegistres(consultaSQL);
			while (rs.next()) {
				dades.add(rs.getInt("Id_centre"));
			}

		} catch (SQLException e) {
			System.out.println("Error consulta id centre " + e.toString());
		}
		return dades;
	}

	public int altaCentreEntradaId(int idcentre, String nom, int codi, int telefon, String web) throws SQLException {
		int e = 0;
		sentenciaSQL = "INSERT INTO centre (Id_centre, Nom, Codi, Telefon, Web) VALUES(" + idcentre + ", '" + nom
				+ "', " + codi + ", " + telefon + ", '" + web + "');";
		e = gestorDB.modificarRegistre(sentenciaSQL);
		return e;

	}

	public void altaCentreAuto(String nom, int codi, int telefon, String web) throws SQLException {
		sentenciaSQL = "INSERT INTO centre (Nom, Codi, Telefon, Web) " + "VALUES('" + nom + "', " + codi + ", "
				+ telefon + ", '" + web + "');";
		gestorDB.modificarRegistre(sentenciaSQL);
	}

	public int consultaIDAlta(boolean enters, String comprova, int idcentre) {
		ResultSet retorn;
		int i = 0;
		idcentre = Integer.parseInt(comprova);
		String consultarid = "SELECT * FROM centre WHERE Id_centre LIKE " + idcentre + ";";
		retorn = gestorDB.consultaRegistres(consultarid);
		try {
			i = 0;
			while (retorn.next()) {
				i++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return i;
	}

	public ResultSet consultarIdNoms() {
		ResultSet retorn;
		String consultaSQL = "SELECT id_centre, Nom FROM centre;";
		retorn = gestorDB.consultaRegistres(consultaSQL);
		return retorn;
	}

	public int consultarRegID(String id) {
		ResultSet retorn;
		int i = 0;
		String consultarid = "SELECT id_centre FROM centre WHERE id_centre LIKE " + id + ";";

		try {
			retorn = gestorDB.consultaRegistres(consultarid);

			while (retorn.next()) {
				i++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return i;
	}

	public int donarBaixa(String id) throws SQLException {
		int i = 0;
		sentenciaSQL = "DELETE FROM centre WHERE id_centre LIKE '" + id + "';";
		i = gestorDB.modificarRegistre(sentenciaSQL);
		return i;
	}

	public ResultSet consultarCentres() {
		String consultaSQL = "SELECT * FROM centre";
		return gestorDB.consultaRegistres(consultaSQL);
	}
	
	public List<String> nomsCentres() throws SQLException{
		List<String> centres = new ArrayList<String>();
		ResultSet rs = null;
		String consultaSQL = "SELECT nom FROM centre";
		
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			centres.add(rs.getString(1));
		}
		return centres;
	}
	
	public int idCentre(String nom) throws SQLException{
		int id=0;
		ResultSet rs = null;
		String consultaSQL = "SELECT c.Id_centre "
				+ "FROM centre AS c "
				+ "WHERE c.Nom='"+nom+"'";
		rs = gestorDB.consultaRegistres(consultaSQL);
		
		while(rs.next()){
			id = rs.getInt(1);
		}
		return id;
	}

	public void tancarCon() {
		gestorDB.tancarConnexio();
	}

}