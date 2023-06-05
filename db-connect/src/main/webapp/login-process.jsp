<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%> 
	<%
	String pUserId = request.getParameter("userId");
	String pUserPw = request.getParameter("userPw");
	
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jjy0317";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from member where id = ? and password = ?";
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pUserId);
	pstmt.setString(2, pUserPw);
	rs = pstmt.executeQuery();
	//response.setContentType("text/html;charset=utg-8");
	
	// page < request < session < application

	if(rs.next()){
		String userId = rs.getString("id");
		String userPw = rs.getString("password");
		String userName = rs.getString("name");
		
		//out.println("로그인 성공");
		//response.sendRedirect("login-ok.jsp?userName="+userId);
		// 직접 주소창을 바꾸는 거
		//request.getRequestDispatcher("login-ok.jsp").forward(request,response);
		pageContext.setAttribute("pageUserId", userId);		
		request.setAttribute("userId", userId);
		session.setAttribute("userId", userId);
		response.sendRedirect("login-ok.jsp?userId="+userId);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("login-ok.jsp");
		dispatcher.forward(request, response);
		
	}else{
		out.println("로그인 실패");
	}
	
	

	%>

	