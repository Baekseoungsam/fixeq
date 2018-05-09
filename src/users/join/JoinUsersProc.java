package users.join;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.MySQLConnector;

/**
 * Servlet implementation class JoinUsersProc
 */
@WebServlet("/users/join/joinProc.do")
public class JoinUsersProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JoinUsersProc() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String _USERID = useridValidation(req, res);
		if(_USERID == null) return;

		String _USERPW = userpwValidation(req, res);
		if(_USERPW == null) return;

		String _NAME = req.getParameter("name");
		if(_NAME == null) return;

		String _EMAIL = useremailValidation(req, res);
		if(_USERPW == null) return;

		
		String _MESSAGE = null;
		String _URL = null;
		
		MySQLConnector mysql = new MySQLConnector();
		Connection conn = mysql.getConnection();
		
		String query = "insert into member (userid,userpw,name,email,time) values ('%userid%','%userpw%','%name%','%email%',SYSDATE())";
		query = query.replace("%userid%", _USERID);
		query = query.replace("%userpw%", _USERPW);
		query = query.replace("%name%", _NAME);
		query = query.replace("%email%", _EMAIL);
		System.out.println("query : " + query);
		mysql.insert(query, conn);

		
		responseMessage(res, "회원가입을 축하합니다.", "/page/main.jsp");
		
	}
	
	
	
	public String useridValidation(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String _USERID = req.getParameter("userid");
		String _MESSAGE = null;
		String _URL = null;
		String chkidValid = null;
		
		if( _USERID==null  || _USERID.trim().length()==0) { // 아이디를 입력하지 않았을때
			_MESSAGE = "아이디를 작성해야합니다.";
			_URL = "/users/join/joinForm.do";
		}else { // 일단 아이디를 입력했을때
			if(_USERID.length() < 5) { 
				_MESSAGE = "아이디는 5자 이상 작성하여야 합니다.";
				_URL = "/users/join/joinForm.do";
			}else {
				// DB 객체 초기화
				MySQLConnector mysql = new MySQLConnector();
				// DB 연결 객체 생성
				Connection conn = mysql.getConnection();
				// DB에 쿼리문 실행
				String query = "select * from member where userid='"+ _USERID +"';";
				// 쿼리문 실행 결과를 변수에 저장
				ResultSet rs = mysql.select(query, conn);
				// 변수의 결과값에 따른 조건 분기
					try {
						if(rs.next()) { // 중복일때
							_MESSAGE = "이미 존재하는 아이디입니다.";
							_URL = "/users/join/joinForm.do";
						}else { // 중복이 아닌 경우
							chkidValid = _USERID;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("쿼리문에 에러을 확인하세요. query : " + query);
					}
				
				
			
			}
		}
		
		if(chkidValid == null) {
			responseMessage(res,_MESSAGE,_URL);
		}
		
		return chkidValid;
	}

	
	public String userpwValidation(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String _USERPW = req.getParameter("userpw");
		String _MESSAGE = null;
		String _URL = null;
		String chkpwValid = null;
		
		if( _USERPW==null  || _USERPW.trim().length()==0) { // 비밀번호를 입력하지 않았을때
			_MESSAGE = "비밀번호를 작성해야합니다.";
			_URL = "/users/join/joinForm.do";
		}else { // 일단 아이디를 입력했을때
			if(_USERPW.length() < 5) { 
				_MESSAGE = "비밀번호는 5자 이상 작성하여야 합니다.";
				_URL = "/users/join/joinForm.do";
			}else {
				// DB 객체 초기화
				MySQLConnector mysql = new MySQLConnector();
				// DB 연결 객체 생성
				Connection conn = mysql.getConnection();
				// DB에 쿼리문 실행
				String query = "select * from member where userpw='"+ _USERPW +"';";
				// 쿼리문 실행 결과를 변수에 저장
				ResultSet rs = mysql.select(query, conn);
				// 변수의 결과값에 따른 조건 분기
					try {
						if(rs.next()) { // 중복일때
							_MESSAGE = "이미 존재하는 비밀번호입니다.";
							_URL = "/users/join/joinForm.do";
						}else { // 중복이 아닌 경우
							chkpwValid = _USERPW;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("쿼리문에 에러을 확인하세요. query : " + query);
					}
				
				
			
			}
		}
		if(chkpwValid == null) {
			responseMessage(res,_MESSAGE,_URL);
		}
		
		return chkpwValid;
	}

	
	public String useremailValidation(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String _USEREMAIL = req.getParameter("email");
		String _MESSAGE = null;
		String _URL = null;
		String chkemailValid = null;
		
		if( _USEREMAIL==null  || _USEREMAIL.trim().length()==0) { // 이메일을 입력하지 않았을때
			_MESSAGE = "이메일을 작성해야합니다.";
			_URL = "/users/join/joinForm.do";
		}else { // 일단 이메일을 입력했을때
			if(_USEREMAIL.length() < 5) { 
				_MESSAGE = "이메일은 5자 이상 작성하여야 합니다.";
				_URL = "/users/join/joinForm.do";
			}else {
				// DB 객체 초기화
				MySQLConnector mysql = new MySQLConnector();
				// DB 연결 객체 생성
				Connection conn = mysql.getConnection();
				// DB에 쿼리문 실행
				String query = "select * from member where email='"+ _USEREMAIL +"';";
				// 쿼리문 실행 결과를 변수에 저장
				ResultSet rs = mysql.select(query, conn);
				// 변수의 결과값에 따른 조건 분기
					try {
						if(rs.next()) { // 중복일때
							_MESSAGE = "이미 존재하는 이메일입니다.";
							_URL = "/users/join/joinForm.do";
						}else { // 중복이 아닌 경우
							chkemailValid = _USEREMAIL;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("쿼리문에 에러을 확인하세요. query : " + query);
					}
				
				
			
			}
		}
		
		if(chkemailValid == null) {
			responseMessage(res,_MESSAGE,_URL);
		}
		
		return chkemailValid;
	}

	
	

	
	
	public void responseMessage(HttpServletResponse res, String message, String url) throws IOException{
		res.setContentType("text/html");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		
		out.write("<script>");
		out.write("alert('" + message + "'); ");
		out.write("location.href='"+url+"';" );
		out.write("</script>");
		
	}
	

}
