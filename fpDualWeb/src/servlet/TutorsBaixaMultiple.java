package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Tutor;
import model.TutorDAO;
import model.UsuariDAO;

/**
 * Servlet implementation class TutorsBaixaMultiple
 */
@WebServlet("/TutorsBaixaMultiple")
public class TutorsBaixaMultiple extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public TutorsBaixaMultiple() {
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
		TutorDAO tDAO=new TutorDAO();
		UsuariDAO uDAO=new UsuariDAO();
		String NIF=request.getParameter("NIF");
		int existeix = 0;
		try {
			String[] nifs = request.getParameterValues("NIF");
			for(int i=0; i<nifs.length; i++){
				System.out.println(nifs[i]);
				if(tDAO.comprobarAlumnes(new Tutor(uDAO.consultaID(nifs[i]),""))){
					existeix=1;
					request.getSession().setAttribute("existeix",existeix);
				}else{
					existeix=0;
					request.getSession().setAttribute("existeix",existeix);
					tDAO.baixaTutor(uDAO.consultaID(nifs[i]));
				}
			}
			tDAO.tancarConn();
			uDAO.tancarConn();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

		response.sendRedirect("pages/tutorsConsulta.jsp");

	}

}
