package users.login;

import java.io.IOException;
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
		String _USERID  = req.getParameter("userid");
		String _USERPW =req.getParameter("userpw");
		
		//DB 객체 초기화
		MySQLConnector mysql = new MySQLConnector();
		//DB 연결 객체 초기화
		Connection conn = mysql.getConnection();
		//쿼리문 작성
		String query = "select * from member where userid='%userid%' and userpw='%userpw%';";
		//쿼리문 실행 결과를 rs로 담음
		ResultSet rs = mysql.select(query, conn);
		// rs의 결과값에 따른 조건분기
		try {
			if(rs.next()) { // 존재하면 로그인 성공
				res.sendRedirect("/main.jsp");
			}else {
				res.sendRedirect("/users/login/loginForm.do");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("쿼리문을 확인하세요. query : " + query);
		}
		
	}

}
