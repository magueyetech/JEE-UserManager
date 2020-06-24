package userapp.Controller;

import userapp.Services.IUser;
import userapp.User;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "Auth", urlPatterns = "/")
public class AuthServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @EJB
    private IUser iUser;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String page = request.getParameter("auth");

        if(page == null) page = "login";

        switch (page) {
            case "addUser":
                getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                break;
            case "login":
                getServletContext().getRequestDispatcher("/WEB-INF/login.jsp").forward(request, response);
                break;
            default:
                break;
        }

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            User user = iUser.findByLoginAndPassword(req.getParameter("login"), req.getParameter("password"));
            if (user != null) {
                HttpSession session = req.getSession();
                session.setAttribute("user", user);
                resp.sendRedirect(req.getContextPath() + "/users");
            } else resp.sendRedirect(req.getContextPath() + "/");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
