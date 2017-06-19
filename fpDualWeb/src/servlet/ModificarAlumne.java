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
			request.getSession().setAttribute("nif", valorsAlumne.get(0));
			request.getSession().setAttribute("password", valorsAlumne.get(1));
			request.getSession().setAttribute("nom", valorsAlumne.get(2));
			String cognoms = valorsAlumne.get(3)+" "+valorsAlumne.get(4);
			request.getSession().setAttribute("cognoms", cognoms);
			request.getSession().setAttribute("mail", valorsAlumne.get(5));
			System.out.println("MAIL DB: "+valorsAlumne.get(5));
			request.getSession().setAttribute("dataInici", valorsAlumne.get(6));
			request.getSession().setAttribute("dataFinal", valorsAlumne.get(7));
			request.getSession().setAttribute("tutor", valorsAlumne.get(8));
			request.getSession().setAttribute("centre", valorsAlumne.get(9));
			
			response.sendRedirect("pages/modificarAlumne2.jsp");
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String cognom1 = null;
		String cognom2 = null;
		int id = Integer.parseInt(request.getParameter("idUsuari"));
		String dni = request.getParameter("dni");
		String password = request.getParameter("password");
		String nom = request.getParameter("nom");
		String cognoms = request.getParameter("cognoms");
		String email = request.getParameter("email");
		System.out.println("MAIL BO: "+email);
		String sTutor = request.getParameter("tutor");
		String sCentre = request.getParameter("centre");
		String sDataInici = request.getParameter("dataInici");
		String sDataFinal = request.getParameter("dataFinal");
		int idTutor = 0;
		int idCentre = 0;
		
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
		
		Centre centre = new Centre();
		centre.setNom(sCentre);
		
		CentreDAO cDAO = new CentreDAO();
		try{
			idCentre = cDAO.idCentre(sCentre);
			centre.setIdCentre(idCentre);
		}catch( SQLException e){
			e.printStackTrace();
		}
		Alumne alumne = new Alumne();
		AlumneDAO aDAO = new AlumneDAO();
		
		alumne.setNIF(dni);
		alumne.setDataInici(sDataInici);
		alumne.setDataFi(sDataFinal);
		alumne.setCentre(centre);
		alumne.setTutor(tutor);
		
		try {
			aDAO.modificarAlumne(usuari, alumne);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		response.sendRedirect("pages/llistatAlumnes.jsp");
		
	}

}
