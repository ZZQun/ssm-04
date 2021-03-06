<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>	
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%
    pageContext.setAttribute("Project_PATH",request.getContextPath());
%>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>房屋租赁管理系统</title>
    <link type="text/css" rel="stylesheet" href="${path}/statics/css/style.css" />
    <link type="text/css" rel="stylesheet" href="${path}/statics/css/public.css" />
</head>
<body>
<!--头部-->
    <header class="publicHeader">
        <h1>房屋租赁管理系统</h1>
        <div class="publicHeaderR">
            <p><span>你好</span><span style="color: #fff21b"></span> , 欢迎你！</p>
            <a href="${path}/sys/logout">退出</a>
        </div>
    </header>
<!--时间-->
    <section class="publicTime">
        <span id="time">2015年1月1日 11:11  星期一</span>
        <a href="#">温馨提示：为了能正常浏览，请使用高版本浏览器！（IE10+）</a>
    </section>
 <!--主体内容-->
 <section class="publicMian ">
     <div class="left">
         <h2 class="leftH2"><span class="span1"></span>功能列表 <span></span></h2>
         <nav>
             <ul class="list">
                <li><a href="${path}/paid/paidlist">房租管理</a></li>
              <li><a href="${path }/house/houselist">房屋出租信息</a></li>
                 <li><a href="${path }/schedule/schedulelist">新闻公告</a></li>
              <li><a href="${path }/user/userlist">用户管理</a></li>
                 <li><a href="${path }/solve/solvelist">故障申报</a></li>
              <li><a href="${path }/user/pwdmodify">密码修改</a></li>
              <li><a href="${path }/sys/logout">退出系统</a></li>
             </ul>
         </nav>
     </div>
     <input type="hidden" id="path" name="path" value="${pageContext.request.contextPath }"/>
     <input type="hidden" id="referer" name="referer" value="<%=request.getHeader("Referer")%>"/>