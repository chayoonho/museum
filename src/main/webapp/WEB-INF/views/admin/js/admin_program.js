function go_save_program(num)
{
	if (document.frm.status.value == "") 
	{
		alert("접수현황을 선택하세요.");
		
		document.frm.status.focus();
	}
	else if (document.frm.title.value == "") 
	{
		alert("제목입력은 필수사항입니다.");
		
		document.frm.title.focus();
	} 
	else if (document.frm.startdate.value == "") 
	{
		alert("시작일입력은 필수사항입니다.");
		
		document.frm.startdate.focus();
	} 
	else if (document.frm.enddate.value == "") 
	{
		alert("종료일입력은 필수사항입니다.");
		
		document.frm.enddate.focus();
	} 
	else if (document.frm.place.value == "") 
	{
		alert("장소입력은 필수사항입니다.");
		
		document.frm.place.focus();
	} 
	else if (document.frm.target.value == "") 
	{
		alert("대상입력은 필수사항입니다.");
		
		document.frm.target.focus();
	} 
	else if (document.frm.entry_fee.value == "") 
	{
		alert("참가비입력은 필수사항입니다.");
		
		document.frm.entry_fee.focus();
	} 
	else if (document.frm.detail_content.value == "") 
	{
		alert("상세설명입력은 필수사항입니다.");
		
		document.frm.detail_content.focus();
	} 
	else 
	{
		document.frm.action = "museum.do?command=programWrite";
		document.frm.submit();
	}
}

function go_update_program(num)
{
	var url = "museum.do?command=programUpdateForm&num=" + num;
	location.href=url;
}

function go_update_save_program()
{
	if (document.frm.status.value == "") 
	{
		alert("접수현황을 선택하세요.");
		
		document.frm.status.focus();
	}
	else if (document.frm.title.value == "") 
	{
		alert("제목입력은 필수사항입니다.");
		
		document.frm.title.focus();
	} 
	else if (document.frm.startdate.value == "") 
	{
		alert("시작일입력은 필수사항입니다.");
		
		document.frm.startdate.focus();
	} 
	else if (document.frm.enddate.value == "") 
	{
		alert("종료일입력은 필수사항입니다.");
		
		document.frm.enddate.focus();
	}
	else if (document.frm.place.value == "") 
	{
		alert("장소입력은 필수사항입니다.");
		
		document.frm.place.focus();
	} 
	else if (document.frm.target.value == "") 
	{
		alert("대상입력은 필수사항입니다.");
		
		document.frm.target.focus();
	} 
	else if (document.frm.entry_fee.value == "") 
	{
		alert("참가비입력은 필수사항입니다.");
		
		document.frm.entry_fee.focus();
	} 
	else if (document.frm.detail_content.value == "") 
	{
		alert("상세설명입력은 필수사항입니다.");
		
		document.frm.detail_content.focus();
	} 
	else 
	{	
		if( confirm('수정하시겠습니까?') )
		{
			document.frm.action = "museum.do?command=programUpdate";
			document.frm.submit();
		}	
	}
}

function go_delete_program(num)
{
	if( confirm('삭제하시겠습니까?') )
	{
		alert('삭제되었습니다.');
		
		document.frm.action = "museum.do?command=programDelete&num=" + num;
		document.frm.submit();
	}
}

// 전체 신청자 현황
function view_booking_all_member()
{
	document.frm.action = "museum.do?command=adminBookingList";
	document.frm.submit();
}

// 해당 프로그램 신청자 현황
function view_booking_member(num)
{
	document.frm.action = "museum.do?command=adminBookingByProgramList&num=" + num;
	document.frm.submit();
}

