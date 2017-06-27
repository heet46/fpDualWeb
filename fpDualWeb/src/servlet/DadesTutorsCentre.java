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
import model.UsuariDAO;

/**
 * Servlet implementation class DadesTutorsCentre
 */
@WebServlet("/DadesTutorsCentre")
public class DadesTutorsCentre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DadesTutorsCentre() {
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
		String NIF=request.getParameter("NIF");
		UsuariDAO uDAO=new UsuariDAO();
		int id=uDAO.consultaID(NIF);
		request.getSession().setAttribute("idTut", id);
		response.sendRedirect("pages/llistaTutorsCentreT.jsp");
	}

}
