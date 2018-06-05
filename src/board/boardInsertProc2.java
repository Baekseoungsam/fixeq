package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import jdbc.MySQLConnector;
import users.vo.MemberBean;

/**
 * Servlet implementation class boardInsertProc
 */
@WebServlet("/board/InsertProc2.do")
public class boardInsertProc2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardInsertProc2() {
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
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		HttpSession session =request.getSession();
		MemberBean memberVO = (MemberBean)session.getAttribute("memberVO");
		if(memberVO != null) {
			// 로그인 한 이후에 접근.
			//String writer = memberVO.getName();// 작성자
			String writerid = memberVO.getName();
			String writerpw = request.getParameter("writerpw"); // 비밀번호
			String title = request.getParameter("title");// 제목
			String content = request.getParameter("content");// 내용
			String genre = request.getParameter("genre"); // 장르
			String rating = request.getParameter("score"); // 점수
			String history = request.getParameter("history"); // 시청내역
				
				if(title.trim().length()==0) {
					//제목을 입력하지 않았거나 공백으로 제출하였을때
					response.setContentType("text/html");
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					out.write("<script>");
					out.write("alert('제목을 작성하여야 합니다.');");
					out.write("location.href='/board/InsertForm.do';");
					out.write("</script>");
				}else if(content.trim().length()==0) {
					//내용을 입력하지 않았거나 공백으로 제출하였을때
					response.setContentType("text/html");
					response.setCharacterEncoding("UTF-8");
					PrintWriter out = response.getWriter();
					out.write("<script>");
					out.write("alert('내용을 작성하여야 합니다.');");
					out.write("location.href='/board/InsertForm.do';");
					out.write("</script>");
				}else {
					//제목과 내용을 입력하였을 경우이니 데이터가 올바르게 전달되었을때
					//그러면 제목과 내용이 전달되었으니 
					//로그인 정보를 가지고서 글 작성자가 누구인지 처리시킴.
					MySQLConnector mysql = new MySQLConnector();
					Connection conn = mysql.getConnection();
					
				//	String query = "insert into board (writer,title,content,rating,drama,time) values ('%writer%','%title%','%content%',1,'%drama%',SYSDATE())";
					
					String query = "insert into board2 (title,content,writerid,writerpw,genre,rating,history,time) values ('%title%','%content%','%writerid%','%writerpw%','%genre%','%rating%','%history%',SYSDATE())";

					
					query = query.replace("%writerid%", writerid);
					query = query.replace("%writerpw%", writerpw);
					query = query.replace("%title%", title);
					query = query.replace("%content%", content);
					query = query.replace("%genre%", genre);
					query = query.replace("%rating%", rating);
					query = query.replace("%history%", history);

					
					if(mysql.insert(query, conn)) {
						System.out.println("글쓰기가 성공하였습니다.");
						response.sendRedirect("main.jsp");
					}else {
						System.out.println(query);
						System.out.println("글쓰기가 실패하였습니다.");
						response.sendRedirect("/board/InsertForm.do");

					}
		}	
	}else {
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		out.write("<script>");
		out.write("alert('로그인 후 사용 가능합니다.');");
		out.write("location.href='/users/login/loginForm.do';");
		out.write("</script>");
	}


	}
}
