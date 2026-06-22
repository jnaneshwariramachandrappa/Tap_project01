package com.javabite.servlets;

import com.javabite.dao.FoodItemDAO;
import com.javabite.models.FoodItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private FoodItemDAO foodItemDAO = new FoodItemDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Check if user logged in
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user") == null) {

            response.sendRedirect(
                    request.getContextPath() + "/login");

            return;
        }

        // Get all food items
        List<FoodItem> foodItems =
                foodItemDAO.getAllFoodItems();

        // Get category wise food items
        List<FoodItem> starters =
                foodItemDAO.getFoodItemsByCategory(
                        "Starters");

        List<FoodItem> mainCourse =
                foodItemDAO.getFoodItemsByCategory(
                        "Main Course");

        List<FoodItem> desserts =
                foodItemDAO.getFoodItemsByCategory(
                        "Desserts");

        List<FoodItem> drinks =
                foodItemDAO.getFoodItemsByCategory(
                        "Drinks");

        // Send data to JSP
        request.setAttribute("foodItems", foodItems);

        request.setAttribute("starters", starters);

        request.setAttribute("mainCourse", mainCourse);

        request.setAttribute("desserts", desserts);

        request.setAttribute("drinks", drinks);

        // Forward to home page
        request.getRequestDispatcher("/index.jsp")
               .forward(request, response);
    }
}