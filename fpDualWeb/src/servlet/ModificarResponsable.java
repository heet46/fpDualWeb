package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class ModificarResponsable
 */
@WebServlet("/ModificarResponsable")
public class ModificarResponsable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModificarResponsable() {
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
		String NIF=request.getParameter("NIF").toString();
		Usuari usu=uDAO.consultaUsuari(NIF);
		uDAO.tancarConn();
		
		
		response.setContentType("text/html");
		request.getSession().setAttribute("NIF", usu.getNIF());
		request.getSession().setAttribute("password", usu.getPasswd());
		request.getSession().setAttribute("nom", usu.getNom());
		request.getSession().setAttribute("Pcognom", usu.getCognom1());
		request.getSession().setAttribute("Scognom", usu.getCognom2());
		request.getSession().setAttribute("mail", usu.getMail());
	
		response.sendRedirect("pages/responsablesModificar2.jsp");
	}
	

}
