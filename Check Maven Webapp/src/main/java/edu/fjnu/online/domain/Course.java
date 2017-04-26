package edu.fjnu.online.domain;
/**
 * 课程表
 * @author hspcadmin
 *
 */
public class Course {
	/**课程编号*/
	private int courseId;
	/**课程名称*/
	private String courseName;
	/**课程状态*/
	private String courseState;
	public int getCourseId() {
		return courseId;
	}
	public void setCourseId(int courseId) {
		this.courseId = courseId;
	}
	public String getCourseName() {
		return courseName;
	}
	public void setCourseName(String courseName) {
		this.courseName = courseName;
	}
	public String getCourseState() {
		return courseState;
	}
	public void setCourseState(String courseState) {
		this.courseState = courseState;
	}
	public Course() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Course(int courseId, String courseName, String courseState) {
		super();
		this.courseId = courseId;
		this.courseName = courseName;
		this.courseState = courseState;
	}
	@Override
	public String toString() {
		return "Course [courseId=" + courseId + ", courseName=" + courseName
				+ ", courseState=" + courseState + "]";
	}
}
