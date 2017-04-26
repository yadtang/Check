package edu.fjnu.online.domain;
/**
 * 试卷实体
 * @author hspcadmin
 *
 */
public class Paper {
	/**试卷编号*/
	private String paperId;
	/**试卷名称*/
	private String paperName;
	/**对应课程*/
	private String courseId;
	/**适合年级*/
	private String gradeId;
	/**学生编号*/
	private String userId;
	/**问题编号*/
	private String questionId;
	/**开始时间*/
	private String beginTime;
	/**结束时间*/
	private String endTime;
	/**允许时长*/
	private String allowTime;
	/**分数*/
	private String score;
	/**试卷状态 0:准备考试1:尚未开始2:已完成*/
	private String paperState;
	public Paper() {
		
	}
	public Paper(String paperId, String paperName, String courseId,
			String gradeId, String userId, String questionId, String beginTime,
			String endTime, String allowTime, String score, String paperState) {
		super();
		this.paperId = paperId;
		this.paperName = paperName;
		this.courseId = courseId;
		this.gradeId = gradeId;
		this.userId = userId;
		this.questionId = questionId;
		this.beginTime = beginTime;
		this.endTime = endTime;
		this.allowTime = allowTime;
		this.score = score;
		this.paperState = paperState;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public String getPaperName() {
		return paperName;
	}
	public void setPaperName(String paperName) {
		this.paperName = paperName;
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
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getQuestionId() {
		return questionId;
	}
	public void setQuestionId(String questionId) {
		this.questionId = questionId;
	}
	public String getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getAllowTime() {
		return allowTime;
	}
	public void setAllowTime(String allowTime) {
		this.allowTime = allowTime;
	}
	public String getScore() {
		return score;
	}
	public void setScore(String score) {
		this.score = score;
	}
	public String getPaperstate() {
		return paperState;
	}
	public void setPaperstate(String paperstate) {
		this.paperState = paperstate;
	}
	@Override
	public String toString() {
		return "Paper [paperId=" + paperId + ", paperName=" + paperName
				+ ", courseId=" + courseId + ", gradeId=" + gradeId
				+ ", userId=" + userId + ", questionId=" + questionId
				+ ", beginTime=" + beginTime + ", endTime=" + endTime
				+ ", allowTime=" + allowTime + ", score=" + score
				+ ", paperstate=" + paperState + "]";
	}
	
}
