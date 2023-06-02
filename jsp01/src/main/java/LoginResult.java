

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/LoginResult")
public class LoginResult extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public LoginResult() {
        super();
       
    }

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		String userId =request.getParameter("userId");
		String userPw =request.getParameter("userPw");
		if(userId.equals("jjang051") && userPw.equals("1234")) {
			out.println("<p>로그인 성공</p>");
		}else {
			out.println("<p>로그인 실패</p>");
			out.println("<a href='javascript:history.back()'>뒤로가기</a>");
		}
	}

}
