package model;

import java.sql.ResultSet;
import java.sql.SQLException;

import controlador.Constants;
import controlador.GestorDB;

public class AdministradorDAO {
	GestorDB gestorDB;
	String sentenciaSQL;

	public AdministradorDAO() {
		gestorDB = new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}

	// Basics
	public int alta(String idUsuari) throws SQLException {

		String consultaSQL = "UPDATE usuari SET permisos=4 WHERE id_usuari LIKE " + idUsuari + ";";
		System.out.println(consultaSQL);
		return gestorDB.modificarRegistre(consultaSQL);
	}

	public void baixa() {

	}

	public ResultSet llistar() {
		String consultaSQL = "SELECT * FROM usuari WHERE permisos LIKE 4";
		return gestorDB.consultaRegistres(consultaSQL);
	}

	public void modificar() {

	}

	// Altres concrets

	public ResultSet consultarUsuarisNoAdmins() {
		String consultaSQL = "SELECT * FROM usuari WHERE permisos NOT LIKE 4";
		return gestorDB.consultaRegistres(consultaSQL);
	}
}
