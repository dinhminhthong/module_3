package controller;

import model.Customer;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CustomerServlet", value = "/customer")
public class CustomerServlet extends HttpServlet {
    private List<Customer> customerList = new ArrayList<>();
    public void init(){
        customerList.add(new Customer("Mai Văn Hoàng","1983-08-20","Hà Nội","https://tse1.mm.bing.net/th?id=OIP.0pgyUCIOys-Liq86dJ7YFAHaJQ&pid=Api&P=0"));
        customerList.add(new Customer("Nguyễn Văn Nam","1983-08-21","Bắc giang","https://keomoi.com/wp-content/uploads/2019/05/anh-gai-dep-de-thuong-hinh-14.jpg"));
        customerList.add(new Customer("Nguyễn Thái Hoòa","1983-08-22","Nam Định","https://tse3.explicit.bing.net/th?id=OIP.lXH1zFEtX9Ydna25URfPsgHaHv&pid=Api&P=0"));
        customerList.add(new Customer("Trần Đăng Khoa","1083-08-17","Hà Tây","https://tse1.mm.bing.net/th?id=OIP.Yx4ymQJJ19VZ8ue4I5lU8wHaLI&pid=Api&P=0"));
    }
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            request.setAttribute("customerList",customerList);
            request.getRequestDispatcher("/list.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
