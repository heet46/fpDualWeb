package servlet;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Alumne;
import model.AlumneDAO;
import model.Centre;
import model.Tutor;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class AfegirAlumne
 */
@WebServlet("/AfegirAlumne")
public class AfegirAlumne extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public AfegirAlumne() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cognom1 = null;
		String cognom2 = null;
		String dni = request.getParameter("dni");
		String password = request.getParameter("password");
		String nom = request.getParameter("nom");
		String cognoms = request.getParameter("cognoms");
		String email = request.getParameter("email");
		String sTutor = request.getParameter("tutor");
		String sCentre = request.getParameter("centre");
		String sDataInici = request.getParameter("dataInici");
		String sDataFinal = request.getParameter("dataFinal");

		StringTokenizer st = new StringTokenizer(cognoms);
		while(st.hasMoreTokens()){
			cognom1 = st.nextToken();
			cognom2 = st.nextToken();
		}
		
		Usuari usuari = new Usuari();
		UsuariDAO uDAO = new UsuariDAO();
		
		usuari.setNIF(dni);
		usuari.setPasswd(password);
		usuari.setNom(nom);
		usuari.setCognom1(cognom1);
		usuari.setCognom2(cognom2);
		usuari.setMail(email);
		
		uDAO.altaUsuari(usuari);		
		
		Tutor tutor = new Tutor();
		tutor.setNom(sTutor);

		Centre centre = new Centre();
		centre.setNom(sCentre);
		
		Alumne alumne = new Alumne();
		AlumneDAO aDAO = new AlumneDAO();
		
		alumne.setNIF(dni);
		alumne.setDataInici(sDataInici);
		alumne.setDataFi(sDataFinal);
		alumne.setCentre(centre);
		alumne.setTutor(tutor);
		
		aDAO.altaAlumne(alumne);

	}

}
