package com.gdj37.coronagram.web.calandar.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.util.ScriptUtils;
import com.gdj37.coronagram.web.calandar.service.ICalendarService;

@Controller
public class CalendarController {

	@Autowired
	public ICalendarService iCalendarService;

	@RequestMapping(value = "/calendar", method = RequestMethod.GET, produces = "text/json;charset=UTF-8")
//	@ResponseBody
	public ModelAndView calendar(HttpServletResponse response, HttpSession session, @RequestParam HashMap<String, String> params, ModelAndView mav)throws Throwable {
//		HashMap<String,String> data = iCalendarService.getPoint(params);
		
		
		if(session.getAttribute("sMNo") != null) {
			
			mav.setViewName("co_calendar/co_calendar");
		} else {
			ScriptUtils.alert(response, "로그인이 필요한 페이지 입니다.");
			mav.setViewName("login/login");
		}
		
		return mav;
	}
	
	
	@RequestMapping(value = "/attendances", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> attendances( @RequestParam HashMap<String, String> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String jsonString = null;
		
		try {
//			params.put( "userNO", "1" );
			
			List<HashMap<String, Object>> list = iCalendarService.getCalendarByDate(params);
			resultMap = new HashMap<String, Object>();
			resultMap.put("data", list);
			jsonString = mapper.writeValueAsString(list);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 결과 출력
		
		return resultMap;
		
	}
	
	@RequestMapping(value = "/getSysdate", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> getSysdate( @RequestParam HashMap<String, Object> params) throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		
		String sysdate = null;
//		int oldresult = Integer.parseInt("resultMap.size()");
		Map<String, Object> resultMap = null;
		String result= "success";
		try {
			
			resultMap = iCalendarService.insertSysdate(params);

			
		} catch (Exception e) {
			e.printStackTrace();
		}
		// 결과 출력
		
		return resultMap;
		
	}
	
	@RequestMapping(value = "/calendarDataCheck", method = RequestMethod.POST, produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String calendarDataCheck(@RequestParam HashMap<String, String> params) throws Throwable {

			ObjectMapper mapper = new ObjectMapper();
			Map<String, Object> modelMap = new HashMap<String, Object>();
			int attCnt = iCalendarService.getCalendarDateCheck(params);
		
			modelMap.put("attCnt", attCnt);
			return mapper.writeValueAsString(modelMap);
			

	}
/*
 * @RequestMapping(value = "/attendances", method = RequestMethod.GET)
 * 
 * @ResponseBody public String attendances(@RequestParam HashMap<String, String>
 * params) throws Throwable { ObjectMapper mapper = new ObjectMapper();
 * Map<String, Object> modelMap = new HashMap<String, Object>();
 * 
 * List<HashMap<String,String>> calList =
 * iCalendarService.getCalendarList(params);
 * 
 * modelMap.put("calList", calList);
 * 
 * return mapper.writeValueAsString(modelMap); }
 * 
 * @RequestMapping(value = "/addAttendances")
 * 
 * @ResponseBody public String addAttendances(@RequestParam HashMap<String,
 * String> params)throws Throwable { ObjectMapper mapper = new ObjectMapper();
 * Map<String, Object> modelMap = new HashMap<String, Object>(); // Point 객체
 * 생성해서 필드에 값 넣기 String result = "success"; try { int cnt =
 * iCalendarService.insertCalendar(params);
 * 
 * if(cnt == 0) { result = "failed"; } } catch (Exception e) {
 * e.printStackTrace();
 * 
 * result= "error"; } modelMap.put("result", result);
 * 
 * pointService.insertCalendar(m_id, point); // Date에 저장 & point 적립 return new
 * 
 * 
 * return new
 * SimpleDateFormat("yyyy-MM-dd").format(Timestamp.valueOf(LocalDate.now().
 * atStartOfDay()));
 * 
 * return mapper.writeValueAsString(modelMap); }
 */ 
  }
 