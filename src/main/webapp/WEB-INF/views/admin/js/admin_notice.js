function go_save_notice() 
{
	if (document.frm.title.value == "") 
	{
		alert("제목을 입력하세요.");
		
		document.frm.title.focus();
	}
	else if (document.frm.content.value == "") 
	{
		alert("내용을 입력하세요.");
		
		document.frm.content.focus();
	} 
	else 
	{
		document.frm.action = "museum.do?command=noticeWrite";
		document.frm.submit();
	}
}

function go_update_notice(num)
{
	var url = "museum.do?command=noticeUpdateForm&num=" + num;
	location.href = url;
}

function go_update_save_notice()
{
	if (document.frm.title.value == '') 
	{
		alert('제목을 입력하세요.'); 	  

		document.frm.title.focus();
	} 
	else if (document.frm.content.value == '') 
	{
		alert('내용을 입력하세요');	  
		
		document.frm.content.focus();
	}
	else
	{
		if( confirm('수정하시겠습니까?') )
		{
			 document.frm.action = "museum.do?command=noticeUpdate";
			 document.frm.submit();
		}
	}
}

function go_delete_notice(num)
{
	if( confirm('삭제하시겠습니까?') )
	{
		alert('삭제되었습니다.')
		
		document.frm.action = "museum.do?command=noticeDelete&num=" + num;
		document.frm.submit();
	}
}