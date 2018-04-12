package board.dramaList;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import jdbc.MySQLConnector;

/**
 * Servlet implementation class liveForm
 */
@WebServlet("/board/dramaList/LiveForm.do")
public class liveForm extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public liveForm() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = request.getRequestDispatcher("/board/dramaName/live.jsp");
		
		float rating1 = 0; // 평점의 값. 결과값으로 나올것.
		String rating2 = null; // 평점의 값. 페이지로 보낼것.
		String receiveRating1 = null; // DB에서 받아오는 평점은 스트링값.
		int receiveRating2 =0; // receiveRating1에서 DB 받아오는 평점을 정수화.
		int count=0;
		MySQLConnector mysql = new MySQLConnector();
		Connection conn = mysql.getConnection();
		String query= "select rating from board where dramaName='라이브'";
		ResultSet rs = mysql.select(query, conn);
		try {
			while(rs.next()) {
				receiveRating1 = rs.getString("rating");
				receiveRating2 = Integer.parseInt(receiveRating1);
				rating1 += receiveRating2;
				count++;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("쿼리문 : " + query);
		}
		
		rating1 = rating1/count;
		rating2= String.valueOf(rating1);
		request.setAttribute("rating", rating2);
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
