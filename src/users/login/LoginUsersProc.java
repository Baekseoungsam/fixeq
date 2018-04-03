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

import jdbc.MySQLConnector;

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
			_MESSAGE = "아이디를 입력하세요";
			_URL = "/users/login/loginForm.do";
		}else {
			MySQLConnector mysql = new MySQLConnector();
			Connection conn = mysql.getConnection();
			
			String query = "select * from member where userid='%userid%' and userpw ='%userpw%'";
			query = query.replace("%userid%", _USERID);
			query = query.replace("%userpw%", _USERPW);
			ResultSet rs = mysql.select(query, conn);
			try {
				if(rs.next()) { // 아이디와 비밀번호가 일치하는게 존재할때 로그인 성공.
					_MESSAGE = "로그인에 성공하였습니다.";
					_URL = "/main.jsp";
				}else {
					_MESSAGE = "아이디 혹은 비밀번호가 다릅니다";
					_URL = "/users/login/loginForm.do";
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				System.out.println("쿼리문을 확인하세요. query : " + query);
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

}
