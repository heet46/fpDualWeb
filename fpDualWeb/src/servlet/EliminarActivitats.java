package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class EliminarActivitats
 */
@WebServlet("/EliminarActivitats")
public class EliminarActivitats extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EliminarActivitats() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = request.getParameter("idActivitat");
		int id = Integer.parseInt(sId);
		System.out.println(id);
		
		Activitat activitat = new Activitat();
		activitat.setId(sId);
		
		ActivitatDAO aDAO = new ActivitatDAO();
		aDAO.baixaActivitat(activitat);
		
		response.sendRedirect("pages/eliminarActivitats.jsp");
		
	}

}
