package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Activitat;
import model.ActivitatDAO;

/**
 * Servlet implementation class ModificarActivitats2
 */
@WebServlet("/ModificarActivitats2")
public class ModificarActivitats2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ModificarActivitats2() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		String codi = request.getParameter("codi");
		String descripcio = request.getParameter("descripcio");
		String id = request.getParameter("id");
		
		Activitat activitat = new Activitat();
		ActivitatDAO aDAO = new ActivitatDAO();
		
		activitat.setCodi(codi);
		activitat.setDescripcio(descripcio);
		activitat.setId(id);
		System.out.println(codi+", "+descripcio+", "+id);
		
		aDAO.modificarActivitat(activitat);
		
		response.sendRedirect("pages/llistatActivitats.jsp");
	}

}
