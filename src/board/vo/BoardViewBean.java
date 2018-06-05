package board.vo;

public class BoardViewBean {
	
/*	String writerid = memberVO.getName();
	String writerpw = request.getParameter("writerpw"); // 비밀번호
	String title = request.getParameter("title");// 제목
	String content = request.getParameter("content");// 내용
	String genre = request.getParameter("genre"); // 장르
	String rating = request.getParameter("score"); // 점수
	String history = request.getParameter("history"); // 시청내역
*/
	String writerid= null;
	String writerpw = null;
	String title = null;
	String content = null;
	String genre = null;
	String rating = null;
	String history = null;
	
	public String getWriterid() {
		return writerid;
	}
	public void setWriterid(String writerid) {
		this.writerid = writerid;
	}
	public String getWriterpw() {
		return writerpw;
	}
	public void setWriterpw(String writerpw) {
		this.writerpw = writerpw;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getRating() {
		return rating;
	}
	public void setRating(String rating) {
		this.rating = rating;
	}
	public String getHistory() {
		return history;
	}
	public void setHistory(String history) {
		this.history = history;
	}
	
	
}
