package edu.fjnu.online.controller.admin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;

import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Grade;
import edu.fjnu.online.domain.Paper;
import edu.fjnu.online.domain.Question;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.service.CourseService;
import edu.fjnu.online.service.GradeService;
import edu.fjnu.online.service.PaperService;
import edu.fjnu.online.service.QuestionService;
import edu.fjnu.online.service.TypeService;

@Controller
public class PaperController {

	@Autowired
	PaperService paperService;
	@Autowired
	CourseService courseService;
	@Autowired
	TypeService typeService;
	@Autowired
	GradeService gradeService;
	@Autowired
	QuestionService questionService;
	/**
	 * 跳转到试卷管理页面
	 * @param course
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toPaperPage.action")
	public String toPaperPage(@RequestParam(value="page", defaultValue="1") int page,
			Paper paper,Model model, HttpSession session){
		PageInfo<Paper> pageInfo = paperService.findAllPage(paper, page, 5);
		List<Paper> dataList = pageInfo.getList();
//		List<Paper> dataList = paperService.find(paper);
		Course course=null;
		for(Paper g : dataList){
			String courseName= "";
			String id = g.getCourseId();
			if(id != null){
				String ids[] = id.split(",");
				for(int i=0;i<ids.length;i++){
					course = courseService.get(Integer.parseInt(ids[i]));
					courseName+=course.getCourseName()+",";
				}
			}
			//判断最后一个字符是否为逗号，若是截取
			String str = courseName.substring(courseName.length() -1, courseName.length());
			if(",".equals(str)){
				str = courseName.substring(0, courseName.length()-1);
			}else{
				str = courseName;
			}
			g.setCourseId(str);
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/paper-mgt.jsp";			
	}
	
	
	/**
	 * 跳转到试卷管理页面
	 * @param course
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/qryAllPaper.action")
	@ResponseBody
	public List<Paper> qryAllPaper(@RequestParam(value="page", defaultValue="1") int page,
			Paper paper,Model model, HttpSession session){
		PageInfo<Paper> pageInfo = paperService.findAllPage(paper, page, 5);
		List<Paper> dataList = pageInfo.getList();
//		List<Paper> dataList = paperService.find(paper);
		Course course=null;
		for(Paper g : dataList){
			String courseName= "";
			String id = g.getCourseId();
			if(id != null){
				String ids[] = id.split(",");
				for(int i=0;i<ids.length;i++){
					course = courseService.get(Integer.parseInt(ids[i]));
					courseName+=course.getCourseName()+",";
				}
			}
			//判断最后一个字符是否为逗号，若是截取
			String str = courseName.substring(courseName.length() -1, courseName.length());
			if(",".equals(str)){
				str = courseName.substring(0, courseName.length()-1);
			}else{
				str = courseName;
			}
			g.setCourseId(str);
		}
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 跳转到新增试卷页面
	 * @param paper
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddPaperPage.action")
	public String toAddPaperPage(Paper paper,Model model, HttpSession session){
		model.addAttribute("course", courseService.find(new Course()));
		model.addAttribute("grade", gradeService.find(new Grade()));
		model.addAttribute("type", typeService.find(new Type()));
		return "/admin/paper-reg.jsp";
	}
	
	/**
	 * 新增试卷
	 * @param paper
	 * @param model
	 * @param session
	 * @return
	 */
	@SuppressWarnings("unchecked")
	@RequestMapping("/addPaper.action")
	public String addPaper(@RequestParam int selectNum,@RequestParam int inputNum,
			@RequestParam int descNum,Paper paper,Model model, HttpSession session){
		Map map = new HashMap();
		List<Question> selectList = null;
		List<Question> inputList = null;
		List<Question> descList = null;
		List<Question> paperList = new ArrayList<Question>();
		map.put("gradeId", paper.getGradeId());
		map.put("courseId", paper.getCourseId());
		if(selectNum>0){//选择题
			map.put("num", selectNum);
			map.put("typeId", 1);
			selectList = questionService.createPaper(map);
			paperList.addAll(selectList);
		}
		if(inputNum>0){//判断题
			map.put("num", inputNum);
			map.put("typeId", 4);
			inputList = questionService.createPaper(map);
			paperList.addAll(inputList);
		}
		if(descNum > 0 ){//描述题
			map.put("num", descNum);
			map.put("typeId", 5);
			descList = questionService.createPaper(map);
			paperList.addAll(descList);
		}
		String quesId = "";
		for(Question ques : paperList){
			quesId+=ques.getQuestionId()+",";
		}
		if(!quesId.isEmpty()){
			quesId = removeLast(quesId);
		}
		paper.setQuestionId(quesId);
		paper.setPaperstate("0");
		paperService.insert(paper);
		return "redirect:/toPaperPage.action";
	}
	
	/**
	 * 删除试卷信息
	 * @param paperId	试卷编号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deletePaper.action")
	public String deletePaper(String paperId, Model model){
		if(paperId != null){
			String ids[] = paperId.split(",");
			for(int i=0;i<ids.length;i++){
				paperService.delete(ids[i]);
			}
		}
		return "redirect:/toPaperPage.action";
	} 
	
	@RequestMapping("/qryPaper.action")
	public String qryPaper(String paperId, Model model){
		Paper paper = paperService.get(paperId);
		String quesId = paper.getQuestionId();
		List<Question> quesList =new ArrayList<Question>();
		Question question = null;
		Course course = courseService.get(Integer.parseInt(paper.getCourseId()));
		paper.setCourseId(course.getCourseName());
		int selNum=0;
		int inpNum=0;
		int desNum=0;
		if(quesId != null){
			String ids[] = quesId.split(",");
			for(int i=0;i<ids.length;i++){
				question = questionService.get(Integer.parseInt(ids[i]));
				quesList.add(question);
				if("1".equals(question.getTypeId())){
					selNum+=1;
				}
				if("4".equals(question.getTypeId())){
					inpNum+=1;
				}
				if("5".equals(question.getTypeId())){
					desNum+=1;
				}
			}
		}
		paper.setScore(selNum+"");
		paper.setBeginTime(inpNum+"");
		paper.setEndTime(desNum+"");
		model.addAttribute("paper", paper);
		model.addAttribute("quesList", quesList);
		return "/admin/paper-qry.jsp";
	}
	
	
	/**
	 * 去掉最后一个逗号
	 * @param str
	 * @return
	 */
	public String removeLast(String str){
		//判断最后一个字符是否为逗号，若是截取
		String newStr = str.substring(str.length() -1, str.length());
		if(",".equals(newStr)){
			newStr = str.substring(0, str.length()-1);
		}else{
			newStr = str;
		}
		return newStr;
	}
	
}
