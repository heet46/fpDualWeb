package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Activitat;

/**
 * Servlet implementation class ModificarActivitats
 */
@WebServlet("/ModificarActivitats")
public class ModificarActivitats extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public ModificarActivitats() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String id = request.getParameter("idModificar");
		System.out.println(id);
		
		request.getSession().setAttribute("id", id);
		response.sendRedirect("pages/modificarActivitats.jsp");
	}

}
