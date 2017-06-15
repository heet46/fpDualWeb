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
public class ModificarTutor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarTutor() {
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
		Usuari usu=new Usuari();
		String NIF=(String)request.getParameter("NIF");
		usu=uDAO.consultaUsuari(NIF);
		String tecno=tDAO.consultaTecno(uDAO.consultaID(NIF));
		
		response.setContentType("text/html");
		request.getSession().setAttribute("NIF", usu.getNIF());
		request.getSession().setAttribute("password", usu.getPasswd());
		request.getSession().setAttribute("nom", usu.getNom());
		request.getSession().setAttribute("Pcognom", usu.getCognom1());
		request.getSession().setAttribute("Scognom", usu.getCognom2());
		request.getSession().setAttribute("mail", usu.getMail());
		request.getSession().setAttribute("tecno", tecno);
		
		response.sendRedirect("/fpDualWeb/pages/tutorsModificar2.jsp");
	}

}
