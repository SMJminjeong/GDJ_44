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
<script type="text/javascript">

   
</script>
</head>

<body>
<!-- page-wrapper Start-->
    <div class="page-wrapper" id="pageWrapper">
      <!-- Page Body Start-->
      <div class="page-body-wrapper horizontal-menu">
      <%@ include file="./header.jsp"  %>
   
    <div class="page-body">
          <div class="container-fluid">
            <div class="page-header">
              <div class="row">
                <div class="col-sm-6">
                  <h3>Bootstrap Basic Tables</h3>
                </div>
                <div class="col-sm-6">
                  <!-- Bookmark Start-->
                  <div class="bookmark">
                    <ul>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Tables"><i data-feather="inbox"></i></a></li>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Chat"><i data-feather="message-square"></i></a></li>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Icons"><i data-feather="command"></i></a></li>
                      <li><a href="javascript:void(0)" data-container="body" data-bs-toggle="popover" data-placement="top" title="" data-original-title="Learning"><i data-feather="layers"></i></a></li>
                      <li><a href="javascript:void(0)"><i class="bookmark-search" data-feather="star"></i></a>
                        <form class="form-inline search-form">
                          <div class="form-group form-control-search">
                            <input type="text" placeholder="Search..">
                          </div>
                        </form>
                      </li>
                    </ul>
                  </div>
                  <!-- Bookmark Ends-->
                </div>
              </div>
            </div>
          </div>
          <!-- Container-fluid starts-->
          <div class="container-fluid">
            <div class="row">
              <div class="col-sm-12">
                <div class="card">
                  <div class="card-header">
                    <h5>과목 전체 조회</h5><span>등록된 과목 전체목록입니다.<code></code> </span>
                     <div>
                 <a href="./subjectInsertForm.do" style="align-content: right;"><input class="btn btn-primary" type="button" value="과목 등록"></a>
                       </div>
                  </div>
                  <div class="table-responsive">
                    <table class="table">
                      <thead>
                        <tr>
		                     <c:if test="${mem.auth eq 'ROLE_ADMIN'}">
		                     	<td><input type="checkbox" name="chkAll" onclick="checkAlls(this.checked)"></td>
		                     </c:if>
                          <th scope="col">과목번호</th>
                          <th scope="col">과목명</th>
                          <th scope="col">카테고리</th>
                          <th scope="col">관련태그</th>
                          <th scope="col">작성자</th>
                          <th scope="col">담당강사</th>
                          <th scope="col">작성일</th>
                        </tr>
                      </thead>
                      <tbody>
                      <c:forEach var="dto" items="${lists}"  varStatus="vs">
                  <tr>
                     <td><input type="checkbox" name="chkVal"></td>
                     <td>${dto.seq}</td>
                     <td>${dto.id}</td>
                     <td><a href="./detailBoard.do?seq=${dto.seq}">${dto.title}</a> </td>
                     <td>${dto.readcount}</td>
                     <td>
                           <fmt:parseDate var='cDate' value="${dto.regdate}" pattern="yyyy-MM-dd"/>
                           <fmt:formatDate value="${cDate }"/>
                     </td>
                  </tr>
               </c:forEach>
                        
                      </tbody>
                    </table>
                  </div>
                </div>
              </div>
          </div>
       </div>
    </div>
 
      <%@ include file="./footer.jsp"  %>
      </div>
      </div>
</body>
</html>