/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.filter;

import java.io.IOException;
import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.User;

@WebFilter({"/addBook.jsp", "/book"})
public class AuthFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response;
        HttpSession session = httpRequest.getSession(false);
        
        User user = (session != null) ? (User) session.getAttribute("user") : null;
        
        if (user == null) {
            httpResponse.sendRedirect("login.jsp");
            return;
        }
        
        // Only restrict addBook.jsp and book POST requests to admin
        String path = httpRequest.getRequestURI();
        if (path.endsWith("/addBook.jsp") || 
            (path.endsWith("/book") && "POST".equalsIgnoreCase(httpRequest.getMethod()))) {
            if (!"Admin".equals(user.getRole())) {
                httpResponse.sendRedirect("error.jsp?message=Access denied");
                return;
            }
        }
        
        chain.doFilter(request, response);
    }

    @Override
    public void init(FilterConfig fConfig) throws ServletException {}
    @Override
    public void destroy() {}
}