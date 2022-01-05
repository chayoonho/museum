function go_update_booking(num)
{
	var url = "museum.do?command=bookingUpdateForm&num=" + num;
	location.href = url;
}

function go_cancel_booking(num)
{
	if( confirm('예약을 취소하시겠습니까?') )
	{
		alert('예약이 취소되었습니다.');
		
		document.frm.action = "museum.do?command=bookingCancel&num="+num;
		document.frm.submit();
	}
}