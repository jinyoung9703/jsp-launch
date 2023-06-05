<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String pUserId = request.getParameter("userId");
	String pUserPw = request.getParameter("userPw");
	String pUserName = request.getParameter("userName");
	String pUseraddress = request.getParameter("address");
	String pUserzipcode = request.getParameter("zipcode");
	String pUsergender = request.getParameter("gender");
	
	String driver = "oracle.jdbc.OracleDriver";
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String id = "jjy0317";
	String pw = "1234";
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "insert into member values (?,?,?,?,?,?)"; //오토 커밋
	
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pUserId);
	pstmt.setString(2, pUserName);
	pstmt.setString(3, pUserPw);
	pstmt.setString(4, pUseraddress);
	pstmt.setString(5, pUserzipcode);
	pstmt.setString(6, pUsergender);
	int result = pstmt.executeUpdate();
	if(result > 0){
		response.sendRedirect("login-form.jsp");
	}else{
		out.println("<script>alert('서버오류입니다. 잠시뒤에 다시 시도해 주세요.'); history.back();</script>");
	}
	
	
	
	
%>