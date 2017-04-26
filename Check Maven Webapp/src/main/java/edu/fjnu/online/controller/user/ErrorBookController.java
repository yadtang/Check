package edu.fjnu.online.controller.user;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.ErrorBook;
import edu.fjnu.online.domain.Grade;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.domain.User;
import edu.fjnu.online.service.CourseService;
import edu.fjnu.online.service.ErrorBookService;
import edu.fjnu.online.service.GradeService;
import edu.fjnu.online.service.TypeService;
import edu.fjnu.online.service.UserService;

@Controller
public class ErrorBookController {
	@Autowired
	ErrorBookService bookService;
	@Autowired
	GradeService gradeService;
	@Autowired
	CourseService courseService;
	@Autowired
	TypeService typeService;
	@Autowired
	UserService userService;
	//跳转到我的错题本页面
	@RequestMapping("/toMyBooksPage.action")
	public String toMyBooksPage(User user, Model model, HttpSession session){
		if(session.getAttribute("user")== null){
			session.setAttribute("user", userService.get(user.getUserId()));
		}
		List<ErrorBook> errorBookList = bookService.find(new ErrorBook());
		List<Grade> gradeList = gradeService.find(new Grade());
		List<Course> courseList = courseService.find(new Course());
		List<Type> typeList = typeService.find(new Type());
		Map map = new HashMap();
		map.put("userId", user.getUserId());
		List<ErrorBook> bookList = bookService.getBookInfo(map);
		model.addAttribute("grade", gradeList);
		model.addAttribute("course", courseList);
		model.addAttribute("type", typeList);
		model.addAttribute("errorBook", bookList);
		return "/user/mybooks.jsp";			
	}
	
	//跳转到前台登录页面
	@RequestMapping("/getBooks.action")
	public String getBooks(User user, Model model, HttpSession session){
		List<Grade> gradeList = gradeService.find(new Grade());
		List<Course> courseList = courseService.find(new Course());
		List<Type> typeList = typeService.find(new Type());
		List<ErrorBook> errorBookList = bookService.getBookInfo(new HashMap());
		model.addAttribute("grade", gradeList);
		model.addAttribute("course", courseList);
		model.addAttribute("type", typeList);
		return "/user/mybooks.jsp";			
	}
	
}
