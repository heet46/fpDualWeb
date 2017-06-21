package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		HttpSession session = request.getSession();
		Alumne alumne = new Alumne();
		AlumneDAO aDAO = new AlumneDAO();
		Tutor tutor = new Tutor();
		Centre centre = new Centre();
		
		String nif;
		String nom;
		String cognom1;
		String cognom2;
		String mail;
		String stutor;
		String scentre;
		
		nif = request.getParameter("dni");
		nom = request.getParameter("nom");
		cognom1 = request.getParameter("cognom1");
		cognom2 = request.getParameter("cognom2");
		mail = request.getParameter("mail");
		stutor = request.getParameter("tutor");
		scentre = request.getParameter("centre");
		
		tutor.setNom(stutor);
		centre.setNom(scentre);
		
		alumne.setNIF(nif);
		alumne.setNom(nom);
		alumne.setCognom1(cognom1);
		alumne.setCognom2(cognom2);
		alumne.setMail(mail);
		alumne.setTutor(tutor);
		alumne.setCentre(centre);
				
		List<Alumne> llista;
		try {
			llista = aDAO.cercarAlumne(alumne);
			session.setAttribute("list", llista);
			aDAO.tancarConn();
			response.sendRedirect("pages/cercarAlumne.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
	}

}
