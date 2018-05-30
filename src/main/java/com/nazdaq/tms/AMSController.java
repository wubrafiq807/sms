package com.nazdaq.tms;

import java.io.IOException;
import java.io.PrintWriter;
import java.math.BigDecimal;
import java.math.RoundingMode;
import java.security.Principal;
import java.text.DecimalFormat;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.MessagingException;
import javax.persistence.NamedSubgraph;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.nazdaq.tms.model.AdditionalInfo;
import com.nazdaq.tms.model.Employee;
import com.nazdaq.tms.model.Reagent;
import com.nazdaq.tms.model.ReagentProperty;

import com.nazdaq.tms.model.SiteSettings;
import com.nazdaq.tms.model.TravelRequisition;
import com.nazdaq.tms.model.User;
import com.nazdaq.tms.model.WorkOrderDtl;
import com.nazdaq.tms.model.WorkOrderMst;
import com.nazdaq.tms.service.CommonService;
import com.nazdaq.tms.service.UserService;
import com.nazdaq.tms.util.Constants;
import com.nazdaq.tms.util.SendEmail;
import com.nazdaq.tms.util.SendSms;

@Controller
@PropertySource("classpath:common.properties")
public class AMSController implements Constants {

	@Autowired
	private CommonService commonService;

	@Autowired
	private UserService userService;

	@Autowired
	private JavaMailSender mailSender;

	@Value("${cc.email.addresss}")
	String ccEmailAddresss;

	@Value("${common.email.address}")
	String commonEmailAddress;

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newWorkOrder", method = RequestMethod.GET)
	public ModelAndView getNewRequisitionForm(@ModelAttribute("workOrderForm") WorkOrderMst orderMst,
			BindingResult result, Principal principal) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		Map<String, Object> model = new HashMap<String, Object>();
		List<Reagent> reagents = (List<Reagent>) (Object) commonService.getAllObjectList("Reagent");
		model.put("reagentlist", reagents);
		List<ReagentProperty> reagentproperty_lis = (List<ReagentProperty>) (Object) commonService
				.getAllObjectList("ReagentProperty");
		List<SiteSettings> settingList = (List<SiteSettings>) (Object) commonService.getAllObjectList("SiteSettings");
		model.put("reagentproperty_lis", reagentproperty_lis);
		model.put("settingList", settingList);
		return new ModelAndView("workOrderForm", model);
	}

	@RequestMapping(value = "/getReagentAjax", method = RequestMethod.POST)
	private @ResponseBody void getOneTimePassword(HttpServletRequest request, Principal principal,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, Exception {
		String toJson = "";
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		Reagent reagent = (Reagent) commonService.getAnObjectByAnyUniqueColumn("Reagent", "id",
				request.getParameter("reagent_id").toString());
		JsonElement reagentobj = gson.toJsonTree(reagent);
		myObj.add("reagentinfo", reagentobj);
		out.println(myObj.toString());

		out.close();

	}

	@RequestMapping(value = "/checkWorkOrderExist", method = RequestMethod.POST)
	private @ResponseBody void checkWorkOrderExist(HttpServletRequest request, Principal principal,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, Exception {
		String toJson = "";
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		WorkOrderMst workOrderMst = (WorkOrderMst) commonService.getAnObjectByAnyUniqueColumn("WorkOrderMst",
				"workorder_no", request.getParameter("workOrderNo").toString().trim());
		JsonElement masterobject = gson.toJsonTree(workOrderMst);
		myObj.add("masterinfo", masterobject);
		out.println(myObj.toString());

		out.close();

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/ajaxGetDtlInfo", method = RequestMethod.POST)
	private @ResponseBody void ajaxGetDtlInfo(HttpServletRequest request, Principal principal,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, Exception {
		String toJson = "";
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		/*
		 * List<WorkOrderDtl> workOrderDtls = (List<WorkOrderDtl>) (Object)
		 * commonService.getObjectListByAnyColumn("WorkOrderDtl", "work_order_mst_id",
		 * request.getParameter("mst_id").toString());
		 */
		String query = "SELECT wrkd.* ,r.id as reagent_id,r.reagentname from work_order_dtl wrkd join reagent r on (wrkd.reagent_id=r.id) WHERE wrkd.work_order_mst_id="
				+ request.getParameter("mst_id") + "";
		List listin = commonService.getListByQuery(
				"SELECT wrkd.* ,r.reagentname from work_order_dtl wrkd join reagent r on wrkd.reagent_id=r.id WHERE wrkd.work_order_mst_id=3");
		JsonElement workOrderObj = gson.toJsonTree(listin);
		myObj.add("work_dtl", workOrderObj);

		out.println(myObj.toString());

		out.close();

	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getDtlInfo/{id}", method = RequestMethod.GET)
	public ModelAndView GetDtlInfo(Principal principal, @PathVariable String id) throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		Map<String, Object> model = new HashMap<String, Object>();
		List listin = commonService.getListByQuery(
				"SELECT wrkd.* ,r.reagentname,rp.propertyname,rp.id as property_id,r.reagent_partno,r.reagent_origin,r.reagentunitvalue from work_order_dtl wrkd join reagent r on wrkd.reagent_id=r.id join reagentproperty rp on r.propertyid=rp.id WHERE wrkd.work_order_mst_id="
						+ Integer.parseInt(id) + "");
		model.put("WorkOrderDTLList", listin);
		List<ReagentProperty> reagentProperties = (List<ReagentProperty>) (Object) commonService
				.getAllObjectList("ReagentProperty");
		model.put("reagentProperties", reagentProperties);
		return new ModelAndView("workOrderDetailsList", model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getReagentAjaxbyProperty", method = RequestMethod.POST)
	private @ResponseBody void getReagentAjaxbyProperty(HttpServletRequest request, Principal principal,
			HttpServletResponse response) throws JsonGenerationException, JsonMappingException, Exception {
		String toJson = "";
		PrintWriter out = response.getWriter();
		Gson gson = new Gson();
		JsonObject myObj = new JsonObject();
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		List<Reagent> reagents = (List<Reagent>) (Object) commonService.getObjectListByAnyColumn("Reagent",
				"propertyid", request.getParameter("property_id").toString());
		JsonElement reagentobj = gson.toJsonTree(reagents);
		myObj.add("reagentinfo", reagentobj);
		out.println(myObj.toString());

		out.close();

	}

	@ResponseBody
	@RequestMapping(value = "/ajaxreagentdata", method = RequestMethod.POST)
	public String ajaxreagentdata(HttpServletRequest request, HttpServletResponse response, Principal principal)
			throws IOException {
		String toJson = "";
		String result = "result";
		// if (principal == null) {
		// return "redirect:/login";
		// }
		ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
		result = request.getParameter("reagent_id");
		toJson = ow.writeValueAsString(result);
		return toJson;
	}

	@ResponseBody
	@RequestMapping(value = "/updateWorkOrderMast", method = RequestMethod.POST)
	public ModelAndView updateWorkOrderMast(HttpServletRequest request, HttpServletResponse response,
			Principal principal, WorkOrderMst mst, WorkOrderDtl dtl, RedirectAttributes redirectAttrs) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		String vendorName, addressLine1, addressLine2, workOrderNo, workOrderDate, vendorQuotationNo,
				vendorQuotationDate, workOrderSubject = null;
		String paymentMode, deliveryPlace, deliveryTime, createdBy, createdDate, modifiedBy = null;
		String modifiedDate, serialNo, deliverySchedule, specialCondition, div_no = null;
		String[] quantity, reagent_id = null;
		Integer id = 0;
		// permissoes = request.getParameterValues("serialNo[]");
		vendorName = request.getParameter("vendorName").toString();
		addressLine1 = request.getParameter("addressLine1").toString();
		addressLine2 = request.getParameter("addressLine2").toString();
		workOrderNo = request.getParameter("workOrderNo").toString();
		workOrderDate = request.getParameter("workOrderDate").toString();
		vendorQuotationNo = request.getParameter("vendorQuotationNo").toString();
		vendorQuotationDate = request.getParameter("vendorQuotationDate").toString();
		workOrderSubject = request.getParameter("workOrderSubject").toString();
		paymentMode = request.getParameter("paymentMode").toString();
		deliveryPlace = request.getParameter("deliveryPlace").toString();
		deliverySchedule = request.getParameter("deliverySchedule").toString();
		specialCondition = request.getParameter("specialCondition").toString();
		modifiedDate = this.getCurrentLocalDateTimeStamp().toString();
		modifiedBy = principal.getName().toString();
		id = Integer.parseInt(request.getParameter("id").toString());
		WorkOrderMst mst2 = (WorkOrderMst) commonService.getAnObjectByAnyUniqueColumn("WorkOrderMst", "id",
				id.toString());
		mst.setId(id);
		mst.setVendorName(vendorName);
		mst.setAddressLine1(addressLine1);
		mst.setAddressLine2(addressLine2);
		mst.setModifiedBy(modifiedBy);
		mst.setModifiedDate(modifiedDate);
		mst.setDeliveryPlace(deliveryPlace);
		mst.setDeliverySchedule(deliverySchedule);
		mst.setPaymentMode(paymentMode);
		// mst.setSerialNo(serialNo);
		mst.setSpecialCondition(specialCondition);
		mst.setVendorQuotationDate(vendorQuotationDate);
		mst.setVendorQuotationNo(vendorQuotationNo);
		mst.setWorkOrderDate(workOrderDate);
		mst.setWorkOrderNo(workOrderNo);
		mst.setWorkOrderSubject(workOrderSubject);
		mst.setCreatedBy(mst2.getCreatedBy());
		mst.setCreatedDate(mst2.getCreatedDate());
		mst.setFooterText(request.getParameter("footerText").toString().trim());
		mst.setDiscountAmount(Double.parseDouble(request.getParameter("discountAmount")));
		mst.setDiscountedTotalAmount(Double.parseDouble(request.getParameter("discountedTotalAmount")));
		mst.setOriginalTotalAmount(Double.parseDouble(request.getParameter("originalTotalAmount")));
		;
		commonService.saveOrUpdateModelObjectToDB(mst);

		/*
		 * for (int i = 0; i < reagent_id.length; i++) {
		 * dtl.setQuantity(Integer.parseInt(quantity[i]));
		 * dtl.setReagentId(Integer.parseInt(reagent_id[i])); dtl.setWorkOrderMstId(id);
		 * commonService.saveWithReturnId(dtl); }
		 */
		redirectAttrs.addFlashAttribute("success", "You  have updated a new work order.");
		return new ModelAndView("redirect:/getWorkOrderList");
	}

	@ResponseBody
	@RequestMapping(value = "/updateWorkOrderDTl", method = RequestMethod.POST)
	public ModelAndView updateWorkOrderDTl(HttpServletRequest request, HttpServletResponse response,
			Principal principal, WorkOrderDtl dtl, RedirectAttributes redirectAttrs, WorkOrderMst mst) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		String checkAddOrUpdate = null;
		checkAddOrUpdate = request.getParameter("btn_add_new");
		int saveflag = 0;
		if (checkAddOrUpdate != null) {
			redirectAttrs.addFlashAttribute("success", "You  have added a  new work order Details.");

			saveflag = 1;
		} else {
			redirectAttrs.addFlashAttribute("success", "You  have updated a work order Details.");
			dtl.setId(Integer.parseInt(request.getParameter("id")));
		}

		dtl.setQuantity(Integer.parseInt(request.getParameter("quantity")));
		dtl.setReagentId(Integer.parseInt(request.getParameter("reagentId")));
		dtl.setSerialNo(request.getParameter("serialNo").toString());
		dtl.setWorkOrderMstId(Integer.parseInt(request.getParameter("mst_id")));
		if (saveflag == 1) {
			Integer id = commonService.saveWithReturnId(dtl);
			WorkOrderMst mst2 = (WorkOrderMst) commonService.getAnObjectByAnyUniqueColumn("WorkOrderMst", "id",
					request.getParameter("mst_id"));
			mst.setAddressLine1(mst2.getAddressLine1());
			mst.setAddressLine2(mst2.getAddressLine2());
			mst.setCreatedBy(mst2.getCreatedBy());
			mst.setCreatedDate(mst2.getCreatedDate());
			mst.setDeliveryPlace(mst2.getDeliveryPlace());
			mst.setDeliverySchedule(mst2.getDeliverySchedule());
			mst.setDiscountAmount(mst2.getDiscountAmount());
			Double original = mst2.getOriginalTotalAmount() + Double.parseDouble(request.getParameter("totalPrice"));
			mst.setDiscountedTotalAmount(original - mst2.getDiscountAmount());
			mst.setOriginalTotalAmount(original);
			mst.setId(Integer.parseInt(request.getParameter("mst_id")));
			mst.setVendorName(mst2.getVendorName());
			mst.setVendorQuotationDate(mst2.getVendorQuotationDate());
			mst.setVendorQuotationNo(mst2.getVendorQuotationNo());
			mst.setPaymentMode(mst2.getPaymentMode());
			mst.setModifiedBy(mst2.getModifiedBy());
			mst.setModifiedDate(mst2.getModifiedDate());
			mst.setWorkOrderDate(mst2.getWorkOrderDate());
			mst.setWorkOrderNo(mst2.getWorkOrderNo());
			mst.setWorkOrderSubject(mst2.getWorkOrderSubject());
			commonService.saveOrUpdateModelObjectToDB(mst);
		}
		if (saveflag == 0) {
			commonService.saveOrUpdateModelObjectToDB(dtl);
			WorkOrderMst mst2 = (WorkOrderMst) commonService.getAnObjectByAnyUniqueColumn("WorkOrderMst", "id",
					request.getParameter("mst_id"));
			mst.setAddressLine1(mst2.getAddressLine1());
			mst.setAddressLine2(mst2.getAddressLine2());
			mst.setCreatedBy(mst2.getCreatedBy());
			mst.setCreatedDate(mst2.getCreatedDate());
			mst.setDeliveryPlace(mst2.getDeliveryPlace());
			mst.setDeliverySchedule(mst2.getDeliverySchedule());
			mst.setDiscountAmount(mst2.getDiscountAmount());
			Double original = (mst2.getOriginalTotalAmount()
					- Double.parseDouble(request.getParameter("totalPrice_old")))
					+ Double.parseDouble(request.getParameter("totalPrice"));
			mst.setDiscountedTotalAmount(original - mst2.getDiscountAmount());
			mst.setOriginalTotalAmount(original);
			mst.setId(Integer.parseInt(request.getParameter("mst_id")));
			mst.setVendorName(mst2.getVendorName());
			mst.setVendorQuotationDate(mst2.getVendorQuotationDate());
			mst.setVendorQuotationNo(mst2.getVendorQuotationNo());
			mst.setPaymentMode(mst2.getPaymentMode());
			mst.setModifiedBy(mst2.getModifiedBy());
			mst.setModifiedDate(mst2.getModifiedDate());
			mst.setWorkOrderDate(mst2.getWorkOrderDate());
			mst.setWorkOrderNo(mst2.getWorkOrderNo());
			mst.setWorkOrderSubject(mst2.getWorkOrderSubject());
			commonService.saveOrUpdateModelObjectToDB(mst);
		}

		return new ModelAndView("redirect:/getDtlInfo/" + request.getParameter("mst_id"));
	}

	@ResponseBody
	@RequestMapping(value = "/saveWorkOrder", method = RequestMethod.POST)
	public ModelAndView saveWorkOrder(HttpServletRequest request, HttpServletResponse response, Principal principal,
			WorkOrderMst mst, WorkOrderDtl dtl, RedirectAttributes redirectAttrs) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		String vendorName, addressLine1, addressLine2, workOrderNo, workOrderDate, vendorQuotationNo,
				vendorQuotationDate, workOrderSubject = null;
		String paymentMode, deliveryPlace, deliveryTime, createdBy, createdDate, modifiedBy = null;
		String modifiedDate, serialNo, deliverySchedule, specialCondition, div_no = null;
		String[] quantity, reagent_id = null;
		Integer id = 0;
		// permissoes = request.getParameterValues("serialNo[]");
		vendorName = request.getParameter("vendorName").toString();
		addressLine1 = request.getParameter("addressLine1").toString();
		addressLine2 = request.getParameter("addressLine2").toString();
		workOrderNo = request.getParameter("workOrderNo").toString();
		workOrderDate = request.getParameter("workOrderDate").toString();
		vendorQuotationNo = request.getParameter("vendorQuotationNo").toString();
		vendorQuotationDate = request.getParameter("vendorQuotationDate").toString();
		workOrderSubject = request.getParameter("workOrderSubject").toString();
		paymentMode = request.getParameter("paymentMode").toString();
		deliveryPlace = request.getParameter("deliveryPlace").toString();
		deliverySchedule = request.getParameter("deliverySchedule").toString();
		specialCondition = request.getParameter("specialCondition").toString();
		createdDate = this.getCurrentLocalDateTimeStamp().toString();
		createdBy = principal.getName().toString();
		div_no = request.getParameter("div_no").toString();
		String[] Total_div = div_no.split(",");

		mst.setVendorName(vendorName);
		mst.setAddressLine1(addressLine1);
		mst.setAddressLine2(addressLine2);
		mst.setCreatedBy(createdBy);
		mst.setCreatedDate(createdDate);
		mst.setDeliveryPlace(deliveryPlace);
		mst.setDeliverySchedule(deliverySchedule);
		mst.setPaymentMode(paymentMode);
		// mst.setSerialNo(serialNo);
		mst.setSpecialCondition(specialCondition);
		mst.setVendorQuotationDate(vendorQuotationDate);
		mst.setVendorQuotationNo(vendorQuotationNo);
		mst.setWorkOrderDate(workOrderDate);
		mst.setWorkOrderNo(workOrderNo);
		mst.setWorkOrderSubject(workOrderSubject);
		mst.setFooterText(request.getParameter("footerText").toString().trim());
		Double discountAmount = Double.parseDouble(request.getParameter("discountAmount"));
		Double discountedTotalAmount = Double.parseDouble(request.getParameter("discountedTotalAmount"));
		mst.setDiscountAmount(discountAmount);
		mst.setDiscountedTotalAmount(discountedTotalAmount);
		mst.setOriginalTotalAmount(
				new BigDecimal(discountedTotalAmount + discountAmount).setScale(2, RoundingMode.HALF_UP).doubleValue());
		id = commonService.saveWithReturnId(mst);
		for (int i = 0; i < Total_div.length; i++) {
			serialNo = request.getParameter("serialNo_" + Total_div[i].toString());
			quantity = request.getParameterValues("quantity_" + Total_div[i].toString());
			reagent_id = request.getParameterValues("reagent_id_" + Total_div[i].toString());
			for (int j = 0; j < reagent_id.length; j++) {
				if (Integer.parseInt(quantity[j]) > 0) {
					dtl.setQuantity(Integer.parseInt(quantity[j]));
					dtl.setReagentId(Integer.parseInt(reagent_id[j]));
					dtl.setSerialNo(serialNo);
					dtl.setWorkOrderMstId(id);
					commonService.saveWithReturnId(dtl);
				}
			}
		}

		redirectAttrs.addFlashAttribute("success", "You have added a new work order.");
		return new ModelAndView("redirect:/getWorkOrderList");
	}

	public String getCurrentLocalDateTimeStamp() {
		return LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
	}
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/editWorkOrder/{id}", method = RequestMethod.GET)
	public ModelAndView saveRequisitionForm(Principal principal, @PathVariable String id) throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		Map<String, Object> model = new HashMap<String, Object>();

		WorkOrderMst mst = (WorkOrderMst) commonService.getAnObjectByAnyUniqueColumn("WorkOrderMst", "id", id);
		List<SiteSettings> settingList = (List<SiteSettings>) (Object) commonService.getAllObjectList("SiteSettings");
		
		model.put("settingList", settingList);
		model.put("mst", mst);
		return new ModelAndView("workOrderUpdateForm", model);
	}

	@RequestMapping(value = "/deleteWorkOrder/{id}", method = RequestMethod.GET)
	public ModelAndView deleteWorkOrder(Principal principal, @PathVariable String id, RedirectAttributes redirectAttrs)
			throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		commonService.deleteAnObjectById("WorkOrderMst", Integer.parseInt(id));
		commonService.deleteAnObjectListByAnyColumn("WorkOrderDtl", "work_order_mst_id", id);
		redirectAttrs.addFlashAttribute("success", "You  have Deleted a new work order.");
		return new ModelAndView("redirect:/getWorkOrderList");
	}

	@RequestMapping(value = "/deleteWorkOrderDtl/{id}/{mst_id}", method = RequestMethod.GET)
	public ModelAndView deleteWorkOrderDtl(Principal principal, @PathVariable String id, @PathVariable String mst_id,
			RedirectAttributes redirectAttrs, WorkOrderMst mst, WorkOrderDtl dtl) throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		WorkOrderMst mst2 = (WorkOrderMst) commonService.getAnObjectByAnyUniqueColumn("WorkOrderMst", "id", mst_id);
		mst.setAddressLine1(mst2.getAddressLine1());
		mst.setAddressLine2(mst2.getAddressLine2());
		mst.setCreatedBy(mst2.getCreatedBy());
		mst.setCreatedDate(mst2.getCreatedDate());
		mst.setDeliveryPlace(mst2.getDeliveryPlace());
		mst.setDeliverySchedule(mst2.getDeliverySchedule());
		mst.setDiscountAmount(mst2.getDiscountAmount());
		WorkOrderDtl dtl2 = (WorkOrderDtl) commonService.getAnObjectByAnyUniqueColumn("WorkOrderDtl", "id", id);

		Integer reagent_id = null;
		reagent_id = dtl2.getReagentId();

		Reagent reagent = (Reagent) commonService.getAnObjectByAnyUniqueColumn("Reagent", "id", reagent_id.toString());
		Double original = (mst2.getOriginalTotalAmount() - (dtl2.getQuantity() * reagent.getReagentUnitValue()));
		mst.setDiscountedTotalAmount(original - mst2.getDiscountAmount());
		mst.setOriginalTotalAmount(original);
		mst.setId(Integer.parseInt(mst_id));
		mst.setVendorName(mst2.getVendorName());
		mst.setVendorQuotationDate(mst2.getVendorQuotationDate());
		mst.setVendorQuotationNo(mst2.getVendorQuotationNo());
		mst.setPaymentMode(mst2.getPaymentMode());
		mst.setModifiedBy(mst2.getModifiedBy());
		mst.setModifiedDate(mst2.getModifiedDate());
		mst.setWorkOrderDate(mst2.getWorkOrderDate());
		mst.setWorkOrderNo(mst2.getWorkOrderNo());
		mst.setWorkOrderSubject(mst2.getWorkOrderSubject());
		commonService.saveOrUpdateModelObjectToDB(mst);
		commonService.deleteAnObjectListByAnyColumn("WorkOrderDtl", "id", id);
		redirectAttrs.addFlashAttribute("success", "You  have Deleted a  work order Details.");
		return new ModelAndView("redirect:/getDtlInfo/" + mst_id);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/getWorkOrderList", method = RequestMethod.GET)
	public ModelAndView pendingRequisitionList(TravelRequisition travelRequisition, BindingResult result,
			Principal principal) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		Map<String, Object> model = new HashMap<String, Object>();

		List<WorkOrderMst> workList = (List<WorkOrderMst>) (Object) commonService.getAllObjectList("WorkOrderMst");

		model.put("WorkOrderList", workList);
		return new ModelAndView("workOrderList", model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/editWorkOrderDtl/{id}/{mst_id}", method = RequestMethod.GET)
	public ModelAndView editWorkOrderDtl(Principal principal, @PathVariable String id, @PathVariable String mst_id)
			throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		Map<String, Object> model = new HashMap<String, Object>();

		List listin = commonService.getListByQuery(
				"SELECT wrkd.* ,r.reagentname,rp.propertyname,r.reagent_partno,r.reagent_origin,r.reagentunitvalue from work_order_dtl wrkd join reagent r on wrkd.reagent_id=r.id join reagentproperty rp on r.propertyid=rp.id WHERE wrkd.id="
						+ Integer.parseInt(id) + "");
		List<Reagent> reagents = (List<Reagent>) (Object) commonService.getAllObjectList("Reagent");
		List<ReagentProperty> reagentProperties = (List<ReagentProperty>) (Object) commonService
				.getAllObjectList("ReagentProperty");
		model.put("reagentProperties", reagentProperties);
		model.put("workOrderDetails", listin.get(0));
		model.put("reagents", reagents);

		return new ModelAndView("workOrderDTLUpdateForm", model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/geReagentPropertyList", method = RequestMethod.GET)
	public ModelAndView geReagentPropertyList(Principal principal) throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		Map<String, Object> model = new HashMap<String, Object>();
		List<ReagentProperty> reagentProperties = (List<ReagentProperty>) (Object) commonService
				.getAllObjectList("ReagentProperty");
		model.put("reagentProperties", reagentProperties);

		return new ModelAndView("reagentPropertyList", model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newReagentProperty", method = RequestMethod.GET)
	public ModelAndView newReagentProperty(Principal principal) throws Exception {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		return new ModelAndView("reagentPropertyForm");
	}

	@ResponseBody
	@RequestMapping(value = "/addUpdateReagentProperty", method = RequestMethod.POST)
	public ModelAndView addUpdateReagentProperty(ReagentProperty property, HttpServletRequest request,
			HttpServletResponse response, Principal principal, RedirectAttributes redirectAttributes) {

		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		String btn_save = null;
		btn_save = request.getParameter("btn-save");
		property.setPropertyName(request.getParameter("propertyName").toString());
		property.setModelNumber(request.getParameter("modelNumber").toString());
		String text = "You have added a new property";
		if (btn_save.trim().equals("update")) {
			property.setId(Integer.parseInt(request.getParameter("propert_id")));
			text = "You have updated a Propertry";
			ReagentProperty property2 = (ReagentProperty) commonService.getAnObjectByAnyUniqueColumn("ReagentProperty",
					"id", request.getParameter("propert_id"));
			property.setInstallDate(property2.getInstallDate().toString());
		}
		if (btn_save.trim().equals("save")) {
			property.setInstallDate(LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd")));
		}
		commonService.saveOrUpdateModelObjectToDB(property);
		redirectAttributes.addFlashAttribute("success", text.toString());
		return new ModelAndView("redirect:/geReagentPropertyList");

	}

	@RequestMapping(value = "/updateReagentProperty/{id}", method = RequestMethod.GET)
	public ModelAndView updateReagentProperty(@PathVariable String id, Principal principal) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		Map<String, Object> model = new HashMap<String, Object>();
		ReagentProperty property = (ReagentProperty) commonService.getAnObjectByAnyUniqueColumn("ReagentProperty", "id",
				id);
		model.put("property", property);
		model.put("edit", "edit");
		return new ModelAndView("reagentPropertyForm", model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/updateReagent/{id}", method = RequestMethod.GET)
	public ModelAndView updateReagent(@PathVariable String id, Principal principal) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		Map<String, Object> model = new HashMap<String, Object>();
		Reagent reagent = (Reagent) commonService.getAnObjectByAnyUniqueColumn("Reagent", "id", id);
		List<ReagentProperty> reagentProperties = (List<ReagentProperty>) (Object) commonService
				.getAllObjectList("ReagentProperty");
		model.put("reagentproperty_lis", reagentProperties);
		model.put("reagent", reagent);
		model.put("edit", "edit");
		return new ModelAndView("reagentForm", model);
	}

	@RequestMapping(value = "/deleteReagentProperty/{id}", method = RequestMethod.GET)
	public ModelAndView deleteReagentProperty(@PathVariable String id, RedirectAttributes redirectAttributes,
			Principal principal) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		commonService.deleteAnObjectById("ReagentProperty", Integer.parseInt(id));
		redirectAttributes.addFlashAttribute("success", "You have deleted a reagent property");
		return new ModelAndView("redirect:/geReagentPropertyList");
	}

	@RequestMapping(value = "/deleteReagent/{id}", method = RequestMethod.GET)
	public ModelAndView deleteReagent(@PathVariable String id, RedirectAttributes redirectAttributes,
			Principal principal) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}

		commonService.deleteAnObjectById("Reagent", Integer.parseInt(id));
		redirectAttributes.addFlashAttribute("success", "You have deleted a reagent .");
		return new ModelAndView("redirect:/geReagentList");
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/newReagent", method = RequestMethod.GET)
	public ModelAndView newReagent(Principal principal) {
		if (principal == null) {
			return new ModelAndView("redirect:/login");
		}
		Map<String, Object> model = new HashMap<String, Object>();
		List<ReagentProperty> reagentProperties = (List<ReagentProperty>) (Object) commonService
				.getAllObjectList("ReagentProperty");
		model.put("reagentproperty_lis", reagentProperties);
		return new ModelAndView("reagentForm", model);
	}

	@SuppressWarnings("unchecked")
	@RequestMapping(value = "/geReagentList", method = RequestMethod.GET)
	public ModelAndView geReagentList() {
		Map<String, Object> model = new HashMap<String, Object>();
		List<Reagent> reagents = (List<Reagent>) (Object) commonService.getAllObjectList(" Reagent");

		model.put("reagentList", reagents);
		return new ModelAndView("reagentList", model);
	}

	@ResponseBody
	@RequestMapping(value = "/addUpdateReagent", method = RequestMethod.POST)
	public ModelAndView addUpdateReagent(HttpServletRequest request, HttpServletResponse response, Principal principal,
			Reagent reagent, RedirectAttributes redirectAttributes) {
		reagent.setReagentName(request.getParameter("reagentName").toString());
		reagent.setPropertyId(Integer.parseInt(request.getParameter("propertyId")));
		DecimalFormat df = new DecimalFormat("####0.00");
		reagent.setReagentUnitValue(
				Double.parseDouble(df.format(Double.parseDouble(request.getParameter("reagentUnitValue")))));
		reagent.setOrigin(request.getParameter("origin").toString());
		reagent.setPartNo(request.getParameter("partNo").toString());
		String tex = null;
		if (request.getParameter("btn-save").toString().trim().equals("update")) {
			reagent.setId(Integer.parseInt(request.getParameter("reagent_id")));
			tex = "You have updated a reagent.";

		} else {
			tex = "You have added a new  reagent.";
		}
		commonService.saveOrUpdateModelObjectToDB(reagent);

		redirectAttributes.addFlashAttribute("success", tex);
		return new ModelAndView("redirect:/geReagentList");

	}

	@ResponseBody
	@RequestMapping(value = "/addSettings", method = RequestMethod.POST)
	public ModelAndView addSettings(HttpServletRequest request, HttpServletResponse response, Principal principal,
			SiteSettings sting, RedirectAttributes redirectAttributes) {
		sting.setType(Integer.parseInt(request.getParameter("type")));
		sting.setValue(request.getParameter("value"));
		commonService.saveWithReturnId(sting);
		redirectAttributes.addFlashAttribute("success", "You have modified settings");
		return new ModelAndView("redirect:/settingsList");

	}

	@SuppressWarnings("unchecked")
	@ResponseBody
	@RequestMapping(value = "/settingsList", method = RequestMethod.GET)
	public ModelAndView settingsList(Principal principal, SiteSettings sting, RedirectAttributes redirectAttributes,
			ModelMap model) {
		List<SiteSettings> settingList = (List<SiteSettings>) (Object) commonService.getAllObjectList("SiteSettings");
	String listdata[]= {"Payment Mode","Delivery Schedule","Delivery place"};
		model.put("settingList", settingList);
		model.put("linstdata", listdata);
		return new ModelAndView("settingsList", model);

	}
	@ResponseBody
	@RequestMapping(value = "/deletesetting/{id}", method = RequestMethod.GET)
	public ModelAndView deletesetting(Principal principal, SiteSettings sting, RedirectAttributes redirectAttributes,
			ModelMap model,@PathVariable String id) {
		commonService.deleteAnObjectById("SiteSettings", Integer.parseInt(id));
		redirectAttributes.addFlashAttribute("success", "You have deleted settings");
		return new ModelAndView("redirect:/settingsList");
		

	}
	
}
