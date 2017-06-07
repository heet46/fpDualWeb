package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Usuari;
import model.UsuariDAO;

@WebServlet("/Login")
public class Login extends HttpServlet {
	    
	   //metodo encargado de la gesti�n del m�todo POST
	    protected void doPost(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        PrintWriter out = response.getWriter();
	        HttpSession sesion = request.getSession();
	        
	        UsuariDAO uDAO = new UsuariDAO();
	        Usuari usu = new Usuari();
	        
	        String usuari;
	        String pass;
	        usuari = request.getParameter("dni");
	        pass = request.getParameter("password");
	        
	        usu.setNIF(usuari);
	        usu.setPasswd(pass);
	        System.out.println(usuari+" "+pass);
	        List<String> llista = uDAO.validarLogin(usu);
	        
	        System.out.println(llista.toString());
	        //deber�amos buscar el usuario en la base de datos, pero dado que se escapa de este tema, ponemos un ejemplo en el mismo c�digo
	        if(usuari.equals("12345678A") && pass.equals("1234") && sesion.getAttribute("nom") == null){
	            //si coincide usuario y password y adem�s no hay sesi�n iniciada
	            sesion.setAttribute("nom", usu.getNom());
	            //redirijo a p�gina con informaci�n de login exitoso
	            
	            response.sendRedirect("index.jsp");
	        }else{
	            //l�gica para login inv�lido
	        }
	    }
	    
	   //m�todo encargado de la gesti�n del m�todo GET
	    protected void doGET(HttpServletRequest request, HttpServletResponse response)
	            throws ServletException, IOException {
	        
	        //me llega la url "proyecto/login/out"
	        String action=(request.getPathInfo()!=null?request.getPathInfo():"");
	        HttpSession sesion = request.getSession();
	        if(action.equals("/out")){
	            sesion.invalidate();
	            response.sendRedirect("/home.jsp");
	        }else{
	           
	        }
	    }
	}


