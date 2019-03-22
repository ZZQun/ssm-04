<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
        <div class="right">
            <div class="location">
                <strong>你现在所在的位置是:</strong>
                <span>用户管理页面</span>
            </div>
            <div class="search">
           		<form method="get" action="${path }/user/userlist">
					 <span>用户名：</span>
					 <input name="name" class="input-text"	type="text" value="${name }">
					 
					 <!-- <span>用户角色：</span>
					 <select name="queryUserRole">
						<c:if test="${roleList != null }">
						   <option value="0">--请选择--</option>
						   <c:forEach var="role" items="${roleList}">
						   		<option <c:if test="${role.id == queryUserRole }">selected="selected"</c:if>
						   		value="${role.id}">${role.roleName}</option>
						   </c:forEach>
						</c:if>
	        		</select> -->
					 
					 <input type="hidden" id="pageNo" name="pageNo" value="1"/>
					 <input	value="查 询" type="submit" id="searchbutton">
					 <a href="${path}/useradd" >添加用户</a>
				</form>
            </div>
            <!--用户-->
            <table class="providerTable" cellpadding="0" cellspacing="0">
                <tr class="firstTr">
                    <th width="10%">用户编码</th>
                    <th width="15%">用户名称</th>
                    <th width="25%">身份证号码</th>
                    <th width="15%">电话</th>
                    <th width="10%">用户角色</th>
                    <th width="25%">操作</th>
                </tr>
                   <c:forEach var="user" items="${pageInfo.list}" varStatus="status">
					<tr>
						<td>
						<span>${user.id}</span>
						</td>
						<td>
						<span>${user.name}</span>
						</td>

						<td>
						<span>${user.idCard}</span>
						</td>
						<td>
						<span>${user.phone}</span>
						</td>
						<td>
							<span>${user.type}</span>
						</td>
						<td>
						<span><a class="modifyUser" href="javascript:;" userid=${user.id } username=${user.name }><img src="${path}/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
						<span><a class="deleteUser" href="javascript:;" userid=${user.id } username=${user.name }><img src="${path}/statics/images/schu.png" alt="删除" title="删除"/></a></span>
						</td>
					</tr>
				</c:forEach>
			</table>
			<!-- 分页 -->
			<div class="ui circular labels" style="float: right;">
				<a class="ui label">当前第 ${pageInfo.pageNum }页,总${pageInfo.pages }
					页,总 ${pageInfo.total } 条记录</a>
				<a class="ui label" href="${Project_PATH}/user/userlist?pn=1">首页</a>
				<c:if test="${pageInfo.hasPreviousPage }">
					<a class="ui label" href="${Project_PATH}/user/userlist?pn=${pageInfo.pageNum-1 }">上一页</a>
				</c:if>

				<c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
					<c:if test="${page_Num == pageInfo.pageNum }">
						<a class="ui label" href="${Project_PATH}/user/userlist?pn=${page_Num}">${page_Num}</a>
					</c:if>
					<c:if test="${page_Num != pageInfo.pageNum }">
						<a class="ui label" href="${Project_PATH}/user/userlist?pn=${page_Num}">${page_Num }</a>
					</c:if>
				</c:forEach>

				<c:if test="${pageInfo.hasNextPage }">
					<a class="ui label" href="${Project_PATH}/user/userlist?pn=${pageInfo.pageNum+1 }">下一页</a>
				</c:if>
				<a class="ui label" href="${Project_PATH}/user/userlist?pn=${pageInfo.pages}">末页</a>
			</div>


<!--点击删除按钮后弹出的页面-->
<div class="zhezhao"></div>
<div class="remove" id="removeUse">
    <div class="removerChid">
        <h2>提示</h2>
        <div class="removeMain">
            <p>你确定要删除该用户吗？</p>
            <a href="#" id="yes">确定</a>
            <a href="#" id="no">取消</a>
        </div>
    </div>
</div>




<%@include file="/WEB-INF/jsp/common/foot.jsp" %>
<script type="text/javascript" src="${path }/statics/js/userlist.js"></script>

