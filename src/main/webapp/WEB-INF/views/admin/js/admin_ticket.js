
function go_delete_admin_ticket(num)
{
	if( confirm('삭제하시겠습니까?') )
	{
		alert('삭제되었습니다.')
		
		document.frm.action = "museum.do?command=ticketDelete&prev=adminShareTicketList&num=" + num;
		document.frm.submit();
	}
}