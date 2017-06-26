package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.*;

/**
 * Servlet implementation class CercarActivitats
 */
@WebServlet("/CercarActivitats")
public class CercarActivitats extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public CercarActivitats() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
		String codi1 = request.getParameter("codi1");
		if(codi1 == null){
			codi1="";
		}else{
			codi1 += ",";
		}
		String codi2 = request.getParameter("codi2");
		if(codi2 == null){
			codi2="";
		}else{
			codi2 += ",";
		}
		String codi3 = request.getParameter("codi3");
		if(codi3 == null){
			codi3="";
		}else{
			codi3 += ",";
		}
		String codi = "("+codi1+codi2+codi3;
		
		if(codi1=="" && codi2=="" && codi3==""){
			codi = "('EXC','TBL','TLL')";
		}
		codi = codi.substring(0, codi.length()-1);
		codi += ")";
		System.out.println(codi);
		
		String descripcio = request.getParameter("descripcio");
		descripcio = "('%"+descripcio+"%')";
		
		Activitat activitat = new Activitat();
		ActivitatDAO aDAO = new ActivitatDAO();
		
		activitat.setCodi(codi);
		activitat.setDescripcio(descripcio);
		
		List<Activitat> llista;
		System.out.println(codi);
			
			try {
				llista = aDAO.cercarActivitat(activitat);
				session.setAttribute("list", llista);
				aDAO.tancarConn();
				response.sendRedirect("pages/cercarActivitats.jsp");
			} catch (SQLException e) {
				e.printStackTrace();
			}
	}

}
