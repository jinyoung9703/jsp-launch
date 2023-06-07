<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp" %>

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
	
	  // modify-process.jsp에서 전달받은 사용자 ID와 비밀번호를 가져옵니다.
	  String userId = request.getParameter("userId");
	  String userPw = request.getParameter("userPw");
	 
	  String sql = "insert into member values (?,?)";
	  //int rowsAffected = pstmt.executeUpdate();
		
	Class.forName(driver);
	conn = DriverManager.getConnection(url, id, pw);
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, pUserId);
	pstmt.setString(2, pUserPw);
	rs = pstmt.executeQuery();

  %>
  <div class="container-sm">
    <div class="row mt-5 justify-content-center">
      <div class="col-6">
        <div class="alert alert-success" role="alert">
          회원 정보가 성공적으로 변경되었습니다.
        </div>
      </div>
    </div>
  </div>


<%@ include file="include/footer.jsp" %>