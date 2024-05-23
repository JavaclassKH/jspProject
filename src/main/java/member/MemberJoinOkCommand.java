package member;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import common.SecurityUtil;

public class MemberJoinOkCommand implements MemberInterface {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String mid = request.getParameter("mid") == null ? "" : request.getParameter("mid");
		String pwd = request.getParameter("pwd") == null ? "" : request.getParameter("pwd");
		String name = request.getParameter("name") == null ? "" : request.getParameter("name");
		String nickName = request.getParameter("nickName") == null ? "" : request.getParameter("nickName");
		String contact = request.getParameter("contact") == null ? "" : request.getParameter("contact");
		String email = request.getParameter("email") == null ? "" : request.getParameter("email");
		
		MemberDAO dao = new MemberDAO();
		MemberVO vo = new MemberVO();
		
		// 비밀번호 암호화
		SecurityUtil su = new SecurityUtil();
		String uid = UUID.randomUUID().toString().substring(0, 8);
		pwd = uid + su.encryptSHA256(uid + pwd);
		
		vo.setMid(mid);
		vo.setPwd(pwd);
		vo.setName(name);
		vo.setNickName(nickName);
		vo.setContact(contact);
		vo.setEmail(email);
		
		int res = dao.setMemberJoinOk(vo);
		
		if(res != 0) {
			request.setAttribute("message", "회원이 되신 것을 환영합니다!\\n로그인 후 이용해주세요!");
			request.setAttribute("url", "Lobby.mem");			
		}
		else {
			request.setAttribute("message", "회원가입에 실패하였습니다");
			request.setAttribute("url", "MemberJoinForm.mem");			
		}
		
		
		
		
	}
}
