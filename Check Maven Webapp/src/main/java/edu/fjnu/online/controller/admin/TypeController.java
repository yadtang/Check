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

import edu.fjnu.online.domain.Course;
import edu.fjnu.online.domain.Type;
import edu.fjnu.online.domain.User;
import edu.fjnu.online.service.TypeService;
/**
 * 试题类型管理
 * @author hspcadmin
 *
 */
@Controller
public class TypeController {
	
	@Autowired
	TypeService typeService;
	
	@RequestMapping("/toTypePage.action")
	public String toTypePage(@RequestParam(value="page", defaultValue="1") int page,
			Type type,Model model, HttpSession session){
//		List<Type> dataList = typeService.find(type);
		PageInfo<Type> pageInfo = typeService.findByPage(type, page, 5);
		List<Type> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return "/admin/type-mgt.jsp";			
	}
	
	@RequestMapping("/qryTypePage.action")
	@ResponseBody
	public List<Type> qryTypePage(@RequestParam(value="page", defaultValue="1") int page,
			Type type,Model model, HttpSession session){
//		List<Type> dataList = typeService.find(type);
		PageInfo<Type> pageInfo = typeService.findByPage(type, page, 5);
		List<Type> dataList = pageInfo.getList();
		model.addAttribute("dataList", dataList);
		model.addAttribute("pageInfo", pageInfo);
		return dataList;			
	}
	
	/**
	 * 删除题型信息
	 * @param typeId	题型编号，删除多个是，id用逗号分隔开
	 * @param model
	 * @return
	 */
	@RequestMapping("/deleteType.action")
	public String deleteUser(String typeId, Model model){
		if(typeId != null){
			String ids[] = typeId.split(",");
			for(int i=0;i<ids.length;i++){
				typeService.delete(Integer.parseInt(ids[i]));
			}
		}
		return "redirect:/toTypePage.action";
	} 
	/**
	 * 跳转到添加用户信息页面
	 * @param user
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toAddType.action")
	public String toAddType(Type type, Model model, HttpSession session){
		List<Type> dataList = typeService.find(type);
		model.addAttribute("dataList", dataList);
		return "/admin/type-reg.jsp";			
	}
	
	/**
	 * 添加题型信息
	 * @param user
	 * @param model
	 * @return
	 */
	@RequestMapping("/addType.action")
	public String addType(Type type, Model model){
		typeService.insert(type);
		return "redirect:/toTypePage.action";			
	}
	
	/**
	 * 查看题型信息
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toQryType.action")
	public String toQryType(int typeId, Model model, HttpSession session){
		Type typeInfo = typeService.get(typeId);
		model.addAttribute("type", typeInfo);
		return "/admin/type-qry.jsp";			
	}
	
	/**
	 * 跳转到更新题型信息页面
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/toUpdType.action")
	public String toUpdType(int typeId, Model model, HttpSession session){
		Type typeInfo = typeService.get(typeId);
		model.addAttribute("type", typeInfo);
		return "/admin/type-upd.jsp";			
	}
	
	/**
	 * 更新题型信息
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/updType.action")
	public String updType(Type type, Model model, HttpSession session){
		typeService.update(type);
		return "redirect:/toTypePage.action";			
	}
	
	/**
	 * 删除题型信息
	 * @param type
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("/delType.action")
	public String delType(int typeId, Model model, HttpSession session){
		typeService.delete(typeId);
		return "redirect:/toTypePage.action";			
	}
}
