package com.jjang051.controller.member;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.*;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//import org.apache.commons.fileupload.FileItem;
//import org.apache.commons.fileupload.disk.DiskFileItemFactory;
//import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.jjang051.model.MemberDao;
import com.jjang051.model.MemberDto;
import com.jjy0317.utils.ScriptWriter;
//import com.oreilly.servlet.MultipartRequest;
//import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/member/joinProcess")
public class joinProcessController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public joinProcessController() {
		super();

	}

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("왜 안넘어오니...");

		// linux는 cli를 써야함

		request.setCharacterEncoding("utf-8");

//		DefaultFileRenamePolicy fileReNamePolicy = new DefaultFileRenamePolicy();
//		//"profile.jpg" "progile.jpg" 이름이 같을땐 숫자를 입력해서 이름을 다르게 저장한다
//		
//		int fileSize = 1024*1024*10;
//		String encoding = "utf-8";
//		ServletContext context = this.getServletContext();
//		String savePath = "upload";
//		String realPath = "context.getRealPath(savePath)";
//		System.out.println(realPath);
//		
//		MultipartRequest multipartRequest = new MultipartRequest(request,realPath,fileSize,encoding,fileReNamePolicy);		
//	//	realPath 파일 저장위치 나머지는 위에 적어줘야함.
		String encoding = "utf-8";

		int fileSize = 1024*1024*10;
		String savePath = "upload";
		ServletContext context = this.getServletContext();
		String realPath = context.getRealPath(savePath);
		
		System.out.println("realPath==="+realPath);

		File currentDir = new File(realPath);
		if(!currentDir.exists()) {
			currentDir.mkdir();
		}
		System.out.println("currentDir===="+currentDir);
		DefaultFileRenamePolicy fileRenamePolicy = new DefaultFileRenamePolicy();	
		MultipartRequest multipartRequest = new MultipartRequest(request, realPath,fileSize,encoding,fileRenamePolicy);
	
		String userId = multipartRequest.getParameter("userId"); 
		String userPw = multipartRequest.getParameter("userPw"); 
		String userName = multipartRequest.getParameter("userName"); 
		String userEmail = multipartRequest.getParameter("userEmail"); 
		int zonecode = Integer.parseInt(multipartRequest.getParameter("zonecode"));
		
		String userAddress = multipartRequest.getParameter("userAddress"); 
		String detailAddress = multipartRequest.getParameter("detailAddress"); 
		String extraAddress = multipartRequest.getParameter("extraAddress"); 
		
		String originalFile = multipartRequest.getOriginalFileName("profile");
		String renameFile = multipartRequest.getFilesystemName("profile");
		//원본을 저장하는 오리지날 파일 사진이 같을때 이름을 바꿔주는 파일 
		
		MemberDao memberDao = new MemberDao();
		MemberDto memberDto = new MemberDto();
		memberDto.setId(userId);
		memberDto.setPassword(userPw);
		memberDto.setName(userName);
		memberDto.setZonecode(zonecode);
		memberDto.setAddress(userAddress);
		memberDto.setExtraAddress(extraAddress);
		memberDto.setDetailAddress(detailAddress);
		memberDto.setEmail(userEmail);
		memberDto.setProfile(originalFile);
		memberDto.setRealProfile(renameFile);
		
		System.out.println(memberDto);
		
		int result = memberDao.insertMember(memberDto);
		if(result>0) {
			ScriptWriter.alertAndNext(response, "회원가입 되었습니다.", "../member/login");
		} else {
			ScriptWriter.alertAndBack(response, "알 수 없는 오류가 발생 되었습니다. 다시 시도해 주세요");
		}
	}
    
    private String getToday() {
    	//오늘 날짜 돌려받기
    	return new SimpleDateFormat("yyyy-MM-dd").format(System.currentTimeMillis());
    }
}
