package com.jjang051.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;
import com.jjy0317.utils.ScriptWriter;


@WebServlet("/member/joinProcess")
public class joinProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
  
    public joinProcessController() {
        super();
       
    }

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.println("???????");
    	
    request.setCharacterEncoding("utf-8");
	String UserId = request.getParameter("userId");
	String UserPw = request.getParameter("userPw");
	String UserName = request.getParameter("userName");
	String UserEmail = request.getParameter("userEmail");
	int Zonecode = Integer.parseInt(request.getParameter("zonecode"));
	String UserAddress = request.getParameter("userAddress");
	String DetailAddress = request.getParameter("detailAddress");
	String ExtraAddress = request.getParameter("extraAddress");
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = new MemberDto();
		memberDto.setId(UserId);
		memberDto.setPassword(UserPw);
		memberDto.setName(UserName);
		memberDto.setAddress(UserAddress);
		memberDto.setExtraAddress(ExtraAddress);
		memberDto.setDetailAddress(DetailAddress);
		memberDto.setEmail(UserEmail);
		memberDto.setZonecode(Zonecode);
		
		int result = memberDao.insertMember(memberDto);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "회원가입 되었습니다.", "../member/login");
		}else {
			ScriptWriter.alertAndBack(response,"알 수 없는 오류가 발생 되었습니다.다시 시도해 주세요");
		}
		//business logic
	}

}
