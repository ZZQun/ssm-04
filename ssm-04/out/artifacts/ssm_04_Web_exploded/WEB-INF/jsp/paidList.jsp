<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/jsp/common/head.jsp"%>
<div class="right">
    <div class="location">
        <strong>你现在所在的位置是:</strong>
        <span>房租管理页面</span>
    </div>
    <div class="search">
        <form method="get" action="${path }/paid/paidlist">
            <span>租客姓名：</span>
            <input name="name" class="input-text"	type="text" value="${name }">
            <span>地址：</span>
            <input name="address" class="input-text"	type="text" value="${address }">
            <span>状态：</span>
            <select id="status" name="status">
                <option value=""></option>
                <option value="已缴">已缴</option>
                <option value="未缴">未缴</option>
            </select>
            <input type="hidden" id="pageNo" name="pageNo" value="1"/>
            <input	value="查 询" type="submit" id="searchbutton">
            <a href="${path}/useradd" >添加租金信息</a>
        </form>
    </div>
    <!--房租-->
    <table class="providerTable" cellpadding="0" cellspacing="0">
        <tr class="firstTr">
            <th width="10%">租客姓名</th>
            <th width="20%">地址</th>
            <th width="10%">价格</th>
            <th width="12.5%">缴费日期</th>
            <th width="12.5%">实际缴费日期</th>
            <th width="10%">状态</th>
            <th width="25%">操作</th>
        </tr>
        <c:forEach var="paid" items="${paidList}" varStatus="status">
            <tr>
                <td>
                    <span>${paid.name}</span>
                </td>
                <td>
                    <span>${paid.address}</span>
                </td>

                <td>
                    <span>${paid.price}</span>
                </td>
                <td>
                    <span>
                        <fmt:formatDate value="${paid.date}" pattern="yyyy年MM月dd日" />
                    </span>
                </td>
                <td>
                    <fmt:formatDate value="${paid.payDate}" pattern="yyyy年MM月dd日" />
                </td>
                <td>
                    <span>${paid.status}</span>
                </td>
                <td>
                    <span><a class="modifyUser" href="javascript:;" paidid=${paid.id } ><img src="${path}/statics/images/xiugai.png" alt="修改" title="修改"/></a></span>
                    <span><a class="deleteUser" href="javascript:;" paidid=${paid.id } ><img src="${path}/statics/images/schu.png" alt="删除" title="删除"/></a></span>
                </td>
            </tr>
        </c:forEach>
    </table>
    <input type="hidden" id="totalPageCount" value="${total}"/>
    <div class="page-bar">
        <ul class="page-num-ul clearfix">
            <li>共${total}条记录&nbsp;&nbsp; ${pageNo}/${totalPage }页</li>
            <c:if test="${pageNo > 1}">
                <a href="javascript:page_nav(document.forms[0],1);">首页</a>
                <a href="javascript:page_nav(document.forms[0],${pageNo-1} });">上一页</a>
            </c:if>
            <c:if test="${pageNo < totalPage }">
                <a href="javascript:page_nav(document.forms[0],${pageNo+1} });">下一页</a>
                <a href="javascript:page_nav(document.forms[0],${totalPage} });">最后一页</a>
            </c:if>
            &nbsp;&nbsp;
        </ul>
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

