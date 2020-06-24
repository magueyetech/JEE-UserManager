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
import java.util.List;

@WebServlet(name = "Users", urlPatterns = "/users")
public class UserServlet extends HttpServlet {

    @EJB
    private IUser iUser;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            if (id == null) {
                User user = new User();
                user.setLogin(request.getParameter("login"));
                user.setPrenom(request.getParameter("prenom"));
                user.setNom(request.getParameter("nom"));
                user.setProfil("SIMPLE");

                iUser.add(user);

                response.sendRedirect(request.getContextPath() + "/users");
            } else {
                User user = iUser.findById(Integer.parseInt(id));
                user.setLogin(request.getParameter("login"));
                user.setNom(request.getParameter("nom"));
                user.setPrenom(request.getParameter("prenom"));
                user.setProfil(request.getParameter("profil"));

                iUser.update(user);
                response.sendRedirect(request.getContextPath() + "/users");
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        String page = request.getParameter("page");

        try {

            if (page == null) page = "list";

            switch (page) {
                case "add":
                    getServletContext().getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
                    break;
                case "edit":
                    request.setAttribute("user", iUser.findById(Integer.parseInt(request.getParameter("id"))));
                    getServletContext().getRequestDispatcher("/WEB-INF/edituser.jsp").forward(request, response);
                    break;
                case "delete":
                    iUser.delete(iUser.findById(Integer.parseInt(request.getParameter("id"))));
                    response.sendRedirect(request.getContextPath() + "/users");
                    break;
                case "list":
                    List<User> userList = iUser.findAll();
                    request.setAttribute("users", userList);
                    getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
                    break;
                case "logout":
                    session.invalidate();
                    session = request.getSession(false);
                    response.getWriter().println("Session : " + session);
                    response.sendRedirect(request.getContextPath() + "/");
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}