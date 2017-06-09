package servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.UsuariDAO;
import model.TutorDAO;
import model.Usuari;

/**
 * Servlet implementation class afegirTutors
 */
@WebServlet("/afegirTutors")
public class afegirTutors extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public afegirTutors() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuariDAO uDAO=new UsuariDAO();
		String NIF=(String)request.getParameter("NIF");
		String pass=(String)request.getParameter("pass");
		String nom=(String)request.getParameter("nom");
		String pCog=(String)request.getParameter("Pcognom");
		String sCog=(String)request.getParameter("Scognom");
		String mail=(String)request.getParameter("mail");
		String tecno=(String)request.getParameter("tecno");
		
		uDAO.altaUsuari(new Usuari(NIF,pass,nom,pCog,sCog,mail));
		
		response.sendRedirect("/fpDualWeb/pages/tutors.jsp");
	}

}
