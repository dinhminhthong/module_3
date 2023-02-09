import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DiscountAmount" , value = "/ProductDiscountCalculator" )
public class DiscountAmount extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     double ListPrice = Double.parseDouble(req.getParameter("list-name"));
     double discountPercent = Double.parseDouble(req.getParameter("discout-person"));
     // b1: đưa biến sum vô req
     double sum = ListPrice+discountPercent+0.01;
     req.setAttribute("sum" ,sum);
     // b2: tìm kết quả.jsp
        req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPost(req, resp);
    }
}
