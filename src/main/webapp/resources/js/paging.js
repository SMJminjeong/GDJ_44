function pagingFrom(){
	document.getElementById("frmPaging").submit();
}

function pageIdx(idx){
	console.log("입력 받은 index 값 ", idx);
	var index = document.getElementById("index");
	index.value = idx-1;
	 pagingFrom();
}

function pageFir(){
	console.log("처음페이지로 이동");
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	index.value=0;
	pageStartNum.value=1;
	pagingFrom();
}

function pagePre(pageStartNum,pageListNum){
	console.log("이전 페이지로 이동");
	if(0 < pageStartNum - pageListNum){
		pageStartNum -= pageListNum
		var index = document.getElementById("index");
		var pageStartNum = document.getElementById("pageStartNum");
		
		index.value = pageStartNum-1;
		pageStartNum.value = pageStartNum;
	}
	 pagingFrom();
}

function pageNes(pageStartNum,total,pageListNum,pageList){
	console.log("다음 페이지로 이동");
	var idx = Math.ceil(total/pageListNum);
	var max = Math.ceil(idx/pageList);
	
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
	console.log("마지막 페이지로 이동");
	var idx = Math.ceil(total/pageListNum); 
	var max = Math.ceil(idx/pageList);
	
	while(max*pageList > pageStartNum+pageList){
		pageStartNum += pageList;
	}
	var index = document.getElementById("index");
	var pageStartNum = document.getElementById("pageStartNum");
	
	index.value=idx-1;
	pageStartNum.value=pageStartNum;
	 pagingFrom()
}












