
<%
String message = (String) session.getAttribute("message");
if (message != null) {

	//out.println(message);
%>

<div class="alert alert-success d-flex align-items-center" role="alert">
	<svg class="bi flex-shrink-0 me-2" width="24" height="24" role="img"
		aria-label="Success:">
		<use xlink:href="#check-circle-fill" /></svg>
	<div><%= message%></div>
</div>
 
<%
session.removeAttribute("message");
}
%>
