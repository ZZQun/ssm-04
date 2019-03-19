<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>

<%
    pageContext.setAttribute("Project_PATH",request.getContextPath());
%>

<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>新闻公告页面</span>
    </div>
    <div class="search">
        <form method="get" action="${path }/schedule/schedulelist">
            <a href="${path}/useradd" >添加新闻公告</a>
        </form>
    </div>
    <!--新闻公告-->
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="25%">时间</th>
            <th width="30%">内容</th>
            <th width="45%">操作</th>
        </tr>
        <c:forEach var="schedule" items="${pageInfo.list}" varStatus="status">
            <tr>
                <td>
                    <span>
                        <fmt:formatDate value="${schedule.date}" pattern="yyyy年MM月dd日" />
                    </span>
                </td>

                <td>
                    <span>${schedule.content}</span>
                </td>
                <td>
                    <span><a class="viewUser" href="javascript:;" id=${schedule.id } ><img src="${path }/statics/images/read.png" alt="详情" title="详情"/></a></span>
                    <span><a class="modifyUser" href="javascript:;" id=${schedule.id } ><img src="${path}/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
                    <span><a class="deleteUser" href="javascript:;" id=${schedule.id } ><img src="${path}/statics/images/schu.png" alt="删除" title="删除"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>

    <!-- 分页 -->
    <div class="ui circular labels" style="float: right;">
        <a class="ui label">当前第 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录</a>
        <a class="ui label" href="${Project_PATH}/schedule/schedulelist?pn=1">首页</a>
        <c:if test="${pageInfo.hasPreviousPage }">
            <a class="ui label" href="${Project_PATH}/schedule/schedulelist?pn=${pageInfo.pageNum-1 }">上一页</a>
        </c:if>

        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
            <c:if test="${page_Num == pageInfo.pageNum }">
                <a class="ui label" href="${Project_PATH}/schedule/schedulelist?pn=${page_Num}">${page_Num}</a>
            </c:if>
            <c:if test="${page_Num != pageInfo.pageNum }">
                <a class="ui label" href="${Project_PATH}/schedule/schedulelist?pn=${page_Num}">${page_Num }</a>
            </c:if>
        </c:forEach>

        <c:if test="${pageInfo.hasNextPage }">
            <a class="ui label" href="${Project_PATH}/schedule/schedulelist?pn=${pageInfo.pageNum+1 }">下一页</a>
        </c:if>
        <a class="ui label" href="${Project_PATH}/schedule/schedulelist?pn=${pageInfo.pages}">末页</a>
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

