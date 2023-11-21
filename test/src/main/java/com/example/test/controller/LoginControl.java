package com.example.test.controller;

import java.io.IOException;
import java.io.PrintWriter;

import com.example.test.beans.User;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.FilterConfig;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebFilter(filterName = "Login",
        urlPatterns = {"/analizadiety"})
public class LoginControl implements Filter {
    public LoginControl() {}
    @Override
    public void doFilter(ServletRequest request, ServletResponse response,
                         FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest hreq = (HttpServletRequest) request;
        User user = (User) hreq.getSession().getAttribute("email");
        if (user != null || hreq.getSession() == null)
        {
            chain.doFilter(request, response);
        } else {
            String redirectUrl = "/test_war_exploded/logowanie.jsp";
            if (hreq.getHeader("x-requested-with") != null
                    && hreq.getHeader("x-requested-with").equalsIgnoreCase("XMLHttpRequest")) {
                HttpServletResponse hres = (HttpServletResponse) response;
                hres.setContentType("text/json; charset=UTF-8");
                PrintWriter out = hres.getWriter();
                String json = "{\"redirect\":\"" + redirectUrl + "\"}";
                out.write(json);
                out.flush();
                out.close();
            } else {
                ((HttpServletResponse) response).sendRedirect(redirectUrl);
            }
        }
    }
    @Override
    public void destroy() {}
    @Override
    public void init(FilterConfig filterConfig) {}
}
