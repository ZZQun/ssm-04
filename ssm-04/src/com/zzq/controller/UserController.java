package com.zzq.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zzq.common.Constant;
import com.zzq.pojo.User;
import com.zzq.pojo.UserList;
import com.zzq.service.impl.UserListService;
import com.zzq.service.impl.UserService;

@Controller
@RequestMapping(value="/user")
public class UserController {

	@Resource(name="userService")
	private UserService userService;
	
	@Resource(name="userListService")
	private UserListService userListService;
	
	@RequestMapping(value = "/login")
	public String login() {
		return "login";
	}
	
	@RequestMapping("/username")
	@ResponseBody
	public Map<String,Object> userName(@RequestParam String username){
		Map<String,Object> map = new HashMap<String,Object>();
		User u = userService.selectByUsername(username);
		String name = null;
		if(u != null){
			name = "exist";
		}
		map.put("username",name);
		return map;
	}
	
	@RequestMapping("/modifyUser")
	public String modifyUser(@RequestParam String uid,HttpSession session){
		int id=Integer.parseInt(uid);
		UserList ul = userListService.findUserById(id);
		session.setAttribute("user", ul);
		return "/usermodify";
	}
	
	@RequestMapping(value="/adduser")
	public String addUser(HttpServletRequest request){
		String name = request.getParameter("name");
		String idCard = request.getParameter("idCard");
		String phone = request.getParameter("phone");
		String userName = request.getParameter("username");
		String password = request.getParameter("password");
		String type = request.getParameter("type");
		User u = new User();
		u.setUsername(userName);
		u.setPassword(password);
		u.setType(type);
		UserList ul = new UserList();
		ul.setName(name);
		ul.setIdCard(idCard);
		ul.setPhone(phone);
		if(userService.insertUser(u) == 1){
			u = userService.selectByUsername(userName);
			Integer userId = u.getId();
			ul.setUserId(userId);
			if(userListService.insertUserList(ul) == 1){
				return "redirect:/user/userlist";
			}
		}
		return "/useradd";
	}
	
	@RequestMapping(value="/modifyusersave")
	public String modifyUserSave(HttpServletRequest request){
		int uid=Integer.parseInt(request.getParameter("uid"));
		String idCard = request.getParameter("idCard");
		String phone = request.getParameter("phone");

		UserList ul = new UserList();
		ul.setId(uid);
		ul.setIdCard(idCard);
		ul.setPhone(phone);

		if(userListService.updateUserList(ul) == 1){
			return "redirect:/user/userlist";
		}
		return "redirect:/usermodify";
	}
	
	@RequestMapping(value = "/usermodify")
	public String usermodify() {
		return "redirect:/usermodify";
	}
	
	@RequestMapping(value="/dologin")
	public String doLogin(@RequestParam(value = "username")String username,@RequestParam(value = "password")String password,
			HttpServletRequest request,HttpSession session) {
		User user = userService.login(username, password);
		if(user == null){
			request.setAttribute("error","用户名或密码错误！");
			return "login";
		}else {
			session.setAttribute("user",user);
			return "redirect:/frame";
		}
	}
	
	@RequestMapping(value="/frame")
	public String frame(HttpSession session){
		if(session.getAttribute("user") != null){
			return "frame";
		}else {
			return "login";
		}
	}
	
	@RequestMapping("/userlist")
	public String userList(@RequestParam(value="name",required=false)String name,
			@RequestParam(value="id",required=false)Integer id,
						   @RequestParam(defaultValue="1",required=true,value="pn") Integer pageNo,
						   Model model){
		Integer pageSize= Constant.PAGESIZE;//每页显示记录数
		//分页查询
		PageHelper.startPage(pageNo, pageSize);
		//获取用户信息集合
		List<UserList> userList = userListService.findByCondition(name,id);
		PageInfo<UserList> pageInfo=new PageInfo<UserList>(userList);
		model.addAttribute("pageInfo",pageInfo);
		model.addAttribute("name",name);
		model.addAttribute("id",id);
		return "userlist";
	}
	
	@RequestMapping(value="/deleteUser")
	@ResponseBody
	public Map<String, String> userDelete(@RequestParam String uid){
		int id=Integer.parseInt(uid);
		Map<String,String> map=new HashMap<String, String>();
		UserList ul = userListService.findUserById(id);
		Integer userId = ul.getUserId();
		if(userListService.deleteUserList(id) > 0 && userService.deleteUser(userId) > 0){
			map.put("delResult", "true");
		}else {
			map.put("delResult", "false");
		}
		
		return map;
	}
	
	@RequestMapping("/pwdmodify")
	public String pwdmodify(){
		return "/pwdmodify";
	}
	
	@RequestMapping("/checkpwd")
	@ResponseBody
	public HashMap<String,String> checkpwd(HttpSession session,@RequestParam String oldpassword){
		Object obj=session.getAttribute("user");
		HashMap<String, String> map=new HashMap<String, String>();
		if(oldpassword!=""&&oldpassword!=null){
			if(obj!=null){
				User u=(User) obj;
				if(u.getPassword().equals(oldpassword)){
					map.put("result", "true");
				}else{
					map.put("result", "false");
				}
			}
			else{
				map.put("result", "sessionerror");
			}
		}else{
			map.put("result", "error");
			}
		return map;
	}
	
	@RequestMapping("/savepwdmodify")
	public String savePwdModify(HttpServletRequest request,HttpSession session){
		User u=(User) session.getAttribute("user");
		String newpassword=request.getParameter("newpassword");
		if(userService.pwdModify(u.getId(), newpassword)){
			session.setAttribute("successSavePwd", "密码修改成功，请重新登录");
			return "redirect:/login";
		}
		return "redirect:/pwdmodify";
	}
}
