package edu.fjnu.online.domain;
/**
 * 错题本
 * @author hspcadmin
 *
 */
public class ErrorBook {

	/**错题编号*/
	private int bookId;
	/**用户编号*/
	private String userId;
	/**科目编号*/
	private String courseId;
	/**年级编号*/
	private String gradeId;
	/**学生答案*/
	private String userAnswer;
	/**问题编号*/
	private Question question;
	/**题型编号*/
	private String typeId;
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public String getGradeId() {
		return gradeId;
	}
	public void setGradeId(String gradeId) {
		this.gradeId = gradeId;
	}
	public String getUserAnswer() {
		return userAnswer;
	}
	public void setUserAnswer(String userAnswer) {
		this.userAnswer = userAnswer;
	}
	public String getTypeId() {
		return typeId;
	}
	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}
	public Question getQuestion() {
		return question;
	}
	public void setQuestion(Question question) {
		this.question = question;
	}
	public ErrorBook() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ErrorBook(int bookId, String userId, String courseId,
			String gradeId, String userAnswer, Question question, String typeId) {
		super();
		this.bookId = bookId;
		this.userId = userId;
		this.courseId = courseId;
		this.gradeId = gradeId;
		this.userAnswer = userAnswer;
		this.question = question;
		this.typeId = typeId;
	}
	@Override
	public String toString() {
		return "ErrorBook [bookId=" + bookId + ", userId=" + userId
				+ ", courseId=" + courseId + ", gradeId=" + gradeId
				+ ", userAnswer=" + userAnswer + ", question=" + question
				+ ", typeId=" + typeId + "]";
	}

	
}
