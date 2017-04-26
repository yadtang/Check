package edu.fjnu.online.domain;
/**
 * 题目类型
 * @author hspcadmin
 *
 */
public class Type {
	/**题型编号*/
	private int typeId;
	/**题型名称*/
	private String typeName;
	/**分值*/
	private int score;
	/**备注*/
	private String remark;
	public int getTypeId() {
		return typeId;
	}
	public void setTypeId(int typeId) {
		this.typeId = typeId;
	}
	public String getTypeName() {
		return typeName;
	}
	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	
	public Type() {

	}
	public Type(int typeId, String typeName, int score, String remark) {
		super();
		this.typeId = typeId;
		this.typeName = typeName;
		this.score = score;
		this.remark = remark;
	}
	@Override
	public String toString() {
		return "Type [typeId=" + typeId + ", typeName=" + typeName + ", score="
				+ score + ", remark=" + remark + "]";
	}
	
}
