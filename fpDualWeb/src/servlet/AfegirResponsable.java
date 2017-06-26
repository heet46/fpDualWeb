package servlet;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.CentreDAO;
import model.Usuari;
import model.UsuariDAO;

/**
 * Servlet implementation class AfegirResponsable
 */
@WebServlet("/AfegirResponsable")
public class AfegirResponsable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AfegirResponsable() {
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
		CentreDAO cDAO=new CentreDAO();
		Usuari u=new Usuari();
		int existeix=0;
		String NIF=(String)request.getParameter("NIF");
		String pass=(String)request.getParameter("pass");
		String nom=(String)request.getParameter("nom");
		String pCog=(String)request.getParameter("Pcognom");
		String sCog=(String)request.getParameter("Scognom");
		String mail=(String)request.getParameter("mail");
		String centre=(String)request.getParameter("centre");
		u.setNIF(NIF);
		u.setPasswd(pass);
		u.setNom(nom);
		u.setCognom1(pCog);
		u.setCognom2(sCog);
		u.setMail(mail);
		u.setPermis(3);
		try {
			u.setIdCentre(cDAO.idCentre(centre));
			uDAO.altaUsuari(u);
		} catch (SQLException e) {
			existeix=1;
			request.getSession().setAttribute("NIF2",NIF);
			request.getSession().setAttribute("pass2",pass);
			request.getSession().setAttribute("nom2",nom);
			request.getSession().setAttribute("Pcognom2",pCog);
			request.getSession().setAttribute("Scognom2",sCog);
			request.getSession().setAttribute("mail2",mail);
		}

		if(existeix==1){
			request.getSession().setAttribute("existeix", existeix);
			response.sendRedirect("/fpDualWeb/pages/responsablesAfegir.jsp");
		}else{
			request.getSession().setAttribute("existeix", existeix);
			response.sendRedirect("/fpDualWeb/pages/tutorsConsulta.jsp");
		}
	}

}
