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
		String _USERPW = userpwVaildation(req, res);
		String _NAME = req.getParameter("name");
		String _EMAIL = useremailValidation(req, res);
		
		String _MESSAGE = null;
		String _URL = null;
		
		MySQLConnector mysql = new MySQLConnector();
		Connection conn = mysql.getConnection();
		
		String query = "insert into member (userid,userpw,username,useremail,reg_dt) values ('%userid%','%userpw%','%name%','%email%',SYSDATE())";
		query = query.replace("%userid%", _USERID);
		query = query.replace("%userpw%", _USERPW);
		query = query.replace("%name%", _NAME);
		query = query.replace("%email%", _EMAIL);
		System.out.println("query : " + query);
		mysql.insert(query, conn);

		
		responseMessage(res, "회원가입을 축하합니다.", "main.jsp");
		
	}
	
	
	public String useridValidation(HttpServletRequest req, HttpServletResponse res) throws IOException {
		String _USERID = req.getParameter("userid");
		String _MESSAGE = null;
		String _URL = null;
		String chkidValid = null;
		
		if( _USERID==null ) {
			_MESSAGE = "아이디를 작성해야합니다.";
			_URL = "/users/joinForm.do";
		}else {
			if(_USERID.trim().length()>5) {
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
							_URL = "/users/joinForm.do";
						}else { // 중복이 아닌 경우
							chkidValid = _USERID;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("쿼리문에 에러을 확인하세요. query : " + query);
					}
				
				
			}else {
				_MESSAGE = "아이디는 5자 이상 작성하여야 합니다.";
				_URL = "/users/joinForm.do";
			}
		}
		
		responseMessage(res, _MESSAGE, _URL);
		
		return chkidValid;
	}
	
	
	public String userpwVaildation(HttpServletRequest req, HttpServletResponse res) throws IOException{
		String _USERPW = req.getParameter("userpw");
		String _MESSAGE = null;
		String _URL = null;
		String chkpwValid = null;
		
		if(_USERPW==null) {
			_MESSAGE = "비밀번호를 입력하세요.";
			_URL =  "/users/joinForm.do";
		}else {
			if(_USERPW.trim().length()>5) { // 적합 비밀번호
				// 비밀번호는 중복 여부 확인을 안해도 상관없으니깐 바로 ㄱㄱ
				chkpwValid = _USERPW;
			}else { // 부적합 비밀번호
				_MESSAGE = "비밀번호를 5글자 이상 입력하세요.";
				_URL =  "/users/joinForm.do";
			}
		}
		
		responseMessage(res, _MESSAGE,_URL);
		
		return chkpwValid;
	}
	
	public String useremailValidation(HttpServletRequest req,HttpServletResponse res) throws IOException{
		String _EMAIL = req.getParameter("email");
		String _MESSAGE = null;
		String _URL = null;
		String chkemailValid = null;
		
		if(_EMAIL == null) {
			_MESSAGE = "이메일을 입력하세요.";
			_URL =  "/users/joinForm.do";
		}else { // 이메일을 일단은 작성
			if(_EMAIL.trim().contains("@")) {
				// DB 객체 생성
				MySQLConnector mysql = new MySQLConnector();
				// DB 연결 객체 생성
				Connection conn = mysql.getConnection();
				//쿼리문 작성
				String query = "select * from member where email='" + _EMAIL + "';";
				ResultSet rs = mysql.select(query, conn);
					try {
						if(rs.next()) { // 중복일때
							_MESSAGE = "중복된 이메일입니다.";
							_URL =  "/users/joinForm.do";
						}else { // 사용 가능한 이메일
							chkemailValid = _EMAIL;
						}
					} catch (SQLException e) {
						// TODO Auto-generated catch block
						System.out.println("쿼리문을 확인하세요. query : " + query);
					}
			}else {
				_MESSAGE = "이메일을 입력하세요.";
				_URL =  "/users/joinForm.do";
			}
			
		}
		
		responseMessage(res, _MESSAGE, _URL);
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
