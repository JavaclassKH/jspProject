package member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@SuppressWarnings("serial")
@WebServlet("*.mem")
public class MemberController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberInterface command = null;

		String uri = request.getRequestURI();
		String com = uri.substring(uri.lastIndexOf("/"), uri.lastIndexOf("."));
		String viewPage = "/WEB-INF/lobby";
		
		
		if(com.equals("/Lobby")) {
			viewPage += "/lobby.jsp";
		}
		else if(com.equals("/MemberJoinForm")) {
			viewPage += "/member/memberJoinForm.jsp";
		}
		else if(com.equals("/MemberMidNickNameCheck")) {
			command = new MemberMidNickNameCheckCommand();
			command.execute(request, response);
			return;
		}
		else if(com.equals("/MemberJoinOk")) {
			command = new MemberJoinOkCommand();
			command.execute(request, response);
			viewPage = "/include/message.jsp";
		}
		else if(com.equals("/MemberLogin")) {
			viewPage += "/member/memberLoginForm.jsp";
		}
		else if(com.equals("/")) {
			
		}
		else if(com.equals("/")) {
			
		}
		else if(com.equals("/")) {
			
		}
		
	
		
		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
		
	}
}
