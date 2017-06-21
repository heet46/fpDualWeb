package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Alumne;
import model.AlumneDAO;
import model.Centre;
import model.CentreDAO;
import model.Tutor;
import model.TutorDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class CercarAlumne
 */
@WebServlet("/CercarAlumne")
public class CercarAlumne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CercarAlumne() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Alumne alumne = new Alumne();
		AlumneDAO aDAO = new AlumneDAO();
		Tutor tutor = new Tutor();
		Centre centre = new Centre();

		tutor.setNom(request.getParameter("tutor"));
		centre.setNom(request.getParameter("centre"));
		
		alumne.setNIF(request.getParameter("nif"));
		alumne.setNom(request.getParameter("nom"));
		alumne.setTutor(tutor);
		alumne.setCentre(centre);
		
		aDAO.cercarAlumne(alumne);
		
		System.out.println(alumne);
	}

}
