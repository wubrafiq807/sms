package com.nazdaq.tms;

import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.bouncycastle.LICENSE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nazdaq.tms.model.Employee;
import com.nazdaq.tms.model.TravelRequisition;
import com.nazdaq.tms.service.CommonService;

import net.sf.jasperreports.engine.JRDataSource;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperExportManager;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.data.JRBeanCollectionDataSource;
import net.sf.jasperreports.engine.util.JRLoader;

@Controller
public class ReportController {

	@Autowired
	private CommonService commonService;
	
	@RequestMapping(value = { "/downloadRequisition" }, method = RequestMethod.GET)
	@ResponseBody
	public void getDisbursementVariableReport(HttpServletResponse response, HttpServletRequest request)
			throws JRException, IOException, ParseException {
		JRDataSource jRdataSource = null;
		
		String id = request.getParameter("id");
		
		
		TravelRequisition travelRequisition = (TravelRequisition)
				commonService.getAnObjectByAnyUniqueColumn("TravelRequisition", "id", id);
		
		if(travelRequisition != null) {
			if(travelRequisition.getAppManDate() != null) {
				Employee emp = (Employee)
						commonService.getAnObjectByAnyUniqueColumn("Employee", "punchId", travelRequisition.getApproveByManager());
				travelRequisition.setApproveByManager(emp.getName());
			}
			else if(travelRequisition.getAppLineManDate()!= null) {
				Employee emp = (Employee)
						commonService.getAnObjectByAnyUniqueColumn("Employee", "punchId", travelRequisition.getApproveByLineManager());
				travelRequisition.setApproveByManager(emp.getName());
			}
			else {
				travelRequisition.setApproveByManager("");
			}
		}
		
		/*if(travelRequisition != null) {
			if(travelRequisition.getAppLineManDate()!= null) {
				Employee emp = (Employee)
						commonService.getAnObjectByAnyUniqueColumn("Employee", "punchId", travelRequisition.getApproveByLineManager());
				travelRequisition.setApproveByLineManager(emp.getName());
			}else {
				travelRequisition.setApproveByLineManager("");
			}
		}*/
		
		List<TravelRequisition> trList = new ArrayList<TravelRequisition>();
		trList.add(travelRequisition);
			
		InputStream jasperStream = null;
		jasperStream = this.getClass().getResourceAsStream("/travel_requisition.jasper");
		Map<String, Object> params = new HashMap<>();
		jRdataSource = new JRBeanCollectionDataSource(trList, false);
		params.put("datasource", jRdataSource);
			
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, jRdataSource);
		response.setContentType("application/x-pdf");
		response.setHeader("Content-disposition", "inline; filename=travel_requisition.pdf");
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	}
	
	@RequestMapping(value = { "/downloadReports/{id}"}, method = RequestMethod.GET)
	@ResponseBody
	public void getreportAccountManagement(HttpServletResponse response, HttpServletRequest request,@PathVariable String id)
			throws JRException, IOException, ParseException {
		JRDataSource jRdataSource = null;

	List listrepor=	commonService.getListBySqlQuery("SELECT wkms.vendor_name as vendorName,wkms.addressline1 as addressline1,wkms.addressLine2 as addressLine2,wkms.workorder_no as workOrderNo,wkms.workorder_date as workOrderDate,wkms.vendor_quotation_no as vendorQuotationNo, wkms.vendor_quotation_date as vendorQuotationDate,wkms.workorder_subject as workOrderSubject,wkms.payment_mode as paymentMode,wkms.delivery_place as deliveryPlace ,wkms.delivery_schedule as deliverySchedule,wkms.special_condition as specialCondition,wkd.serial_no as serialNo,wkd.quantity as quantity,reagent.reagentname as reagentName,reagent.reagentunitvalue as reagentUnitValue,reagent.reagent_partno as partNo,reagent.reagent_origin as origin,reagentproperty.propertyname as propertyName,reagentproperty.modelnumber as modelNumber,wkms.originalTotalAmount,wkms.discountedTotalAmount,wkms.discountAmount,wkms.footer_text as footerText from work_order_mst wkms  join work_order_dtl wkd on wkms.id=wkd.work_order_mst_id join reagent on wkd.reagent_id=reagent.id join reagentproperty on reagent.propertyid=reagentproperty.id WHERE wkms.id="+Integer.parseInt(id)+"");
		
//		List<TravelRequisition> trList = new ArrayList<TravelRequisition>();
//		trList.add(travelRequisition);
	List mylist=new ArrayList<>();
	List<Object> listFinal=new ArrayList<>();
	
	for (Object object : listrepor) {
		Object[] objects=(Object[])object;
		Map<String, Object>  map=new HashMap<>();
		map.put("vendorName", objects[0]);
		map.put("addressline1", objects[1]);
		map.put("addressLine2", objects[2]);
		map.put("workOrderNo", objects[3]);
		map.put("workOrderDate", objects[4].toString());
		map.put("vendorQuotationNo", objects[5]);
		map.put("vendorQuotationDate", objects[6].toString());
		map.put("workOrderSubject", objects[7]);
		map.put("paymentMode", objects[8]);
		map.put("deliveryPlace", objects[9]);
		map.put("deliverySchedule", objects[10]);
		map.put("specialCondition", objects[11]);
		map.put("serialNo", objects[12]);
		map.put("quantity", objects[13]);
		map.put("reagentName", objects[14]);
		map.put("reagentUnitValue", objects[15]);
		map.put("partNo", objects[16]);
		map.put("origin", objects[17]);
		map.put("propertyName", objects[18]);
		map.put("modelNumber", objects[19]);
		map.put("originalTotalAmount",objects[20]);
		map.put("discountedTotalAmount",objects[21]);
		map.put("discountAmount", objects[22]);
		map.put("footerText", objects[23]);
		//mylist.add(map);
		mylist.add(map);
	
		
	}		
		InputStream jasperStream = null;
		jasperStream = this.getClass().getResourceAsStream("/AccountWrkOrder.jasper");
		Map<String, Object> params = new HashMap<>();
		jRdataSource = new JRBeanCollectionDataSource(mylist, false);
		params.put("datasource", jRdataSource);
			
		JasperReport jasperReport = (JasperReport) JRLoader.loadObject(jasperStream);
		JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params, jRdataSource);
		response.setContentType("application/x-pdf");
		response.setHeader("Content-disposition", "inline; filename=AccountWrkOrder.pdf");
		final OutputStream outStream = response.getOutputStream();
		JasperExportManager.exportReportToPdfStream(jasperPrint, outStream);
	}
	
	
}
