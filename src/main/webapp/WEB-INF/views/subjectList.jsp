<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 과목 전체목록 조회 페이지</title>
</head>

<body>
<!-- page-wrapper Start-->
    <div class="page-wrapper" id="pageWrapper">
      <!-- Page Body Start-->
      <div class="page-body-wrapper horizontal-menu">
      <%@ include file="./header.jsp"  %>
   
    <div class="page-body">
    
    <form action="#" method="post" id="frm" onsubmit="return chkBox()">
		
	
		
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>과목 전체 조회</h3>
                    <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="index.html"><i class="icofont icofont-ui-home"></i></a></li>
                    <li class="breadcrumb-item">관리자</li>
                    <li class="breadcrumb-item">과목 승인</li>
                    <li class="breadcrumb-item active">과목 전체 목록 조회</li>
                  </ol>
                </div>
	<div id="select">
			<span>
				<select class="btn btn-primary" id="listCount" name="listCount"
				onchange="listCnt()">
					<option>선택</option>
					<option value="5">5</option>
					<option value="10">10</option>
					<option value="15">15</option>
				</select>
			</span>
		</div>
              </div>
            </div>
            
            <div class="row">
              <div class="col-sm-12">
              
                <div class="card">
  				<div class="card-block row">
                  <div class="table-responsive table-border-radius">
                    <table class="table table-hover table-xs table-border-vertical">
                      <thead class="bg-primary">
                        <tr>
		                     <c:if test="${mem.auth eq 'ROLE_ADMIN'}">
		                     	<td><input type="checkbox" name="chkAll" onclick="checkAlls(this.checked)"></td>
		                     </c:if>
                          <th scope="col"><h6 class="f-w-700">과목번호</h6></th>
                          <th scope="col"><h6 class="f-w-700">과목명</h6></th>
                          <th scope="col"><h6 class="f-w-700">카테고리</h6></th>
                          <th scope="col"><h6 class="f-w-700">등록자</h6></th>
                          <th scope="col"><h6 class="f-w-700">담당강사</h6></th>
                          <c:if test="${mem.auth eq 'ROLE_ADMIN'}">
                          	<th scope="col"><h6 class="f-w-700">승인상태</h6></th>
                          	<th scope="col"><h6 class="f-w-700">관리</h6></th>
                          	</c:if>
                        </tr>
                      </thead>
    				<tbody>
    					<jsp:useBean id="subjectList" class="com.min.edu.bean.SubjectListBeanAdmin" scope="page"/>
    					<jsp:setProperty property="lists" name="subjectList" value="${lists}"/>
    					<jsp:setProperty property="mem" name="subjectList" value="${mem}"/>
    					<jsp:getProperty property="listForm" name="subjectList"/>
    				</tbody>
                    </table>
                    
                    <input type="text" name="index" id="index" value="${row.index}">
					<input type="text" name="pageStartNum" id="pageStartNum" value="${row.pageStartNum}">
					<input type="text" name="pageListNum" id="pageListNum" value="${row.pageListNum}">
		
                    </div>
                  </div>
                </div>
                
            <!-- pagination with active and disabled state-->
             <div class="col-xl-12">
                      <ul class="pagination justify-content-center pagination-primary">
                        <li class="page-item "><a onclick="pageFirst()" class="page-link"  href="#" aria-label="Previous"><span>«</span><span class="sr-only">Previous</span></a></li>
                         <li class="page-item"><a onclick="pagePrev(${row.pageStartNum},${row.pageList})" class="page-link"  href="#" aria-label="Previous"><span aria-hidden="true">이전</span><span class="sr-only">Previous</span></a></li>
                        <c:forEach var="i" begin="${row.pageStartNum}" end="${row.count}" step="1">
                         	<li class="page-item" ${(i-1)==row.index?"class='active'":"" }><a onclick="pageIndex('${i}')" class="page-link" href="#"><span>${i}</span></a></li>
					  	</c:forEach>
                         <li class="page-item"><a onclick="pageNext(${row.pageStartNum},${row.total},${row.pageListNum},${row.pageList})" class="page-link"  href="#"  aria-label="Next"><span>다음</span><span class="sr-only">Next</span></a></li>
                        <li class="page-item"><a onclick="pageLast(${row.pageStartNum},${row.total},${row.pageListNum},${row.pageList})" class="page-link"  href="#" aria-label="Next"><span aria-hidden="true">»</span><span class="sr-only">Next</span></a></li>
                      </ul>
              </div>
              </div>
          </div>
       </div>
 </form>
    </div>
      <%@ include file="./footer.jsp"  %>
      </div>
      </div>
      
   
</body>

</html>