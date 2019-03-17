<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<div class="right">
        <div class="location">
            <strong>你现在所在的位置是:</strong>
            <span>用户管理页面 >> 用户添加页面</span>
        </div>
        <div class="providerAdd">
            <form id="userForm" name="userForm" method="post" action="${path}/user/adduser">
				<input type="hidden" name="method" value="add">
                <!--div的class 为error是验证错误，ok是验证成功-->
                <div>
                    <label for="username">用户帐号：</label>
                    <input type="text" name="username" id="username" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="password">用户密码：</label>
                    <input type="password" name="password" id="password" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="ruserPassword">确认密码：</label>
                    <input type="password" name="ruserPassword" id="ruserPassword" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="name">用户名称：</label>
                    <input type="text" name="name" id="name" value=""> 
					<font color="red"></font>
                </div>
                 <div>
                    <label for="idCard">身份证：</label>
                    <input type="text" name="idCard" id="idCard" value=""> 
					<font color="red"></font>
                </div>
                <div>
                    <label for="phone">电话号码：</label>
                    <input type="text" name="phone" id="phone" value=""> 
					<font color="red"></font>
                </div>
                
                <div>
                    <label for="type">用户角色：</label>
                    <input type="text" name="type" id="type" value=""> 
					<font color="red"></font>
                </div>
                
                <div class="providerAddBtn">
                    <input type="button" name="add" id="add" value="保存" >
					<input type="button" id="back" name="back" value="返回" >
                </div>
            </form>
        </div>
</div>
</section>
<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${pageContext.request.contextPath }/statics/js/useradd.js"></script>
