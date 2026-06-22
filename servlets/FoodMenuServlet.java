package com.javabite.servlets;

import com.javabite.dao.FoodItemDAO;
import com.javabite.models.FoodItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/menu")
public class FoodMenuServlet extends HttpServlet {

    private FoodItemDAO foodItemDAO = new FoodItemDAO();

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String category = request.getParameter("category");

        List<FoodItem> foodItems;

        if (category != null && !category.isEmpty()) {
            foodItems = foodItemDAO.getFoodItemsByCategory(category);
            request.setAttribute("selectedCategory", category);
        } else {
            foodItems = foodItemDAO.getAllFoodItems();
        }

        request.setAttribute("foodItems", foodItems);

        request.setAttribute("starters",
                foodItemDAO.getFoodItemsByCategory("Starters"));

        request.setAttribute("mainCourse",
                foodItemDAO.getFoodItemsByCategory("Main Course"));

        request.setAttribute("desserts",
                foodItemDAO.getFoodItemsByCategory("Desserts"));

        request.setAttribute("drinks",
                foodItemDAO.getFoodItemsByCategory("Drinks"));

        request.getRequestDispatcher("/food-menu.jsp")
               .forward(request, response);
    }
}