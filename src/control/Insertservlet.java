package control;

import java.io.IOException;
import java.io.InputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import entity.Student;
import model.StudentModel;
import org.springframework.web.multipart.MultipartFile;
import util.ImportExcelUtil;

public class Insertservlet extends HttpServlet {

	public Insertservlet() {
		super();
	}


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		    request.setCharacterEncoding("gbk");
	 		int id = Integer.parseInt(request.getParameter("id"));
	 		String name = request.getParameter("name");
			String sex = request.getParameter("sex");
			int age = Integer.parseInt(request.getParameter("age"));
			String grade = request.getParameter("grade");
			float score = Float.parseFloat(request.getParameter("score"));

     		StudentModel model = new StudentModel();
	 	    model.insert(id, name, sex, age, grade, score);
	 	    response.sendRedirect("ListStudentServlet.do");
	}

}
