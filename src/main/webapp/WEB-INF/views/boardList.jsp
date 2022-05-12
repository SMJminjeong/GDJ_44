<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"  uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 전체보기</title>
<script type="text/javascript">

	
</script>
</head>

<body>
	<div id="wrapper">
		<%@ include file="./header.jsp"%>
     <input type="hidden" name="index" id="index" value="${row.index}">
      <input type="hidden" name="pageNum" id="pageNum" value="${row.pageNum}">
      <input type="hidden" name="listNum" id="listNum" value="${row.listNum}">
      
      <div style="text-align: center;">
      	 <ul class="pagination pagination">
      	 	<li><a href="#" onclick="pageFirst()"><span class="glyphicon glyphicon-fast-backward"></span></a></li>
      	 	<li><a href="#" onclick="pagePrev(${row.pageNum}, ${row.pageList})"><span class="glyphicon glyphicon-step-backward"></span></a></li>      	 	
      	 	<c:forEach var="i" begin="${row.pageNum}" end="${row.count}" step="1">
			   <li ${(i-1) == row.index ? "class='active'" : ""}><a href="#" onclick="pageIndex('${i}')">${i}</a></li>
      	 	</c:forEach>
      	 	<li><a href="#" onclick="pageNext(${row.pageNum},${row.total},${row.listNum},${row.pageList})"><span class="glyphicon glyphicon-step-forward"></span></a></li>
      	 	<li><a href="#" onclick="pageLast()"><span class="glyphicon glyphicon-fast-forward"></span></a></li>    
		  </ul>
      </div>
<div class="container">
  <h2>[ 전체 게시글 ]</h2>
  <p>전체 게시글입니다.</p>     
  <div>
	  <a href="./boardWrite.do"><input class="btn btn-primary" type="button" value="WRITE"></a>
  </div>
  <table class="table table-condensed">
    <thead>
      <tr>
        <th>글번호</th>
        <th>작성자</th>
        <th>제목</th>
        <th>조회수</th>
        <th>작성일</th>
      </tr>
    </thead>
   				<tbody>
					<c:forEach var="dto" items="${lists}"  varStatus="vs">
						<tr>
							<td><input type="checkbox" name="chkVal" value="${dto.seq}"></td>
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
 
</body>
</html>