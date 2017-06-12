package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuari;
import model.UsuariDAO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	    
	   //metodo encargado de la gestión del método POST
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        HttpSession session;
	        
	        UsuariDAO uDAO = new UsuariDAO();
	        Usuari usu = new Usuari();
	        
	        String usuari;
	        String pass;
	        usuari = request.getParameter("dni");
	        pass = request.getParameter("password");
	        
	        usu.setNIF(usuari);
	        usu.setPasswd(pass);
	        List<String> llista = uDAO.validarLogin(usu);

	        //deberíamos buscar el usuario en la base de datos, pero dado que se escapa de este tema, ponemos un ejemplo en el mismo código
	        try{
		        	if(usuari.equals(llista.get(0)) && pass.equals(llista.get(1))){
		            
		        	session = request.getSession();
		            session.setAttribute("nif", usu.getNIF());
		            //Expirar en 30 min
		            session.setMaxInactiveInterval(30*60);
		            
		            Cookie userName = new Cookie("usuari", usuari);
		            userName.setMaxAge(30*60);
		            
		            response.addCookie(userName);
		            
		            //redirijo a página con información de login exitoso	            
		            response.sendRedirect("index.jsp");
		      	        
		        }
	        }catch(Exception e){
	        	//RequestDispatcher rd = getServletContext().getRequestDispatcher("/login.jsp");
		        PrintWriter out = response.getWriter();
		        out.println("<font color=red>Nif o contrassenya incorrectes</font>");
	            response.sendRedirect("pages/login.jsp");
		        //rd.include(request, response);
	        }
	    }
	 
	}


