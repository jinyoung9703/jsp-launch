package com.jjang051.controller.board;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jjang051.model.BoardDao;
import com.jjy0317.utils.ScriptWriter;



public class DeleteProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public DeleteProcessController() {
        super();
    }

	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("id"));
		BoardDao boardDao = new BoardDao();
		int result = boardDao.deleteBoard(id);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "삭제되었습니다.", "../board/list");
		} else {
			ScriptWriter.alertAndBack(response, "알 수 없는 오류로 삭제되지 않았습니다. 다시 시도해 주시기 바랍니다.");
		}
	}
}
