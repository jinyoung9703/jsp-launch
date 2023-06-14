package com.jjang051.controller.member;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
//			String userId = request.getParameter("userId");
//			String userPw =request.getParameter("userPw");
//			
//			MemberDao memberDao = new MemberDao();
//			DeleteDto deleteDto = new DeleteDto();
//			deleteDto.setUserId(userId);
//			deleteDto.setUserPw(userPw);
//			
//			int result = memberDao.deleteMember(deleteDto);
//			if(result>0) {
//				ScriptWriter.alertAndNext(response, "삭제완료","../member/login");
//			}else {
//				ScriptWriter.alertAndBack(response, "알 수 없는 오류가 발생 되었습니다. 다시 시도해 주세요");
//			}
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");

		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = new MemberDto();
		memberDto.setId(userId);
		memberDto.setPassword(userPw);

		int result = memberDao.deleteMember(memberDto);
		if (result > 0) {
			HttpSession session = request.getSession();
			session.invalidate();
			ScriptWriter.alertAndNext(response, "회원탈퇴되었습니다.", "../index/index");
		}else {
			ScriptWriter.alertAndBack(response, "비밀번호를 확인해 주세요.");
		}
	}
}