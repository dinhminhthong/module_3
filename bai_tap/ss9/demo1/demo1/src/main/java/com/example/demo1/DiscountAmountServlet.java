package com.example.demo1;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DiscountAmount" , value ="/a")
public class DiscountAmountServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
     double ListPrice = Double.parseDouble(req.getParameter("list-name"));
     double discountPercent = Double.parseDouble(req.getParameter("discount-percent"));
     // b1: đưa biến sum vô req
     double sum = ListPrice+discountPercent+0.01;
     req.setAttribute("sum" ,sum);
     // b2: tìm kết quả.jsp
       req.getRequestDispatcher("/index.jsp").forward(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

    }
}
