package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class CercarResponsables
 */
@WebServlet("/CercarResponsables")
public class CercarResponsables extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CercarResponsables() {
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
		String nom=(String)request.getParameter("Nom");
		request.getSession().setAttribute("nom",nom);
		String cognom=(String)request.getParameter("Cognom");
		request.getSession().setAttribute("cognom",cognom);
		String NIF=(String)request.getParameter("NIF");
		request.getSession().setAttribute("NIF",NIF);
		response.sendRedirect("pages/llistaResponsables.jsp");
     	System.out.println(NIF+","+nom+","+cognom);
	}

}
