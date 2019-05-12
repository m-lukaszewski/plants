<%@ tag language="java" pageEncoding="ISO-8859-1"%>
<%@ tag import="org.springframework.util.StringUtils"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ attribute name="pagedListHolder" required="true"
              type="org.springframework.beans.support.PagedListHolder"%>
<%@ attribute name="pagedLink" required="true" type="java.lang.String"%>
<%--<link rel="stylesheet"--%>
<%--      href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css">--%>
<%--<script--%>
<%--        src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>--%>
<%--<script--%>
<%--        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>--%>

<c:if test="${pagedListHolder.pageCount > 1}">
    <div class="pagination">
        <c:if test="${!pagedListHolder.firstPage}">
            <a
                    href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() - 1))%>">&laquo;</a>
        </c:if>
        <c:if test="${pagedListHolder.firstLinkedPage > 0}">
            <a href="<%=StringUtils.replace(pagedLink, "~", "0")%>">1</a>
        </c:if>
        <c:if test="${pagedListHolder.firstLinkedPage > 1}">
        <span class="pagingDots">...</span>

            </c:if>
            <c:forEach begin="${pagedListHolder.firstLinkedPage}"
                       end="${pagedListHolder.lastLinkedPage}" var="i">
            <c:choose>
            <c:when test="${pagedListHolder.page == i}">
        <a href="#">${i+1}</a>
        </c:when>
        <c:otherwise>
            <a
                    href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(jspContext.getAttribute("i")))%>">${i+1}</a>
        </c:otherwise>
        </c:choose>
        </c:forEach>
        <c:if
                test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 2}">
         <span class="pagingDots">...</span>
        </c:if>
        <c:if
                test="${pagedListHolder.lastLinkedPage < pagedListHolder.pageCount - 1}">
            <a
                    href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPageCount() - 1))%>">${pagedListHolder.pageCount}</a></li>
        </c:if>
        <c:if test="${!pagedListHolder.lastPage}"><a
                    href="<%=StringUtils.replace(pagedLink, "~", String.valueOf(pagedListHolder.getPage() + 1))%>">&raquo;</a>
        </c:if>
    </div>
</c:if>