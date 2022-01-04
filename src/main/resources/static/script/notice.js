function search_notice(){
	if( document.frm.key.value=="") return;
	document.frm.action = "noticeList?page=1";
	document.frm.submit();
}
