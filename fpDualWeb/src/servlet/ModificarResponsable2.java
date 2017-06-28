package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CentreDAO;
import model.Tutor;
import model.TutorDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class ModificarResponsable2
 */
@WebServlet("/ModificarResponsable2")
public class ModificarResponsable2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarResponsable2() {
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
		CentreDAO cDAO=new CentreDAO();
		String idVella=(String)request.getParameter("IdVella");
		int permis=Integer.parseInt(request.getParameter("permis"));
		Usuari u=new Usuari();
		u.setNIF(request.getParameter("NIF"));
		u.setPasswd(request.getParameter("pass"));
		u.setNom(request.getParameter("nom"));
		u.setCognom1(request.getParameter("Pcognom"));
		u.setCognom2(request.getParameter("Scognom"));
		u.setMail(request.getParameter("mail"));
		u.setPermis(3);
		try {
			u.setIdCentre(cDAO.idCentre(request.getParameter("centre")));
			System.out.println(idVella);
			uDAO.modificarUsuari(idVella, u);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		doGet(request, response);
		if(permis==3){
			response.sendRedirect("pages/responsables.jsp");
		}else{
			response.sendRedirect("pages/responsablesGestio.jsp");
		}
	}

}
