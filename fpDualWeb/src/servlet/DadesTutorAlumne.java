package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.TutorDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class DadesTutorAlumne
 */
@WebServlet("/DadesTutorAlumne")
public class DadesTutorAlumne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DadesTutorAlumne() {
        super();
        // TODO Auto-generated constructor stub
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	doPost(request,response);	
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuariDAO uDAO=new UsuariDAO();
		TutorDAO tDAO=new TutorDAO();
		String NIF=request.getSession().getAttribute("nif").toString();
		System.out.println(NIF);
		int id=uDAO.consultaID(NIF);
		request.getSession().setAttribute("idAl",id);
		response.sendRedirect("pages/llistaTutorAlumneT.jsp");
		
	}

}
