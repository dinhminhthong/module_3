import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "ProductServlet", value = "/ProductServlet")
public class ProductServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            double listPrice = Double.parseDouble(request.getParameter("list-price"));
            double discoutPercent = Double.parseDouble(request.getParameter("discount-percent"));
            String productDescription = request.getParameter("product-description");
            double sum = listPrice + discoutPercent + 0.01;

            //b1: đưa biêến sum:
        request.setAttribute("sum", sum);
        request.setAttribute("productDescription",productDescription);
            //b2:tìm kết quả
        request.getRequestDispatcher("/index.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
