package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Tutor;
import model.TutorDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class modificarTutor
 */
@WebServlet("/modificarTutor")
public class modificarTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarTutor() {
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
		
		Usuari usu=new Usuari();
		String NIF=(String)request.getParameter("NIF");
		
		usu=uDAO.consultaUsuari(NIF);
		
		response.setContentType("text/html");
		request.setAttribute("NIF", usu.getNIF());
		request.setAttribute("password", usu.getPasswd());
		request.setAttribute("nom", usu.getNom());
		request.setAttribute("Pcognom", usu.getCognom1());
		request.setAttribute("Scognom", usu.getCognom2());
		request.setAttribute("mail", usu.getMail());
		
		response.sendRedirect("/fpDualWeb/pages/tutorsModificar2.jsp");
	}

}
