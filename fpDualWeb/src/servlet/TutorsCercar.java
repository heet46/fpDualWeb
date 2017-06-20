package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TutorDAO;

/**
 * Servlet implementation class CercarTutors
 */
@WebServlet("/TutorsCercar")
public class TutorsCercar extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorsCercar() {
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
		request.setAttribute("nom",nom);
		RequestDispatcher rd=request.getRequestDispatcher("pages/llistaTutors.jsp");
		String cognom=(String)request.getParameter("Cognom");
		request.setAttribute("cognom",cognom);
		rd=request.getRequestDispatcher("pages/llistaTutors.jsp");
		String NIF=(String)request.getParameter("NIF");
		request.setAttribute("NIF",NIF);
		rd=request.getRequestDispatcher("pages/llistaTutors.jsp");
		response.sendRedirect("pages/llistaTutors.jsp");
     	System.out.println(NIF+","+nom+","+cognom);
	}

}
