package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Tutor;
import model.TutorDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class modificarTutors2
 */
@WebServlet("/modificarTutors2")
public class modificarTutors2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarTutors2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuariDAO uDAO=new UsuariDAO();
		TutorDAO tDAO=new TutorDAO();
		String idVella=request.getParameter("IdVella");
		int permis=Integer.parseInt(request.getParameter("permis"));
		Usuari u=new Usuari();
		System.out.println(idVella);
		try {
			u.setNIF(request.getParameter("NIF"));
			System.out.println(request.getParameter("centree"));
			u.setPasswd(request.getParameter("pass"));
			u.setNom(request.getParameter("nom"));
			u.setCognom1(request.getParameter("Pcognom"));
			u.setCognom2(request.getParameter("Scognom"));
			u.setMail(request.getParameter("mail"));
			u.setPermis(2);
			u.setIdCentre(Integer.parseInt(request.getParameter("centre")));
			uDAO.modificarUsuari(idVella, u);
			tDAO.modificarTutor(new Tutor(uDAO.consultaID(request.getParameter("NIF")),request.getParameter("tecno")));
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
		if(permis!=2){
			response.sendRedirect("pages/tutorsConsulta.jsp");
		}else{
			response.sendRedirect("pages/tutors.jsp");
		}
	}

}
