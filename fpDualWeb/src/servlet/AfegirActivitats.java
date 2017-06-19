package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.*;

/**
 * Servlet implementation class AfegirActivitats
 */
@WebServlet("/AfegirActivitats")
public class AfegirActivitats extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AfegirActivitats() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String autoId = request.getParameter("auto1");
		int auto = Integer.parseInt(autoId);
		String codi = request.getParameter("codi");
		String descripcio = request.getParameter("descripcio");
		String id = request.getParameter("id");
		
		Activitat activitat = new Activitat();
		ActivitatDAO aDAO = new ActivitatDAO();
		
		activitat.setCodi(codi);
		activitat.setDescripcio(descripcio);
		activitat.setId(id);
		
		if(auto == 1){
			try {
				aDAO.altaActivitat(activitat);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}else{
			try {
				aDAO.altaActivitatManual(activitat);
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		 
		response.sendRedirect("pages/llistatActivitats.jsp");
	}

}
