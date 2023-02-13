package controller;

import service.IProductService;
import service.ProductServiceImpl;

import javax.servlet.annotation.WebServlet;

@WebServlet(name = "ProductServlet", value = "/product")
public class ProductServlet {
    private IProductService productService =new ProductServiceImpl();

    
}
