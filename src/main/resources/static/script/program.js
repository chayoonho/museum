function search_program(){
	if( document.frm.key.value=="") return;
	document.frm.action = "programList?page=1";
	document.frm.submit();
}
