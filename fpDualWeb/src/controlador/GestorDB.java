package controlador;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class GestorDB {

	protected String url;
	protected Connection conn;
	protected Statement stmt;
	
	public GestorDB(String server, int port, String bd){
		this.url = "jdbc:mysql://"+server+":"+port+"/"+bd;
		try{
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, Constants.DBUSER, Constants.DBPW);
		}catch(Exception e){
			e.getMessage();
			e.printStackTrace();
			e.getClass().getName();
		}
	}
	
	public GestorDB(){}
	
	public int modificarRegistre(String consultaSQL) throws SQLException {
		int numeroFilesAfectades = 0;
			stmt = conn.createStatement(); // Statement permet executar la consulta SQL
			numeroFilesAfectades = stmt.executeUpdate(consultaSQL);

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