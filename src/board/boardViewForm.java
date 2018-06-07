package board;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.vo.BoardViewBean;
import jdbc.MySQLConnector;

/**
 * Servlet implementation class boardViewForm
 */
@WebServlet("/board/viewForm.do")
public class boardViewForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public boardViewForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/fixeq/nav-site/boardView.jsp");
		MySQLConnector mysql = new MySQLConnector();
		String query = "select * from board2 where idx = %idx% order by time desc";
		
		// 일단 여기에 idx 왜 받는지 추적.왜냐? idx를 주소창에 띄우게끔 하므로.
		String idx = request.getParameter("idx");
		
		query = query.replace("%idx%", idx);
		ResultSet rs = mysql.select(query, mysql.getConnection());
		BoardViewBean bean = new BoardViewBean();
		System.out.println(query);
		try {
			while(rs.next()) {
				bean.setTitle(rs.getString("title"));
				bean.setContent(rs.getString("content"));
				bean.setWriterid(rs.getString("writerid"));
				bean.setWriterpw(rs.getString("writerpw"));
				bean.setGenre(rs.getString("genre"));
				bean.setRating(rs.getString("rating"));
				bean.setHistory(rs.getString("history"));
			}
			
		}catch (SQLException e) {
			e.printStackTrace();
		}
		request.setAttribute("view",bean);
		rd.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
