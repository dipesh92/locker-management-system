<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript charset=UTF-8" />

<html>
<head>
<script src="/js/jsFunc.js"></script>
<script type="text/javascript" src="common/ajax/ajaxfun.js"></script>
</head>
<body topmargin=0>


    <%
    	 	response.write create_formheader(defaultText &": "& strRequest("report_name"),"","90%") 
	%>
    
       
<table border=0 cellpadding=1 cellspacing=0  align=center width=100%>
<% if searchParam = "y" then %>
<tr>
  <td>&nbsp;</td>
</tr>
<% end if %>
<tr>

<Td align=center><%=CONST_UNDER_CONSTRUCTION%></Td></tr>
     <tr>
       <td>
    </table>

</td></tr>
</table>

<%
	response.write create_formfooter()
	%>
     
