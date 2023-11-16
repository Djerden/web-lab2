package project.lab2web;

import java.io.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

@WebServlet("/controller")
public class ControllerServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            double x = Double.parseDouble(request.getParameter("x").replace(",", "."));
            double y = Double.parseDouble(request.getParameter("y").replace(",", "."));
            double r = Double.parseDouble(request.getParameter("r").replace(",", "."));
            if (!(r >= 2.0 && r <= 5.0)) {
                throw new Exception("Радиус задан некорректно");
            }
            getServletContext().getRequestDispatcher("/area_check").forward(request, response);

        } catch (Exception e) {
            response.getWriter().println(e.getMessage());
            response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
        }
        response.getWriter().println("Hello");
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }


}