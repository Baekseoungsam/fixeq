package users.login;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.MySQLConnector;
import users.vo.MemberBean;

/**
 * Servlet implementation class LoginUsersProc
 */
@WebServlet("/users/login/loginProc.do")
public class LoginUsersProc extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginUsersProc() {
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
		String _USERID = req.getParameter("userid");
		String _USERPW = req.getParameter("userpw");
		String _MESSAGE = null ;
		String _URL = null;
		
		if(_USERID.trim().length()==0 ||_USERID==null||_USERPW==null ||_USERPW.trim().length()==0 ) {
			_MESSAGE = "아이디와 비밀번호를 모두 입력하세요";
			_URL = "/users/login/loginForm.do";
		}else { // 아이디와 비밀번호가 입력이 되었음
			MemberBean memberVO = memberCheck(_USERID);
			if(memberVO.getUserpw().equals(_USERPW)) { // 아이디와 같이 저장되어있는 비밀번호가 일치한다면
				_MESSAGE = memberVO.getName()+ " 회원님의 로그인이 완료되었습니다.";
				HttpSession session = req.getSession();
				session.setAttribute("memberVO", memberVO);
				_URL = "/main.jsp";

			}else { // 비밀번호가 일치하지 않을때
				_MESSAGE = "아이디 혹은 비밀번호가 일치하지 않습니다. <br> 입력하세요";
				_URL = "/users/login/loginForm.do";

			}
			
		}
		
		
		responseMessage(res, _URL, _MESSAGE);
		
		
	}
	
	
	public void responseMessage(HttpServletResponse res, String url,String message) throws IOException{
		res.setContentType("text/html");
		res.setCharacterEncoding("UTF-8");
		PrintWriter out = res.getWriter();
		out.write("<script>");
		out.write("alert('"+message +"');");
		out.write("location.href='"+url+"'");
		out.write("</script>");
	}
	
	public MemberBean memberCheck(String userid) {
		MemberBean memberVO = null;
		// DB 객체 생성
		MySQLConnector mysql = new MySQLConnector();
		// 연결 객체 생성
		Connection conn = mysql.getConnection();
		// 쿼리문 작성
		String query = "select * from member where userid='%userid%'";
		query = query.replace("%userid%",userid);
		ResultSet rs = mysql.select(query, conn);
		try {
			if(rs.next()) {
				memberVO = new MemberBean();
				memberVO.setIdx(rs.getInt("idx"));
				memberVO.setUserid(rs.getString("userid"));
				memberVO.setUserpw(rs.getString("userpw"));
				memberVO.setName(rs.getString("name"));
				memberVO.setEmail(rs.getString("email"));
				memberVO.setReg_dt(rs.getString("time"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return memberVO;
	}
	
	

}
