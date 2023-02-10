import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "SanhamServlet", value = "/sanhamServlet")
public class SanhamServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            double numberFist = Double.parseDouble(request.getParameter("number-fist"));
            double numberSecond = Double.parseDouble(request.getParameter("number-second"));
            double sum = numberFist+numberSecond;

    request.setAttribute("sum",sum);
    request.getRequestDispatcher("/ketqua.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
