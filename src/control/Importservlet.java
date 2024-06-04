package control;

import entity.Student;
import model.StudentModel;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import util.ImportExcelUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
//@WebServlet(name = "SellerAddGoodsServlet", value = "/seller/addgoods")
@MultipartConfig
public class Importservlet extends HttpServlet {
    public Importservlet() {
        super();
    }
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        Map<String,Object> resultMap = new HashMap<>();

        Part filePart = request.getPart("file");
        filePart.getName().toString();
        String fileName = Paths.get(filePart.getName()).getFileName().toString();
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        List<Student> peerList = new ArrayList<>();
        try {
//            FileInputStream fileInputStream = new FileInputStream("D:\\Users\\H0489\\Desktop\\工作簿1.xlsx");
            //获取数据
            List<List<Object>> olist = ImportExcelUtil.getListByExcel(filePart.getInputStream(), "test1.xlsx");
            // System.out.println("olist = " + olist);

            resultMap.put("导入成功",200);
            //封装数据
            for (int i = 0; i < olist.size(); i++) {
                List<Object> list = olist.get(i);
                Student student = new Student();
               /* peercomparison.setId(i);
                peercomparison.setCompanyId(222);*/
                StudentModel model = new StudentModel();
                model.insert(Integer.parseInt((String) list.get(0)), String.valueOf(list.get(1)), String.valueOf(list.get(2)),
                        Integer.parseInt((String) list.get(3)),  String.valueOf(list.get(4)),Float.parseFloat((String) list.get(5)));
            }
            /*if (i != 0) {
                resultMap.put("state", 200);
            }else {
                resultMap.put("mete","文档内无数据，请重新导入");
                resultMap.put("state", 500);
            }
*/
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            System.out.println("1");
        }

        response.sendRedirect("ListStudentServlet.do");
    }
}
