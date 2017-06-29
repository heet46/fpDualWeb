package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EditarRegistre
 */
@WebServlet("/ModificarRegistre")
public class ModificarRegistre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ModificarRegistre() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("horesMaximes", 0);
		request.getSession().setAttribute("editarRegistre", 1);
		response.sendRedirect("pages/afegirRegistre.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getSession().setAttribute("editarRegistre", 0);
		response.sendRedirect("pages/afegirRegistre.jsp");
	}

}
