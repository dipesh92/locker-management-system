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
 <form name="" id="" method="post" action="">   
       
<table border=0 cellpadding=1 cellspacing=0  align=center width=100% bgColor=#ffffff   class="sortable" >
	
    <thead>
    <tr>
      <th width="14%"><div align="center"><%=getLabel("S.N")%></div></th>
       <th width="14%"><div align="center"><%=getLabel("Branch Name")%></div></th>
       <th width="19%"><div align="center"><%=getLabel("LOCKER HOLDER'S NAME")%></div></th>	
      <th width="9%" height="24" class="sort_number"><div align="center"><%=getlabel("Locker Number")%></div></th>
      <th width="14%"><div align="center"><%=getLabel("Locker Size")%></div></th>
      <th width="14%"><div align="center"><%=getLabel("Account Number")%></div></th>
      <th width="14%"><div align="center"><%=getLabel("Locker Closed Date")%></div></th>
      <th width="14%"><div align="center"><%=getLabel("Inputter")%></div></th>
      <th width="14%"><div align="center"><%=getLabel("Authorizer")%></div></th>
      
      <!--<th width="13%"class="sort_date" >Create TS</th>-->
	  <th width="11%"><div align="center">Locker Detail</div></th>
   
    </tr>
    </thead>
    
	<%
    
    set Con=Server.CreateObject("Adodb.Connection")
    Con.open getConn
    
	sql_txt = "SELECT * FROM lockerDetails "

	set rsLock=server.CreateObject("Adodb.RecordSet")
	rsLock.open sql_txt,con
	
    %>
    
    		<% IF rsLock.EOF Then%>
					<tr>
						<td colspan="10"><strong style="color:red;font-size:12px">No Record Found</strong></td>
					</tr>
				<%END IF%> 
			<%
                
                ctr=1
                WHILE NOT rsLock.EOF
				
				WHILE rsLock.state=0
				SET rsLock = rsLock.NextRecordset
				WEND
            %>
    
    <tr>
      <td><%=rsLock("lockerId")%>&nbsp;</td>
      <td><%=rsLock("lockerHolderName")%>&nbsp;</td>
      <td><%=rsLock("accountNumber")%>&nbsp;</td>
      <td><%=rsLock("lockerHolderName")%>&nbsp;</td>
      <td><%=rsLock("accountNumber")%>&nbsp;</td>
      <td><%=rsLock("lockerHolderName")%>&nbsp;</td>
      <td><%=rsLock("accountNumber")%>&nbsp;</td>
      <td><%=rsLock("lockerHolderName")%>&nbsp;</td>
      <td><%=rsLock("lockerHolderName")%>&nbsp;</td>
      <td><%=rsLock("lockerStatus")%>&nbsp;</td>
    </tr>

	<%
		ctr=ctr+1
		rsLock.MOVENEXT
		WEND
		
	%>
 	
</table>
</form>


<%
	response.write create_formfooter()
	%>
    
    </body>
</html>
     
