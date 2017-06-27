package servlet;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		String data = request.getParameter("data");
		System.out.println("Data que arriba:"+data);
		
		SimpleDateFormat formateador = new SimpleDateFormat("yyyy-MM-dd");
		Date data2 = null;
		try{
		   data2 = formateador.parse(data);
		}
		catch(ParseException e){
		   // Error, la cadena de texto no se puede convertir en fecha.
		}
		System.out.println("Data canviada:"+data2.toString());
		String data3 = formateador.format(data2);
		
		System.out.println("Data canviada2:"+data3);


		
	}

}
