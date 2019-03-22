<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>故障申报页面</span>
    </div>
    <div class="search">
        <form method="get" action="${path }/solve/solvelist">
            <span>租客姓名：</span>
            <input name="name" class="input-text"	type="text" value="${name }">
            <span>地址：</span>
            <input name="address" class="input-text"	type="text" value="${address }">
            <span>状态：</span>
            <select id="status" name="status">
                <option value=""></option>
                <option value="已处理">已处理</option>
                <option value="未处理">未处理</option>
            </select>
            <input	value="查 询" type="submit" id="searchbutton">
            <a href="${path}/useradd" >添加故障信息</a>
        </form>
    </div>
    <!--故障-->
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="15%">租客姓名</th>
            <th width="25%">地址</th>
            <th width="20%">提交时间</th>
            <th width="15%">状态</th>
            <th width="25%">操作</th>
        </tr>
        <c:forEach var="solve" items="${pageInfo.list}" varStatus="status">
            <tr>
                <td>
                    <span>${solve.name}</span>
                </td>
                <td>
                    <span>${solve.address}</span>
                </td>
                <td>
                    <span>
                        <fmt:formatDate value="${solve.date}" pattern="yyyy年MM月dd日" />
                    </span>
                </td>
                <td>
                    <span>${solve.status}</span>
                </td>
                <td>
                    <span><a class="modifyUser" href="javascript:;" solveid=${solve.id } ><img src="${path}/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
                    <span><a class="deleteUser" href="javascript:;" solveid=${solve.id } ><img src="${path}/statics/images/schu.png" alt="删除" title="删除"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <!-- 分页 -->
    <div class="ui circular labels" style="float: right;">
        <a class="ui label">当前第 ${pageInfo.pageNum }页,总${pageInfo.pages }
            页,总 ${pageInfo.total } 条记录</a>
        <a class="ui label" href="${Project_PATH}/solve/solvelist?pn=1">首页</a>
        <c:if test="${pageInfo.hasPreviousPage }">
            <a class="ui label" href="${Project_PATH}/solve/solvelist?pn=${pageInfo.pageNum-1 }">上一页</a>
        </c:if>

        <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
            <c:if test="${page_Num == pageInfo.pageNum }">
                <a class="ui label" href="${Project_PATH}/solve/solvelist?pn=${page_Num}">${page_Num}</a>
            </c:if>
            <c:if test="${page_Num != pageInfo.pageNum }">
                <a class="ui label" href="${Project_PATH}/solve/solvelist?pn=${page_Num}">${page_Num }</a>
            </c:if>
        </c:forEach>

        <c:if test="${pageInfo.hasNextPage }">
            <a class="ui label" href="${Project_PATH}/solve/solvelist?pn=${pageInfo.pageNum+1 }">下一页</a>
        </c:if>
        <a class="ui label" href="${Project_PATH}/solve/solvelist?pn=${pageInfo.pages}">末页</a>
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

    <script type="text/javascript">
        function page_nav(f,p){
            document.getElementById("pageNo").value=p;
            f.submit();
        }

    </script>



    <%@include file="/WEB-INF/jsp/common/foot.jsp" %>
    <script type="text/javascript" src="${path }/statics/js/userlist.js"></script>

