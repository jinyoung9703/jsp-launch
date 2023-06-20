package com.jjang051.controller.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/index/index")
public class IndexController extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
    public IndexController() {
        super();
      
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/index/index.jsp");	//절대경로 설정
		dispatcher.forward(request, response);
	}

}
