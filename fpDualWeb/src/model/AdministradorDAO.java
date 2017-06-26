package model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import controlador.Constants;
import controlador.GestorDB;

public class AdministradorDAO {
	GestorDB gestorDB;
	String sentenciaSQL;

	public AdministradorDAO() throws SQLException {
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}

	// Basics
	public void alta() throws SQLException {

	}

	public void baixa(int id) throws SQLException {

		sentenciaSQL = "DELETE FROM usuari WHERE id_usuari=" + id + ";";
		gestorDB.modificarRegistre(sentenciaSQL);

	}

	public ResultSet llistar() throws SQLException {
		String sentenciaSQL = "SELECT * FROM usuari WHERE permisos LIKE 4";
		return gestorDB.consultaRegistres(sentenciaSQL);
	}

	public void modificar(Administrador a) {

	}

	// Altres concrets

	public ResultSet consultarUsuarisNoAdmins() throws SQLException {
		sentenciaSQL = "SELECT * FROM usuari WHERE permisos NOT LIKE 4";
		return gestorDB.consultaRegistres(sentenciaSQL);
	}

	public List<Usuari> LlistarAdmins() throws SQLException {
		sentenciaSQL = "SELECT * " + "FROM usuari WHERE permisos = 4;";
		ResultSet rs = null;
		List<Usuari> llista = new ArrayList<Usuari>();
		rs = gestorDB.consultaRegistres(sentenciaSQL);
		while (rs.next()) {
			llista.add(new Usuari(rs.getString("NIF"), rs.getString("password"), rs.getString("nom"),
					rs.getString("primer_cognom"), rs.getString("segon_cognom"), rs.getString("mail"),
					rs.getInt("permisos")));
			System.out.println(llista.get(0).getNIF());
		}
		rs.close();
		return llista;
	}

	public void tancarCon() {
		gestorDB.tancarConnexio();
	}

	public void modificarAdmin(String NIF, Administrador administrador) throws SQLException {
		String consultaSQL = "UPDATE usuari SET NIF='" + administrador.getNIF() + "'," + "password='"
				+ administrador.getPasswd() + "'," + "nom='" + administrador.getNom() + "'," + "primer_cognom='"
				+ administrador.getCognom1() + "'," + "segon_cognom='" + administrador.getCognom2() + "',mail='"
				+ administrador.getMail() + "',permisos=4" + ",id_centre=" + null + " WHERE nif='" + NIF + "';";
		System.out.println(administrador.getIdCentre());
		System.out.println("La consulta de Modificar Admin ->" + consultaSQL);
		gestorDB.modificarRegistre(consultaSQL);
	}

}
