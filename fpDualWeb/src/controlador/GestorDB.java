package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestorDB {

	protected String url;
	protected Connection conn = null;
	protected Statement stmt = null;
	
	public GestorDB(String server, int port, String bd){
		this.url = "jdbc:mysql://"+server+":"+port+"/"+bd;
		try{
			Class.forName(Constants.DRIVER).newInstance();
			conn = DriverManager.getConnection(url, Constants.DBUSER, Constants.DBPW);
		}catch(Exception e){
			System.out.println("No puc instanciar el driver MySQL !");
		}
	}
	
	public int modificarRegistre(String consultaSQL) {
		int numeroFilesAfectades = 0;
		try {
			stmt = conn.createStatement(); // Statement permet executar la
											// consulta SQL
			numeroFilesAfectades = stmt.executeUpdate(consultaSQL);
		} catch (SQLException e) {
			// e.printStackTrace();
			System.out.printf("La consulta no s'ha pogut executar", e);
		}
		return numeroFilesAfectades;
	}
	
	public ResultSet consultaRegistres(String sentencia){
		ResultSet rs = null;
		try{
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sentencia);
		}catch(Exception e){
			System.out.println("Error al consultar registres");
		}
		return rs;
	}
	
	
	public void tancarConnexio() {
		try {
			if (conn != null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}