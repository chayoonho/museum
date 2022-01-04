
function go_voc_admin_delete(num)
{
	if( confirm('삭제하시겠습니까?') )
	{
		alert("삭제되었습니다");
		
		document.frm.action = "museum.do?command=vocDelete&prev=adminVocList&num=" + num;
		document.frm.submit();
	}
}