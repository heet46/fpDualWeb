package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Activitat;
import model.Alumne;
import model.Registre;
import model.RegistreDAO;
import model.UsuariDAO;

/**
 * Servlet implementation class AfegirRegistre
 */
@WebServlet("/AfegirRegistre")
public class AfegirRegistre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public AfegirRegistre() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RegistreDAO rDAO = new RegistreDAO();
		UsuariDAO uDAO = new UsuariDAO();
		Registre registre = new Registre();
		Activitat act = new Activitat();
		Alumne alum = new Alumne();
		int hores = Integer.parseInt(request.getParameter("hores"));
		String activitat = request.getParameter("activitat");
		String nifAlumne = request.getSession().getAttribute("nif").toString();
		
		String data = request.getSession().getAttribute("dataRegistre").toString();

		try {
			int idActivitat = rDAO.idActivitat(activitat);
			int idAlumne = uDAO.consultaID(nifAlumne);
			act.setId(""+idActivitat);
			alum.setIdUsuari(idAlumne);
			
			registre.setActivitat(act);
			registre.setAlumne(alum);
			registre.setData(data);
			registre.setHores(hores);
			
			rDAO.afegirRegistre(registre);			
			
			response.sendRedirect("pages/registre.jsp");
		} catch (SQLException e) { 
			System.out.println("Error clau primari ja inserida");
		}
	}

}
