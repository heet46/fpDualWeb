package servlet;

import java.io.IOException;
import java.sql.SQLException;
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
		String cognom1 = "";
		String cognom2 = "";
		String dni = request.getParameter("dni");
		String password = request.getParameter("password");
		String nom = request.getParameter("nom");
		String cognoms = request.getParameter("cognoms");
		String email = request.getParameter("email");
		String sTutor = request.getParameter("tutor");
		String sCentre = request.getParameter("centre");
		String sDataInici = request.getParameter("dataInici");
		String sDataFinal = request.getParameter("dataFinal");
		int idTutor = 0;
		int idCentre = 0;
		
		HttpSession session = request.getSession();
		
		Usuari usuari = new Usuari();
		UsuariDAO uDAO = new UsuariDAO();
		
		usuari.setNIF(dni);
		usuari.setPasswd(password);
		usuari.setNom(nom);
		
		StringTokenizer st = new StringTokenizer(cognoms);

		if(st.countTokens() > 1){
			cognom1 = st.nextToken();
			while(st.hasMoreTokens()){
				cognom2 += st.nextToken()+" ";
			}
			usuari.setCognom1(cognom1);
			usuari.setCognom2(cognom2);
		}else{
			usuari.setCognom1(cognoms);
			usuari.setCognom2("");
		}
		
		usuari.setMail(email);
		
		Tutor tutor = new Tutor();
		tutor.setNom(sTutor);

		TutorDAO tDAO = new TutorDAO();
		try {
			idTutor = tDAO.idTutor(sTutor);
			tutor.setId_usuari(idTutor);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		tDAO.tancarConn();

		Centre centre = new Centre();
		centre.setNom(sCentre);
		
		CentreDAO cDAO = new CentreDAO();
		try{
			idCentre = cDAO.idCentre(sCentre);
			centre.setIdCentre(idCentre);
		}catch( SQLException e){
			e.printStackTrace();
		}			
		cDAO.tancarCon();

		Alumne alumne = new Alumne();
		AlumneDAO aDAO = new AlumneDAO();
		
		alumne.setNIF(dni);
		alumne.setDataInici(sDataInici);
		alumne.setDataFi(sDataFinal);
		alumne.setCentre(centre);
		alumne.setTutor(tutor);
		
		try {
			uDAO.altaUsuari(usuari);
			aDAO.altaAlumne(alumne);
			
			uDAO.tancarConn();
			aDAO.tancarConn();
			session.setAttribute("duplicat", 0);
	        response.sendRedirect("pages/alumnes.jsp");
		} catch (SQLException e) {
			uDAO.tancarConn();
			aDAO.tancarConn();
			session.setAttribute("duplicat", 1);
			response.sendRedirect("pages/afegirAlumne.jsp");
		}

	}

}
