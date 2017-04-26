package edu.fjnu.online.domain;
/**
 * 年级
 * @author hspcadmin
 *
 */
public class Grade {
	/**年级编号*/
	private int gradeId;
	/**年级名称*/
	private String gradeName;
	/**包含课程*/
	private String courseId;
	public int getGradeId() {
		return gradeId;
	}
	public void setGradeId(int gradeId) {
		this.gradeId = gradeId;
	}
	public String getGradeName() {
		return gradeName;
	}
	public void setGradeName(String gradeName) {
		this.gradeName = gradeName;
	}
	public String getCourseId() {
		return courseId;
	}
	public void setCourseId(String courseId) {
		this.courseId = courseId;
	}
	public Grade() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Grade(int gradeId, String gradeName, String courseId) {
		super();
		this.gradeId = gradeId;
		this.gradeName = gradeName;
		this.courseId = courseId;
	}
	@Override
	public String toString() {
		return "Grade [gradeId=" + gradeId + ", gradeName=" + gradeName
				+ ", courseId=" + courseId + "]";
	}
	
	
}
