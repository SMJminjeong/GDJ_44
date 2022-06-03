<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>과목 페이지</title>

</head>

<body>
<!-- page-wrapper Start-->
    <div class="page-wrapper" id="pageWrapper">
      <!-- Page Body Start-->
      <div class="page-body-wrapper horizontal-menu">
      <%@ include file="./header.jsp"  %>
   
    <div class="page-body">
    
    <form action="./subjectList.do" method="post" id="frmPaging">
		<input type="hidden" name="index" id="index" value="${paging.index}">
		<input type="hidden" name="pageStartNum" id="pageStartNum" value="${paging.pageStartNum}">
		<input type="hidden" name="pageListNum" id="pageListNum" value="${paging.pageListNum}">
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
                <div class="col-sm-6">
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
                          <th scope="col"><h6 class="f-w-700">작성일</h6></th>
                          <c:if test="${mem.auth eq 'ROLE_ADMIN'}">
                          	<th scope="col"><h6 class="f-w-700">승인상태</h6></th>
                          	<th scope="col"><h6 class="f-w-700">관리</h6></th>
                          	</c:if>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="vo" items="${subLists}"  varStatus="vs">
                  <tr>
	                  <c:if test="${mem.auth eq 'ROLE_ADMIN'}">
	                     <td><input type="checkbox" name="chkVal"></td>
	                    </c:if>
                     <td>${vo.sub_num}</td>
                     <td><a href="./adminSubjectDetail.do?sub_num=${vo.sub_num}">${vo.sub_title}</a></td>
                     <td>
                     	  <c:choose>
                            <c:when test="${vo.cod_name  eq 'JAVA'}">
                            <span class="badge rounded-pill" style="background-color:#006400 ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'C'}">
                            <span class="badge rounded-pill" style="background-color: #AFEEEE" >${vo.cod_name}</span>
                           </c:when>
                            <c:when test="${vo.cod_name  eq 'HTML'}">
                            <span class="badge rounded-pill" style="background-color:#6A5ACD ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'PYTHON'}">
                            <span class="badge rounded-pill" style="background-color: #C71585" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq 'CSS'}">
                            <span class="badge rounded-pill" style="background-color:#FFF8DC ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'LINUX'}">
                            <span class="badge rounded-pill" style="background-color: #40E0D0" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq 'C#'}">
                            <span class="badge rounded-pill" style="background-color:	#8FBC8F ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'JAVASCRIPT'}">
                            <span class="badge rounded-pill" style="background-color:	#8A2BE2" >${vo.cod_name}</span>
                           </c:when>
                            <c:when test="${vo.cod_name  eq 'AI'}">
                            <span class="badge rounded-pill" style="background-color:	#FFB6C1 ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'BIGDATA'}">
                            <span class="badge rounded-pill" style="background-color: 	#000080" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq 'DEEPLEARNING'}">
                            <span class="badge rounded-pill" style="background-color:	#FA8072">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'VR'}">
                            <span class="badge rounded-pill" style="background-color: #FFA500" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq 'AR'}">
                            <span class="badge rounded-pill" style="background-color:	#F0E68C ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'EXCEL'}">
                            <span class="badge rounded-pill" style="background-color: 	#B0C4DE" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq 'POWERPOINT'}">
                            <span class="badge rounded-pill" style="background-color:	#2F4F4F">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'KOTLIN'}">
                            <span class="badge rounded-pill" style="background-color: #D8BFD8" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq 'SPRING'}">
                            <span class="badge rounded-pill" style="background-color:#1E90FF ">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq '기타'}">
                            <span class="badge rounded-pill" style="background-color: #008080" >${vo.cod_name}</span>
                            </c:when>
                            <c:when test="${vo.cod_name  eq '형상관리'}">
                            <span class="badge rounded-pill" style="background-color:	#FFD700">${vo.cod_name}</span>
                            </c:when>
                              <c:when test="${vo.cod_name eq 'DATABASE'}">
                            <span class="badge rounded-pill" style="background-color: #A52A2A" >${vo.cod_name}</span>
                            </c:when>
                            <c:otherwise>
                            	 <span class="badge rounded-pill" style="background-color: 	#556B2F" >${vo.cod_name}</span>
                            </c:otherwise>
                            </c:choose>
                     </td>
                     <td>${vo.sub_reg_id}</td>
                     <c:if test="${vo.sub_ins != null}">
                     <td>${vo.sub_ins}</td>
                     </c:if>
                     <c:if test="${vo.sub_ins == null}">
                     <td>담당 강사 미정</td>
                     </c:if>
                     <td>
                           <fmt:parseDate var='cDate' value="${vo.sub_regdate}" pattern="yyyy-MM-dd"/>
                           <fmt:formatDate value="${cDate }"/>
                     </td>
                       <c:if test="${mem.auth eq 'ROLE_ADMIN'}">
                       <c:choose>
                       	<c:when test="${vo.sub_status eq 'A'}">
                     		<td><span class="badge rounded-pill" style="background-color: 	#1E90FF">승인</span></td>
                       	</c:when>
                       <c:when test="${vo.sub_status eq 'W'}">
                     		<td><span class="badge rounded-pill badge-info">대기중</span></td>
                       	</c:when>
                       	<c:when test="${vo.sub_status eq 'R'}">
                     		<td><span class="badge rounded-pill badge-warning">반려</span></td>
                       	</c:when>
                       	<c:when test="${vo.sub_status eq 'D'}">
                     		<td><span class="badge rounded-pill badge-danger">삭제</span></td>
                       	</c:when>
                       </c:choose>
                     	</c:if>
                     	 <td><a><button type="button" class="btn btn-pill btn-outline-danger-2x btn-xs">삭제</button></a></td>
                  </tr>
               </c:forEach>
                        
                      </tbody>
                    </table>
                    </div>
                  </div>
                </div>
                
            <!-- pagination with active and disabled state-->
              <div class="col-xl-12">
                      <ul class="pagination justify-content-center pagination-primary">
                        <li class="page-item "><a onclick="pageFir()" class="page-link"  href="#"><span><i class="icon-angle-double-left"></i></span></a></li>
                        <li class="page-item"><a onclick="pagePre(${paging.pageStartNum},${paging.pageList})" class="page-link"  href="#"><span><i class="icon-angle-left"></i></span></a></li>
                         <c:forEach var="i" begin="${paging.pageStartNum}" end="${paging.count}" step="1">
                         	<li  onclick="pageIdx(${i})" class="page-item"><a class="page-link" href="#"><span>${i}</span></a></li>
					  	</c:forEach>
                        <li class="page-item"><a onclick="pageNes(${paging.pageStartNum},${paging.total},${paging.pageListNum},${paging.pageList})" class="page-link"  href="#"><span><i class="icon-angle-right"></i></span></a></li>
                        <li class="page-item"><a onclick="pageLa(${paging.pageStartNum},${paging.total},${paging.pageListNum},${paging.pageList})" class="page-link"  href="#"><span><i class="icon-angle-double-right"></i></span></a></li>
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
<script type="text/javascript">
function pageFir(){
	console.log("처음페이지로 이동");
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	
	index.value=0;
	pageStartNum.value=1;
	 pagingFrom();
}
function pagePre(pageStartNum,pageListNum){
	console.log("이전 그룹");
	if(0 < pageStartNum - pageListNum){
		pageStartNum -= pageListNum
		var index = document.getElementById("index");
		var pageStartNum = document.getElementById("pageStartNum");
		
		index.value = pageStartNum-1;
		pageStartNum.value = pageStartNum;
	}
	 pagingFrom();
}
function pageIdx(idx){
	console.log("입력 받은 index 값 ", idx);
	var index = document.getElementById("index");
	index.value = idx-1;
	 pagingFrom();
}
function pageNes(pageStartNum,total,pageListNum,pageList){
	console.log("다음 페이지");
	var idx = Math.ceil(total/pageListNum); // 31/5 => 7
	var max = Math.ceil(idx/pageList); // 2그룹
	
	if(max*pageList > pageStartNum+pageList){
		pageStartNum += pageList;
		
		var index = document.getElementById("index");
		var pageStartNum = document.getElementById("pageStartNum");
		
		index.value = pageStartNum-1;
		pageStartNum.value=pageStartNum;
	}
	 pagingFrom();
}
function pageLa(pageStartNum,total,pageListNum,pageList){
	console.log("마지막 페이지");
	var idx = Math.ceil(total/pageListNum); // 31/5 7 index
	var max = Math.ceil(idx/pageList); // 12345|56 => 2묶음
	
	while(max*pageList > pNum+pageList){
		pageStartNum += pageList;
	}
	
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	
	index.value=idx-1;
	pageStartNum.value=pageStartNum;
	 pagingFrom()
}
function pagingFrom(){
	document.getElementById("frmPaging").submit();
}

function listCnt(){
	document.getElementById("index").value=0;
	document.getElementById("pageStartNum").value=1;
	document.getElementById("pageListNum").value = document.getElementById("listCount").value;
	pagingFrom();
}
</script>
</html>