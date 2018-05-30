package com.nazdaq.tms;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.nazdaq.tms.model.AdditionalInfo;
import com.nazdaq.tms.service.CommonService;
import com.nazdaq.tms.service.UserService;
import com.nazdaq.tms.util.Constants;

@Controller
@PropertySource("classpath:common.properties")
public class AdditionalController implements Constants{

	@Autowired
	private CommonService commonService;
	
	@Autowired
	private UserService userService;
		
	@Value("${cc.email.addresss}")
	String ccEmailAddresss;
	
	@Value("${common.email.address}")
	String commonEmailAddress;	
	
	
	@RequestMapping(value = "/getAIForm", method = RequestMethod.GET)
	public ModelAndView getAIForm (@ModelAttribute("command") AdditionalInfo ai, 
			BindingResult result, Principal principal){		
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		
		Map <String, Object> model = new HashMap<String, Object>();		
		model.put("additionalInfo", ai);
		return new ModelAndView("additionalInfoForm", model);
	}
	
	// saveAIForm
	@RequestMapping(value = "/saveAIForm", method = RequestMethod.POST)
	public ModelAndView saveAIForm (@ModelAttribute("command") AdditionalInfo ai, 
			BindingResult result, Principal principal){		
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		commonService.saveOrUpdateModelObjectToDB(ai);
		return new ModelAndView("redirect:/aiList");
	}
	
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/aiList", method = RequestMethod.GET)
	public ModelAndView aiList (@ModelAttribute("command") AdditionalInfo ai, 
			BindingResult result, Principal principal){		
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		List<AdditionalInfo> aiList = (List<AdditionalInfo>)(Object)commonService.getAllObjectList("AdditionalInfo");
		Map <String, Object> model = new HashMap<String, Object>();		
		model.put("aiList", aiList);
		return new ModelAndView("aiList", model);
	}
	
	
	@RequestMapping(value = "/editAi", method = RequestMethod.GET)
	public ModelAndView editAddInfo (@ModelAttribute("command") AdditionalInfo ai, 
			BindingResult result, Principal principal){		
		
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}		
		AdditionalInfo aidb = (AdditionalInfo) commonService.getAnObjectByAnyUniqueColumn("AdditionalInfo", "id", ai.getId().toString());
		Map <String, Object> model = new HashMap<String, Object>();		
		model.put("additionalInfo", aidb);
		model.put("edit", true);
		return new ModelAndView("additionalInfoForm", model);
	}
	
	
	@RequestMapping(value = "/removeAi", method = RequestMethod.GET)
	public ModelAndView removeAi (AdditionalInfo ai, 
			BindingResult result, Principal principal){		
		
		if(principal == null) {
			return new ModelAndView("redirect:/login");
		}
		commonService.deleteAnObjectById("AdditionalInfo", ai.getId());
		return new ModelAndView("redirect:/aiList");
	}
}
