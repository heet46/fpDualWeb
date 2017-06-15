package servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Tutor;
import model.TutorDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class modificarTutors2
 */
@WebServlet("/modificarTutors2")
public class modificarTutors2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public modificarTutors2() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UsuariDAO uDAO=new UsuariDAO();
		TutorDAO tDAO=new TutorDAO();
		String idVella=request.getParameter("IdVella");
		System.out.println(idVella);
		uDAO.modificarUsuari(idVella, new Usuari(request.getParameter("NIF"),
				request.getParameter("pass"),request.getParameter("nom"),
				request.getParameter("Pcognom"),request.getParameter("Scognom"),
				request.getParameter("mail")));
		tDAO.modificarTutor(new Tutor(uDAO.consultaID(request.getParameter("NIF")),request.getParameter("tecno")));
		doGet(request, response);
		response.sendRedirect("pages/tutors.jsp");
	}

}
