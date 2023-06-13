package com.jjang051.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.DeleteDto;
import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;
import com.jjy0317.utils.ScriptWriter;


@WebServlet("/member/deleteProcess")
public class DeleteProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public DeleteProcessController() {
        super();
    
    }

		protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			String userId = request.getParameter("userId");
			String userPw =request.getParameter("userPw");
			
			MemberDao memberDao = new MemberDao();
			DeleteDto deleteDto = new DeleteDto();
			deleteDto.setUserId(userId);
			deleteDto.setUserPw(userPw);
			
			int result = memberDao.deleteMember(deleteDto);
			if(result>0) {
				ScriptWriter.alertAndNext(response, "삭제완료","../member/login");
			}else {
				ScriptWriter.alertAndBack(response, "알 수 없는 오류가 발생 되었습니다. 다시 시도해 주세요");
			}
			
			
			
			;
	}

}
