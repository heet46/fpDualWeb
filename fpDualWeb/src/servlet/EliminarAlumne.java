package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.AlumneDAO;

@WebServlet("/EliminarAlumne")
public class EliminarAlumne extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public EliminarAlumne() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String sId = request.getParameter("idUsuari");
		int id = Integer.parseInt(sId);
		
		AlumneDAO aDAO = new AlumneDAO();
		try {
			aDAO.baixaAlumne(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		aDAO.tancarConn();
		response.sendRedirect("pages/eliminarAlumne.jsp");
	}

}
