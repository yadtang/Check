package edu.fjnu.online.controller.admin;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.controller.BaseController;
import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Grade;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.service.CourseService;
import edu.fjnu.online.service.GradeService;
import edu.fjnu.online.service.QuestionService;
import edu.fjnu.online.service.TypeService;
/**
 * 题库管理
 * @author hspcadmin
 *
 */
@Controller
public class QuestionController extends BaseController {

	@Autowired
	QuestionService questionService;
	@Autowired
	CourseService courseService;
	@Autowired
	TypeService typeService;
	@Autowired
	GradeService gradeService;
	/**
	 * 跳转到题库管理页面
	 * @param question
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toQuestionPage.action")
	public String toQuestionPage(@RequestParam(value="page", defaultValue="1") int page,
			Question question,Model model, HttpSession session){
//		List<Question> dataList = questionService.find(question);
		PageInfo<Question> pageInfo = questionService.findByPage(question, page, 5);
		List<Question> dataList = pageInfo.getList();
		Course course=null;
		Type type=null;
		for(Question que : dataList){
			String courseName= "";
			String typeName="";
			course = courseService.get(Integer.parseInt(que.getCourseId()));
			type = typeService.get(Integer.parseInt(que.getTypeId()));
			courseName=course.getCourseName();
			typeName=type.getTypeName();
			que.setCourseId(courseName);
			que.setTypeId(typeName);
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/question-mgt.jsp";			
	}
	
	/**
	 * 跳转到题库管理页面
	 * @param question
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/quesPage.action")
	@ResponseBody
	public List<Question> quesPage(@RequestParam(value="page", defaultValue="1") int page,
			Question question,Model model, HttpSession session){
//		List<Question> dataList = questionService.find(question);
		PageInfo<Question> pageInfo = questionService.findByPage(question, page, 5);
		List<Question> dataList = pageInfo.getList();
		Course course=null;
		Type type=null;
		for(Question que : dataList){
			String courseName= "";
			String typeName="";
			course = courseService.get(Integer.parseInt(que.getCourseId()));
			type = typeService.get(Integer.parseInt(que.getTypeId()));
			courseName=course.getCourseName();
			typeName=type.getTypeName();
			que.setCourseId(courseName);
			que.setTypeId(typeName);
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 删除问题信息
	 * @param questionId	问题编号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteQuestion.action")
	public String deleteQuestion(String questionId, Model model){
		if(questionId != null){
			String ids[] = questionId.split(",");
			for(int i=0;i<ids.length;i++){
				questionService.delete(Integer.parseInt(ids[i]));
			}
		}
		return "redirect:/toQuestionPage.action";
	} 
	/**
	 * 跳转到添加试题信息页面
	 * @param question
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddQuestion.action")
	public String toAddQuestion(Question question, Model model, HttpSession session){
		//获取问题信息
		List<Question> dataList = questionService.find(question);
		//获取课程信息
		List<Course> courseList = courseService.find(new Course());
		//获取年级信息
		model.addAttribute("grade", gradeService.find(new Grade()));
		//获取题型信息
		model.addAttribute("type", typeService.find(new Type()));
		model.addAttribute("dataList", dataList);
		model.addAttribute("course", courseList);
		return "/admin/question-reg.jsp";			
	}
	
	/**
	 * 添加试题信息
	 * @param question
	 * @param model
	 * @return
	 */
	@RequestMapping("/addQuesInfo.action")
	public String addQuesInfo(Question question, Model model){
		questionService.insert(question);
		return "redirect:/toQuestionPage.action";			
	}
	
	/**
	 * 查看问题信息
	 * @param questionId 问题编号
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toQryQuestion.action")
	public String toQryQuestion(int questionId, Model model, HttpSession session){
		Question questionInfo = questionService.get(questionId);
		Grade grade = gradeService.get(Integer.parseInt(questionInfo.getGradeId()));
		Course course = courseService.get(Integer.parseInt(questionInfo.getCourseId()));
		Type type = typeService.get(Integer.parseInt(questionInfo.getTypeId()));
		questionInfo.setGradeId(grade.getGradeName());
		questionInfo.setCourseId(course.getCourseName());
		questionInfo.setTypeId(type.getTypeName());
		model.addAttribute("question", questionInfo);
		return "/admin/question-qry.jsp";			
	}
	
	/**
	 * 跳转到更新题目信息页面
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpdQuestion.action")
	public String toUpdQuestion(int questionId, Model model, HttpSession session){
		Question questionInfo = questionService.get(questionId);
		model.addAttribute("question", questionInfo);
		List<Grade>gradeList = gradeService.find(new Grade());
		List<Course>courseList = courseService.find(new Course());
		List<Type> typeList = typeService.find(new Type());
		model.addAttribute("gradeList", gradeList);
		model.addAttribute("courseList", courseList);
		model.addAttribute("typeList", typeList);
		return "/admin/question-upd.jsp";			
	}
	
	/**
	 * 更新题目信息
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/updQuestion.action")
	public String updQuestion(Question question, Model model, HttpSession session){
		questionService.update(question);
		return "redirect:/toQuestionPage.action";			
	}
	
	/**
	 * 删除问题信息
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/delQuestion.action")
	public String delQuestion(int questionId, Model model, HttpSession session){
		questionService.delete(questionId);
		return "redirect:/todelQuestionPage.action";			
	}
}
