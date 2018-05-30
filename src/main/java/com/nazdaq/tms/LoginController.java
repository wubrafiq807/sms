package com.nazdaq.tms;

import java.security.Principal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.web.authentication.SavedRequestAwareAuthenticationSuccessHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nazdaq.tms.model.Reagent;
import com.nazdaq.tms.model.TravelRequisition;
import com.nazdaq.tms.model.User;
import com.nazdaq.tms.model.WorkOrderDtl;
import com.nazdaq.tms.model.WorkOrderMst;
import com.nazdaq.tms.service.CommonService;
import com.nazdaq.tms.service.UserService;
import com.nazdaq.tms.util.Constants;



@Controller
public class LoginController extends SavedRequestAwareAuthenticationSuccessHandler implements Constants{
		
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommonService commonService;
	
	
	@RequestMapping(value="/success", method = RequestMethod.GET)
	public String success(ModelMap model) {
	return "success"; 
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value={"/","/index"}, method = RequestMethod.GET)
	public ModelAndView printWelcome1(ModelMap model, Principal principal, HttpSession session, HttpServletRequest request) {
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		
		String pageLocation=null;
		User user=null;
		String name = principal.getName();
		user=userService.getUser(name);	
		
		session.setAttribute("userr", name);
		session.setAttribute("uid", 1);
		Short userId=user.getEmpId();
		session.setAttribute("userrId", userId);
		model.addAttribute("userName", session.getAttribute("userr"));
		model.addAttribute("userId", session.getAttribute("userrId"));
		
	    List<WorkOrderMst> workOrderMsts=(List<WorkOrderMst>) (Object)	commonService.getObjectListByAnyColumnOrderByAscOrDscByLimit("WorkOrderMst" , "created_date", "desc", 30);
		List lists=commonService.getListBySqlQuery("SELECT COUNT(id) as totalWwork,(SELECT COUNT(id) from reagent) as totalReagent,(SELECT COUNT(id) from reagentproperty) as totalReagentPoperty FROM `work_order_mst`");
	  
		model.put("WorkOrderList", workOrderMsts);
	    model.put("extra",lists.get(0));
		
		return new ModelAndView("accountDashboard", model);
	}

	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String login(Principal principal) {
		if(principal != null) {
			return "/index";
		}
 		return "login";
	}
 
	@RequestMapping(value="/loginfailed", method = RequestMethod.GET)
	public String loginerror(Model model) {
 
		model.addAttribute("error", "true");
		return "login";
 
	}
 
	@RequestMapping(value="/logout", method = RequestMethod.GET)
	public String logout(Model model, HttpSession session) {
		session.invalidate();
 		return "login";
 	}
	
	/**
	 * This method returns the principal[user-name] of logged-in user.
	 */
	protected String getPrincipal(){
		String userName = null;
		Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();

		if (principal instanceof UserDetails) {
			userName = ((UserDetails)principal).getUsername();
		} else {
			userName = principal.toString();
		}
		return userName;
	}
	
	
}
