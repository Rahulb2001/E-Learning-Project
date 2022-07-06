<%
String message=(String)session.getAttribute("coursemessage");
if(message!=null){
	

%>
<%@include file="Bootstrap_cdn.jsp"%>
<div class="alert alert-sucess alert-dismissible fade show" role="alert">
  <strong><%=message%></strong>
	<button type="button" class="close" data-dismiss="alert"
		aria-label="Close">
		<span aria-hidden="true">&times;</span>
	</button>
</div>
<%
session.removeAttribute("message");
}
%>