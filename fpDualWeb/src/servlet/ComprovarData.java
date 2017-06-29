package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Alumne;
import model.Registre;
import model.RegistreDAO;
import model.UsuariDAO;

@WebServlet("/ComprovarData")
public class ComprovarData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ComprovarData() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().removeAttribute("nRegistres");
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat DATE_FORMAT2 = new SimpleDateFormat("dd/MM/yyyy");
		
		String data = request.getParameter("data");
		request.getSession().setAttribute("afgData", data);
		String nif = request.getSession().getAttribute("nif").toString();
		
		
		UsuariDAO uDAO = new UsuariDAO();
		int id = uDAO.consultaID(nif);
		uDAO.tancarConn();
		Alumne alum = new Alumne();
		alum.setIdUsuari(id);
		
		Date date;
		String data2 = null;
		try {
			date = DATE_FORMAT2.parse(data);
			data2 = DATE_FORMAT.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Registre registre = new Registre();
		RegistreDAO rDAO = new RegistreDAO();
		registre.setData(data2);
		registre.setAlumne(alum);
		
		request.getSession().setAttribute("dataRegistre", data2);
		List<Object> llista;
		int nRegistres;

		try {
			llista = rDAO.valorsData(registre);
			if(llista.isEmpty()){				
				request.getSession().setAttribute("nRegistres", 0);
				response.sendRedirect("pages/afegirRegistre.jsp");
			}else{
				int hores = rDAO.sumaHores(registre);
				if(hores >= 9){
					request.getSession().setAttribute("horesMaximes", 1);
					//Num de registres en una data i un alumne determinats
					nRegistres = llista.size()/3;
					request.getSession().setAttribute("nRegistres", nRegistres);
					
					//Num d'hores restants a introduir
					int restants = 9 - hores;
					request.getSession().setAttribute("hRestants", restants);
					
					request.getSession().setAttribute("llistaRegistre", llista);
					response.sendRedirect("pages/afegirRegistre.jsp");
					
				}else{
					//Num de registres en una data i un alumne determinats
					nRegistres = llista.size()/3;
					request.getSession().setAttribute("nRegistres", nRegistres);
					
					//Num d'hores restants a introduir
					int restants = 9 - hores;
					request.getSession().setAttribute("hRestants", restants);
					
					//Passar la llista de valors
					request.getSession().setAttribute("llistaRegistre", llista);
					response.sendRedirect("pages/afegirRegistre.jsp");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
