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
			        usu.setCognom2(valors.get(2));
			        usu.setMail(valors.get(3));
			        usu.setPermis(Integer.parseInt(valors.get(4)));			        
		        	
		            //Expirar en 30 min
		            session.setMaxInactiveInterval(30*60);
		            
		            String nomComplet;
		            if(usu.getCognom2().equals(null)){
		            	nomComplet = usu.getNom()+" "+usu.getCognom1();
		            }else{
		            	nomComplet = usu.getNom()+" "+usu.getCognom1()+" "+usu.getCognom2();
		            }
		            
		            session.setAttribute("nif", usu.getNIF());
		            session.setAttribute("nomLogin", usu.getNom());
		            session.setAttribute("cognom1Login", usu.getCognom1());
		            session.setAttribute("cognom2Login", usu.getCognom2());
		            session.setAttribute("mailLogin", usu.getMail());
		            session.setAttribute("permis", usu.getPermis());
		            session.setAttribute("nomComplet", nomComplet);
		            
		            uDAO.tancarConn();
		            //redirijo a página con información de login exitoso	            
		            response.sendRedirect("index.jsp");
			      	        
	        	}
	        }catch(Exception e){
        		session.setAttribute("correcte", 1);
	            response.sendRedirect("pages/login.jsp");
	        }
		          
	        
	    }
	 
	}


