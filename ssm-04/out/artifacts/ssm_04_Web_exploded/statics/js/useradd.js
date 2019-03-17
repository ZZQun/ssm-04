var name = null;
var idCard = null;
var phone = null;
var username = null;
var password = null;
var ruserPassword = null;
var type = null;
var addBtn = null;
var backBtn = null;


$(function(){
	name = $("#name");
	idCard = $("#idCard");
	phone = $("#phone");
	username = $("#username");
	password = $("#password");
	ruserPassword = $("#ruserPassword");
	type = $("#type");
	addBtn = $("#add");
	backBtn = $("#back");

	
	
	
	/*
	 * 验证
	 * 失焦\获焦
	 * jquery的方法传递
	 */
	username.bind("blur",function(){
		//ajax后台验证--userCode是否已存在
		//user.do?method=ucexist&userCode=**
		var code = username.val();
		if(code == '' || code == null){
			validateTip(username.next(),{"color":"red"},imgNo+ " 用户账号不能为空",false);
			return;
		}
		$.ajax({
			type:"GET",//请求类型
			url:path+"/user/username",//请求的url
			data:{username:code},//请求参数
			dataType:"json",//ajax接口（请求url）返回的数据类型
			success:function(data){//data：返回数据（json对象）
				if(data.username == "exist"){//账号已存在，错误提示
					validateTip(username.next(),{"color":"red"},imgNo+ " 该用户账号已存在",false);
				}else{//账号可用，正确提示
					validateTip(username.next(),{"color":"green"},imgYes+" 该账号可以使用",true);
				}
			},
			error:function(data){//当访问时候，404，500 等非200的错误状态码
				validateTip(username.next(),{"color":"red"},imgNo+" 您访问的页面不存在",false);
			}
		});
		
		
	}).bind("focus",function(){
		//显示友情提示
		validateTip(username.next(),{"color":"#666666"},"* 用户帐号是您登录系统的账号",false);
	}).focus();
	
	
	password.bind("focus",function(){
		validateTip(password.next(),{"color":"#666666"},"* 密码长度必须是大于6小于20",false);
	}).bind("blur",function(){
		if(password.val() != null && password.val().length > 6
				&& password.val().length < 20 ){
			validateTip(password.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(password.next(),{"color":"red"},imgNo + " 密码输入不符合规范，请重新输入",false);
		}
	});
	
	ruserPassword.bind("focus",function(){
		validateTip(ruserPassword.next(),{"color":"#666666"},"* 请输入与上面一致的密码",false);
	}).bind("blur",function(){
		if(ruserPassword.val() != null && ruserPassword.val().length > 6
				&& ruserPassword.val().length < 20 && password.val() == ruserPassword.val()){
			validateTip(ruserPassword.next(),{"color":"green"},imgYes,true);
		}else{
			validateTip(ruserPassword.next(),{"color":"red"},imgNo + " 两次密码输入不一致，请重新输入",false);
		}
	});
	
	
	addBtn.bind("click",function(){
		if(username.attr("validateStatus") != "true"){
			username.blur();
		}else if(password.attr("validateStatus") != "true"){
			password.blur();
		}else if(ruserPassword.attr("validateStatus") != "true"){
			ruserPassword.blur();
		}else{
			if(confirm("是否确认提交数据")){
				$("#userForm").submit();
			}
		}
	});
	
	backBtn.on("click",function(){
		if(referer != undefined 
			&& null != referer 
			&& "" != referer
			&& "null" != referer
			&& referer.length > 4){
		 window.location.href = referer;
		}else{
			history.back(-1);
		}
	});
});