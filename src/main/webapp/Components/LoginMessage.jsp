<%
String message=(String)session.getAttribute("loginmessage");
if(message!=null){
	

%>
<div class="alert alert-sucess alert-dismissible fade show" role="alert">
  <strong><%=message%></strong>
  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
</div>
<%
session.removeAttribute("loginmessage");
}
%>