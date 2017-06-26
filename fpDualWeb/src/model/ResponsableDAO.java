package model;

import java.sql.Statement;

import controlador.Constants;
import controlador.GestorDB;

public class ResponsableDAO {
	String consultaSQL;
	Statement stmt;
	GestorDB g;
		
	public ResponsableDAO(){
		g=new GestorDB(Constants.SERVER, Constants.PORT, Constants.BD);
	}
	
}
