package servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Registre;
import model.RegistreDAO;

@WebServlet("/ComprovarData")
public class ComprovarData extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ComprovarData() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SimpleDateFormat DATE_FORMAT = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat DATE_FORMAT2 = new SimpleDateFormat("dd/MM/yyyy");
		
		String data = request.getParameter("data");
		request.getSession().setAttribute("afgData", data);
		
		Date date;
		String data2 = null;
		try {
			date = DATE_FORMAT2.parse(data);
			data2 = DATE_FORMAT.format(date);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		
		Registre registre = new Registre();
		RegistreDAO rDAO = new RegistreDAO();
		registre.setData(data2);
		List<Object> llista;
		
		try {
			List <String> llistaActivitats = rDAO.llistaActivitats();
			System.out.println(llistaActivitats);
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		try {
			llista = rDAO.valorsData(registre);
			if(llista.isEmpty()){
				response.sendRedirect("pages/afegirRegistre.jsp");
			}else{
				System.out.println("Hi ha cosetes");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		


		
	}

}
