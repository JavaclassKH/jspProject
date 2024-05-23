package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import common.GetConn;

public class MemberDAO {
	
	private Connection conn = GetConn.getConn();
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private MemberVO vo = null;
	private String sql = "";
	
	
	public MemberDAO() {}
	
	public void pstmtClose() {
		if(pstmt != null) {
			try {
				pstmt.close();
			} catch (SQLException e) {}
		}
	}
	
	public void rsClose() {
		if(rs != null)
			try {
				rs.close();
			} catch (SQLException e) {}
			finally {
				pstmtClose();
			}
	}

	// 회원가입시 아이디,닉네임 중복체크!
	public MemberVO getMemberMidNickNameCheck(String midNickName, String whatCheck) {
		MemberVO vo = new MemberVO();
		
		try {
			if(whatCheck.equals("midCheck")) {
				sql = "select * from member where mid = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, midNickName);
				rs = pstmt.executeQuery();
			}
			else {
				sql = "select * from member where nickName = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, midNickName);				
				rs = pstmt.executeQuery();
			}
			
			if(whatCheck.equals("midCheck")) {
				if(rs.next()) vo.setMid(rs.getString("mid"));
			}
			else {
				if(rs.next()) vo.setNickName(rs.getString("nickName"));
			}
			
		} catch (SQLException e) {
			System.out.println("SQL오류(아이디,닉네임 중복체크[memberDAO])" + e.getMessage());
		} finally {
			rsClose();
		}	
		return vo;
	}

	// 회원가입 처리!
	public int setMemberJoinOk(MemberVO vo) {
		int res = 0;
		
		try {
			sql = "insert into member values (default,?,?,?,?,?,?,default,default,default);";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getName());
			pstmt.setString(2, vo.getMid());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getNickName());
			pstmt.setString(5, vo.getContact());
			pstmt.setString(6, vo.getEmail());
			res = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			System.out.println("SQL오류(회원가입[memberDAO])" + e.getMessage());
		} finally {
			pstmtClose();
		}
		
		return res;
	}
	
	
	
	
	
}