package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.StringTokenizer;

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


@WebServlet("/ModificarAlumne")
public class ModificarAlumne extends HttpServlet {
	private static final long serialVersionUID = 1L;
	AlumneDAO aDAO;

    public ModificarAlumne() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		aDAO = new AlumneDAO();
		String sId = request.getParameter("idUsuari");
		int id = Integer.parseInt(sId);
		
		try {
			List<String> valorsAlumne = aDAO.valorsAlumne(id);
			System.out.println(valorsAlumne.toString());
			
			request.getSession().setAttribute("id", id);
			request.getSession().setAttribute("nifMod", valorsAlumne.get(0));
			request.getSession().setAttribute("passwordMod", valorsAlumne.get(1));
			request.getSession().setAttribute("nomMod", valorsAlumne.get(2));
			String cognoms = valorsAlumne.get(3)+" "+valorsAlumne.get(4);
			request.getSession().setAttribute("cognomsMod", cognoms);
			request.getSession().setAttribute("mailMod", valorsAlumne.get(5));
			request.getSession().setAttribute("dataIniciMod", valorsAlumne.get(6));
			request.getSession().setAttribute("dataFinalMod", valorsAlumne.get(7));
			request.getSession().setAttribute("tutorMod", valorsAlumne.get(8));
			request.getSession().setAttribute("centreMod", valorsAlumne.get(9));
			
			aDAO.tancarConn();
			
			response.sendRedirect("pages/modificarAlumne2.jsp");
		} catch (SQLException e) {
			aDAO.tancarConn();
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cognom1 = "";
		String cognom2 = "";
		int id = Integer.parseInt(request.getParameter("idUsuari"));
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
		
		request.getSession().setAttribute("dni2", dni);
		request.getSession().setAttribute("password2", password);
		request.getSession().setAttribute("nom2", nom);
		request.getSession().setAttribute("cognoms2", cognoms);
		request.getSession().setAttribute("email2", email);
		request.getSession().setAttribute("tutor2", sTutor);
		request.getSession().setAttribute("centre2", sCentre);
		request.getSession().setAttribute("dataInici2", sDataInici);
		request.getSession().setAttribute("dataFinal2", sDataFinal);
		
		Usuari usuari = new Usuari();
		
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
		
		usuari.setIdUsuari(id);
		usuari.setNIF(dni);
		usuari.setPasswd(password);
		usuari.setNom(nom);

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
			aDAO.modificarAlumne(usuari, alumne);
			aDAO.tancarConn();
			request.getSession().setAttribute("duplicat", 0);
			response.sendRedirect("pages/index.jsp");
		} catch (SQLException e) {
			aDAO.tancarConn();
			request.getSession().setAttribute("duplicat", 1);
			response.sendRedirect("pages/modificarAlumne2.jsp");
		}
		
	}

}
