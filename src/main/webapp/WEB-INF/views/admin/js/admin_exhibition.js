/*$(document).ready(function(){
	var today = new Date();
	today = today.toISOString().slice(0,10);
	
	document.getElementById('startdate').value = today;
	document.getElementById('enddate').value = today;
});*/

// 특별 전시 추가
function add_exhibition()
{
	if(document.frm.title.value == "")
	{
		alert("전시명을 입력하세요.");
		
		document.frm.title.focus();
	}
	else if(document.frm.place.value == "")
	{
		alert("전시 장소를 입력하세요.");
		
		document.frm.place.focus();
	}
	else if(document.frm.startdate.value == "")
	{
		alert("전시 시작일을 입력하세요.");
		
		document.frm.startdate.focus();
	}
	else if(document.frm.enddate.value == "")
	{
		alert("전시 종료일을 입력하세요.");
		
		document.frm.enddate.focus();
	}
	else if(document.frm.img.value == "")
	{
		alert("이미지를 선택하세요.");
		
		document.frm.img.focus();
	}
	else if(document.frm.detail_content.value == "")
	{
		alert("상세 내용을 입력하세요.");
		
		document.frm.detail_content.focus();
	}
	else
	{
		alert("등록 되었습니다.");
		
		document.frm.action = "museum.do?command=exhibitionAdd";
		document.frm.submit();
	}
}

function update_exhibition(num)
{
	if(document.frm.title.value == "")
	{
		alert("전시명을 입력하세요.");
		
		document.frm.title.focus();
	}
	else if(document.frm.place.value == "")
	{
		alert("전시 장소를 입력하세요.");
		
		document.frm.place.focus();
	}
	else if(document.frm.startdate.value == "")
	{
		alert("전시 시작일을 입력하세요.");
		
		document.frm.startdate.focus();
	}
	else if(document.frm.enddate.value == "")
	{
		alert("전시 종료일을 입력하세요.");
		
		document.frm.enddate.focus();
	}
	else if(document.frm.img.value == "")
	{
		alert("이미지를 선택하세요.");
		
		document.frm.img.focus();
	}
	else if(document.frm.detail_content.value == "")
	{
		alert("상세 내용을 입력하세요.");
		
		document.frm.detail_content.focus();
	}
	else
	{
		if(confirm('수정하시겠습니까?'))
		{			
			document.frm.action = "museum.do?command=exhibitionUpdate&num=" + num;
			document.frm.submit();
		}
	}
}

function delete_exhibition(num)
{
	if(confirm('삭제하시겠습니까?'))
	{
		alert("삭제되었습니다.");
		
		document.frm.action = "museum.do?command=exhibitionDelete&num=" + num;
		document.frm.submit();
	}
}