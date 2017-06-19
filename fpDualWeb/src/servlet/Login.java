package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
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
	        
	        int incorrecte = 0;
	        String nif;
	        String pass;
	        nif = request.getParameter("dni");
	        pass = request.getParameter("password");
	        
	        List<String> valors = new ArrayList<String>();
		        
	        usu.setNIF(nif);
	        usu.setPasswd(pass);
	        
	        session = request.getSession();
	        
	        //deberíamos buscar el usuario en la base de datos, pero dado que se escapa de este tema, ponemos un ejemplo en el mismo código
	        try{
        		List<String> llista = uDAO.validarLogin(usu);
	        	if(nif.equals(llista.get(0)) && pass.equals(llista.get(1))){

	        		valors = uDAO.valorsUsuari(nif, pass);
			        usu.setNom(valors.get(0));
			        usu.setCognom1(valors.get(1));
			        usu.setMail(valors.get(1));
			        
		        	
		            session.setAttribute("nif", usu.getNIF());
		            //Expirar en 30 min
		            session.setMaxInactiveInterval(30*60);
		            
		            Cookie userNif = new Cookie("nif", nif);
		            userNif.setMaxAge(30*60);		            
		            response.addCookie(userNif);
		            
		            Cookie userNom = new Cookie("nom", usu.getNom());
		            userNom.setMaxAge(30*60);		            
		            response.addCookie(userNom);
		            
		            Cookie userCognom = new Cookie("cognom", usu.getCognom1());
		            userCognom.setMaxAge(30*60);		            
		            response.addCookie(userCognom);
		            
		            Cookie userMail = new Cookie("mail", usu.getMail());
		            userMail.setMaxAge(30*60);		            
		            response.addCookie(userMail);
		            
		            //redirijo a página con información de login exitoso	            
		            response.sendRedirect("index.jsp");
			      	        
	        	}
	        }catch(Exception e){
        		incorrecte = 1;
        		session.setAttribute("correcte", incorrecte);
	            response.sendRedirect("pages/login.jsp");
	        }
		          
	        
	    }
	 
	}


