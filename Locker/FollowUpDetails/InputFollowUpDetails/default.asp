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

set Con=Server.CreateObject("Adodb.Connection")
Con.open getConn

lockerHolderName=strRequest("lockerHolderName")
lockerNo=strRequest("lockerNo")
accountNumber=strRequest("accountNumber")
'fromdate=strRequest("fromDate")
%>
    <%
    	 	response.write create_formheader(defaultText &": "& strRequest("report_name"),"","90%") 
			
	%>
    
	
<form action="default.asp" method="post" name="modifyLocker" id="modifyLocker">

	
       
    <table cellSpacing=0 cellPadding=4 align=center bgColor=#ffffff
		border=0 width=100% class="colText">
    
      <tr>
        <td width="226" class="FormLabell">LOCKER HOLDER'S NAME</td>
        <td width="1064" colspan="4" class="FormLabell">
        <input type="text" name="lockerHolderName" id="lockerHolderName" size="35" maxlength="35" value="<%=lockerHolderName%>"></td>
           
      </tr>
      <tr>
        <td nowrap class="FormLabell">LOCKER NO</td>
        <td colspan="4" class="FormLabell"><input type="text" name="lockerNo" id="lockerNo" size="35" maxlength="35" value="<%=lockerNo%>"></td>
      <tr>
        <td nowrap class="FormLabell">ACCOUNT NUMBER</td>
        <td colspan="4" class="FormLabell"><input type="text" name="accountNumber" id="accountNumber" size="35" maxlength="35" value="<%=accountNumber%>"></td>
      <tr>
      <!--  <td nowrap class="FormLabell">DATE</td>
        <td colspan="4" class="FormLabell"><span class="formLabelL">-->
          <% 
		'if fromdate="" then
'		  	local_date=getLocalDate(1,con)
'			date_control local_date,local_date ,"modifyLocker"
'		ELSE
'        	date_control fromdate,todate ,"modifyLocker"
'		END IF
		
    	%>
        </span></td>
      
      <!--<tr>-->
        <td nowrap class="FormLabell">
        	<%=iRemitButtonGroupStart() %> 
             <%=iRemitButton("search|btnCustNew3|Search|searchLocker()|true|submit")%>
            <%=iRemitButton("audit||Authorize|authForm()|"& EnableAuth)%>
            <%=iRemitButtonGroupEnd() %>
         
        </td>
			
        <td colspan="4" class="FormLabell">&nbsp;</td>
      </tr>
      <tr>
      </tr>	
      
       <%
	response.write create_formfooter()
	%>
  <%
  
				sql = "spa_lockerDetails "& _                  
					"@flag='s',"& _
					"@lockerHolderName="& singleQuote(lockerHolderName) &","& _ 
					
					"@lockerNo  ="& singleQuote(lockerNo) &","& _                      
					"@accountNumber="& singleQuote(accountNumber)
					
				'Response.Write sql
				'Response.End()
				set rsLock=server.CreateObject("Adodb.RecordSet")
				rsLock.open sql,con
	
	  %>
  <table width="99%" class="sortable" id="customer_list" > 
    <thead>
    
    
     <tr>
    <th width="9%" height="24" class="sort_number"><div align="center"><%=getlabel("Locker Number")%></div></th>
      <th width="14%"><div align="center"><%=getLabel("Account Number")%></div></th>
      <th width="19%"><div align="center"><%=getLabel("LOCKER HOLDER'S NAME")%></div></th>
      <!--<th width="13%"class="sort_date" >Create TS</th>-->
	  <th width="11%"><div align="center">Locker Detail</div></th>
   
    </tr>
    </thead>
    			<% IF rsLock.EOF Then%>
					<tr>
						<td colspan="5"><strong style="color:red;font-size:12px">No Record Found</strong></td>
					</tr>
				<%END IF%> 
			<%
                
                ctr=1
                WHILE NOT rsLock.EOF
				while rsLock.state=0
			 Set rsLock = rsLock.NextRecordset
			wend
            %>
        
    <tr>
    <td><a href="followUp.asp?lockerId=<%=rsLock("lockerId")%>"><%=rsLock("lockerNo")%></a>&nbsp;</td>
      <td><%=rsLock("accountNumber")%>&nbsp;</td>
      <td><%=rsLock("lockerHolderName")%>&nbsp;</td>
      <!--<td><%'=rsLock("lockerId")%></td>-->

	  <td><a href="followUp.asp?lockerId=<%=rsLock("lockerId")%>">Detail</a>&nbsp;</td>
      
    
    </tr>
	
	<%
		ctr=ctr+1
		rsLock.MOVENEXT
		WEND
		
	%>
 
</table>
  
    </table>
 

		
</form>       





	<%
	response.write create_formfooter()
	%>

</html>

<script>

function searchLocker() 
	{
		
		$("#modifyLocker").submit();
		// '#' take form id
	
	} 
</script>
