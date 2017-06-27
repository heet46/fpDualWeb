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
			llista = rDAO.valorsData(registre);
			if(llista.isEmpty()){
				System.out.println("No hi ha res al registre");
			}else{
				System.out.println("Hi ha cosetes");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		


		
	}

}
