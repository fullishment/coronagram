package com.gdj37.coronagram.web.user_page.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.gdj37.coronagram.web.user_page.service.IServiceUserPage;

@Controller
public class UserPage {
	@Autowired
	public IServiceUserPage iServiceUserPage;
	
	@RequestMapping(value="/coronagram/{nicknm}" ,method = RequestMethod.GET)
	public ModelAndView userpage(ModelAndView mav, @PathVariable("nicknm") String nicknm) throws Throwable{
		System.out.println(nicknm);
		
		mav.setViewName("user_page/user_page");
		return mav;
	}
	@RequestMapping(value ="/coronagram/storyAdd")
	public ModelAndView storyAdd(@RequestParam HashMap<String,String> params, ModelAndView mav)throws Throwable {
		HashMap<String,String> last = iServiceUserPage.getLastSAcctNum(params);

		mav.addObject("last", last);
		mav.setViewName("coronagram_story/coronagram_story");
		return mav;
	}
	@RequestMapping(value="/coronagram/storyAdds")
	@ResponseBody
	public String crngAdds(ModelAndView mav, @RequestParam HashMap<String,String> params)throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int storyAdd = iServiceUserPage.storyAdd(params);
		if(storyAdd ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
		
	}
	@RequestMapping(value="/coronagram/storyAcctAdd" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String postAcctAdd(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int storyAcctAdd = iServiceUserPage.storyAcctAdd(params);
		if(storyAcctAdd ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value ="/coronagram/reelsAdd")
	public ModelAndView reelsAdd(@RequestParam HashMap<String,String> params, ModelAndView mav)throws Throwable {
		HashMap<String,String> last = iServiceUserPage.getLastRAcctNum(params);

		mav.addObject("last", last);
		mav.setViewName("crng_reels_add/crng_reels_add");
		return mav;
	}
	@RequestMapping(value="/coronagram/reelsAdds")
	@ResponseBody
	public String reelsAdds(ModelAndView mav, @RequestParam HashMap<String,String> params)throws Throwable{
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int reelsAdds = iServiceUserPage.reelsAdds(params);
		if(reelsAdds ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
		
	}
	@RequestMapping(value="/coronagram/reelsAcctAdd" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reelsAcctAdd(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		String result="success";
		int reelsAcctAdd = iServiceUserPage.reelsAcctAdd(params);
		if(reelsAcctAdd ==0) {
			result="failed";
		}
		
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/storyList" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String storyList(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> story = iServiceUserPage.getStoryList(params);
		
		modelMap.put("story", story);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/storyMList" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String storyMList(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		HashMap<String,String> mStory = iServiceUserPage.getStoryMList(params);
		
		modelMap.put("mStory", mStory);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/userpages" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String userpages(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> list = iServiceUserPage.getMPostList(params);
		HashMap<String,String> intro = iServiceUserPage.getIntroM(params);
		
		modelMap.put("intro", intro);
		modelMap.put("list", list);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/reels" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String reels(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> reels = iServiceUserPage.getReelsList(params);
		HashMap<String,String> intro = iServiceUserPage.getIntroM(params);
		
		modelMap.put("intro", intro);
		modelMap.put("reels", reels);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/ReelsModal" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ReelsModal(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		
		HashMap<String,String> reelsModal = iServiceUserPage.reelsModal(params);
	
		String result ="success";
		try {
			int rViewCnt = iServiceUserPage.reelsViewCnt(params);
			
			if(rViewCnt==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}		
		
		int reelsHChk = iServiceUserPage.ReelsHeartChk(params);
		
		modelMap.put("reelsHChk", reelsHChk);
		modelMap.put("result", result);		
		modelMap.put("reelsModal", reelsModal);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/ReelsLK" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String ReelsLK(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		int ReelsLk = iServiceUserPage.getReelsLk(params);
		int reelsHChk = iServiceUserPage.ReelsHeartChk(params);
		
		modelMap.put("reelsHChk", reelsHChk);
		modelMap.put("ReelsLk", ReelsLk);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/addReelsHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addReelsHeart (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int ReelshAdd = iServiceUserPage.addReelsHeart(params);
			
			if(ReelshAdd==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/delReelsHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delReelsHeart (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int ReelshDel = iServiceUserPage.delReelsHeart(params);
			if(ReelshDel==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/videoList" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String videoList(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> video = iServiceUserPage.getVideoList(params);
		HashMap<String,String> intro = iServiceUserPage.getIntroM(params);
		
		modelMap.put("intro", intro);
		modelMap.put("video", video);
		
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/modalpages" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String modalpages(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
		
		HashMap<String,String> modalM = iServiceUserPage.getModalM(params);
		List<HashMap<String,String>> md = iServiceUserPage.getMDtlList(params);
			
		int hcnt = iServiceUserPage.getHeartCnt(params);
				
		modelMap.put("hcnt", hcnt);
		modelMap.put("md", md);
		modelMap.put("modalM", modalM);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/emoji" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String emoji(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> emoji = iServiceUserPage.getEmojiList(params);

		modelMap.put("emoji", emoji);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/likeCnt",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String likeCnt (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		int like = iServiceUserPage.getLkCnt(params);
		
		modelMap.put("like", like);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/addHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addHeart (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int hAdd = iServiceUserPage.addHeart(params);
			
			if(hAdd==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/delHeart",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delHeart (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int hDel = iServiceUserPage.delHeart(params);
			if(hDel==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/followArea",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String followArea (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		int fExist = iServiceUserPage.getfollowEx(params);
		int fExist2 = iServiceUserPage.getfollowEx2(params);
		
		modelMap.put("fExist", fExist);
		modelMap.put("fExist2", fExist2);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/addFollow",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addFollow (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int addFollow = iServiceUserPage.addFollow(params);
			if(addFollow==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}		
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	
	@RequestMapping(value="/coronagram/delFollow",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String delFollow (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int delFollow = iServiceUserPage.delFollow(params);
			if(delFollow==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}	
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/mCmt",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String modalCmt (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> mCmt = iServiceUserPage.getModalCmt(params);

		modelMap.put("mCmt", mCmt);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/followEvent",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String followEvent (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> eFollow = iServiceUserPage.getfollowEvent(params);

		modelMap.put("eFollow", eFollow);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/followerEvent",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String followerEvent (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();		
		Map<String,Object> modelMap = new HashMap<String,Object>();
		
		List<HashMap<String,String>> eFollower = iServiceUserPage.getfollowerEvent(params);

		modelMap.put("eFollower", eFollower);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/FollowMAdd",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String FollowMAdd (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int addMFollow = iServiceUserPage.FollowMAdd(params);
			
			if(addMFollow==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/searchUser" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String searchUser(ModelAndView mav,@RequestParam HashMap<String,String> params) throws Throwable {
		System.out.println(params);
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();

		List<HashMap<String,String>> search = iServiceUserPage.SearchUser(params);

		modelMap.put("search", search);
				
		return mapper.writeValueAsString(modelMap);	
	}
	@RequestMapping(value="/coronagram/FollowMDel",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String FollowMDel (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int delMFollow = iServiceUserPage.FollowMDel(params);
			
			if(delMFollow==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/addModalCmt",method =RequestMethod.POST,produces="text/json;charset=UTF-8")
	@ResponseBody
	public String addModalCmt (@RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap = new HashMap<String,Object>();
		String result ="success";
		try {
			int addMCmt = iServiceUserPage.addMCmt(params);
			
			if(addMCmt==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/delModal" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delModalCmt(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
						
		String result ="success";
		try {
			int delModalCmt = iServiceUserPage.delModalCmt(params);
			
			if(delModalCmt==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
	@RequestMapping(value="/coronagram/delCrng" ,method = RequestMethod.POST,produces = "text/json;charset=UTF-8")
	@ResponseBody
	public String delCrng(ModelAndView mav, @RequestParam HashMap<String,String> params) throws Throwable {
		ObjectMapper mapper = new ObjectMapper();
		Map<String,Object> modelMap= new HashMap<String,Object>();
						
		String result ="success";
		try {
			int delPost = iServiceUserPage.delPost(params);
			
			if(delPost==0) {
				result="failed";
			}
		}catch(Exception e) {
			e.printStackTrace();
			result ="error";
		}
		modelMap.put("result", result);
		
		return mapper.writeValueAsString(modelMap);
	}
}
