package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CentreDAO;

@WebServlet("/centreEliminarCentress")
public class centreEliminarCentress extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public centreEliminarCentress() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String id = request.getParameter("nidecentre");

		CentreDAO cdao = new CentreDAO();
		try {
			cdao.donarBaixa(id);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		response.sendRedirect("pages/cBuscarCentres.jsp");
	}

}