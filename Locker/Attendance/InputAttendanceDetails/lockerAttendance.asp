<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript charset=UTF-8" />

<html>
<head>
<script src="/js/jsFunc.js"></script>
<script type="text/javascript" src="../../InputAuthorize/ModifyLockerDetails/common/ajax/ajaxfun.js"></script>
</head>
<body topmargin=0>

<%

set Con=Server.CreateObject("Adodb.Connection")
Con.open getConn

'lockerNo=strRequest("lockerNo")
lockerId= strRequest("lockerId")

%>

<%
 				sql="spa_lockerAttendance @flag='S',@lockerID= "& singleQuote(lockerId)

				set rsLock=server.CreateObject("Adodb.RecordSet")
				rsLock.open sql,con
				'abc =rsLock("nameOfPersonVisitingLocker")
'				Response.Write(abc)
				
				if rsLock("BUTTON")="ENTER" THEN
				spa_flag="I"
				ELSE
				spa_flag="U"
				end if
				
	
	  %>
    <%
    	 	response.write create_formheader(defaultText &": "& strRequest("report_name"),"","90%") 
			
	%>
    
	
<form action="default.asp" method="post" name="attendance" id="attendance">

	
       
    <table cellSpacing=0 cellPadding=4 align=center bgColor=#ffffff
		border=0 width=100% class="colText">
    
   
      
      		<%
                
              '  ctr=1
'                WHILE NOT rsLock.EOF
'					while rsLock.state=0
'				 Set rsLock = rsLock.NextRecordset
'				wend
'				
            %>
      
      <tr>
        <td width="315" class="FormLabell">LOCKER HOLDER NAME</td>
        <td width="261" class="FormLabell">
        <input type="text" name="lockerHolderName" id="lockerHolderName" size="35" maxlength="35" value="<%=rsLock("lockerHolderName")%>">
         <input type="hidden" name="lockerId" id="lockerId" size="35" maxlength="35" value="<%=rsLock("lockerId")%>"> </td>
        <td width="215" class="FormLabell">ACCOUNT NO.</td>
        <td width="483" class="FormLabell"><input type="text" name="accountNumber" id="accountNumber" size="35" maxlength="35" value="<%=rsLock("accountNumber")%>"></td>
           
      </tr>
      <tr>
        <td nowrap class="FormLabell">EXPIRY DATE</td>
        <td colspan="3" class="FormLabell"><input type="text" name="expireDate" id="expireDate" size="35" maxlength="35" value="<%=rsLock("nextRenewalDate")%>"></td>
      <tr>
        <td nowrap class="FormLabell">NAME OF CO-LESSEE (IF ANY)</td>
        <td colspan="3" class="FormLabell"><input type="text" name="nameOfColessee" id="nameOfColessee" size="35" maxlength="35" value="<%=rsLock("nameOfColessee")%>"></td>
      <tr>
        <td nowrap class="FormLabell">PENDING DOCUMENTS (IF ANY)</td>
        <td colspan="3" class="FormLabell"><input type="text" name="pendingDocument" id="pendingDocument" size="35" maxlength="35" value="<%=rsLock("pendingDocument")%>"></td>
      <tr>
        <td nowrap class="FormLabell">INSUFFICIENT LIEN AMOUNT</td>
        <td class="FormLabell"><input type="text" name="insufficentLienAmount" id="insufficentLienAmount" size="35" maxlength="35" value="<%=rsLock("lienAmount")%>"></td>
        <td class="FormLabell">LOCKER STATUS</td>
        <td class="FormLabell"><select id="lockerStatus" name="lockerStatus">
				<%
                 post = rsLock("lockerStatus")
                %>
          <option value ="">--Select--</option>
          <option value  ="freeze"<% if post="freeze" then Response.Write("selected='selected'") else Response.Write("") end if%>>Locker Freezed</option>
          <option value ="closed"<% if post="closed" then Response.Write("selected='selected'") else Response.Write("") end if%>>Locker Closed</option>
        </select></td>
      <tr>
      
    
      
      </tr>
        <td nowrap class="FormLabell">INSUFFICIENT ANNUAL CHARGE</td>
        <td colspan="3" class="FormLabell"><input type="text" name="insufficentAnnualCharge" id="insufficentAnnualCharge" size="35" maxlength="35" value="<%=insufficentAnnualCharge%>"></td>
      <tr>
        <td nowrap class="FormLabell">&nbsp;</td>
        <td colspan="3" class="FormLabell">&nbsp;</td>
      <tr>
        <td nowrap class="FormLabell">NAME OF PERSON VISITING THE LOCKER</td>
        <td colspan="3" class="FormLabell">
   			 <%
    
			sql= "SELECT  lockerHolderName AS visitor from lockerDetails where lockerid=" &singleQuote(lockerId)& _
									"UNION ALL SELECT nameOfColessee AS visitor from colesseeDetails where lockerid=" &singleQuote(lockerId)
		  set rsTemp=Server.CreateObject("Adodb.RecordSet")
		  rsTemp.open sql,con
		  while rsTemp.state=0
			   Set rsTemp = rsTemp.NextRecordset
		  wend
			
		  %>
          <%
		  	if rsLock("BUTTON")="ENTER" THEN
		  %>
				<select name='personVisited'  id='personVisited' class=TextBox tabindex=1>
						   <option value="">--Select--</option>
							 <%
							 while RsTemp.EOF =false
							%>
								 <option value="<%=RsTemp("visitor")%>" <%=select_partner%>><%=RsTemp("visitor")%></option>
								 <%
								RsTemp.MoveNext
								wend
						 %>
               </select>
               
               
               <%ELSE  %>
               <select id="personVisited" name="personVisited">
				
          
          <option value  ="<%= rsLock("nameOfPersonVisitingLocker")%>"><%= rsLock("nameOfPersonVisitingLocker")%></option>
          
        		</select>
                
                <%END IF%>
   
        </td>
      <tr>
        <td nowrap class="FormLabell">&nbsp;</td>
        <td colspan="3" class="FormLabell">&nbsp;</td>
      <tr>
       <!-- <td nowrap class="FormLabell">LOCKER IN TIME</td>-->
        <td colspan="3" class="FormLabell">
        <input type="hidden" name="spa_flag" value="<%=spa_flag%>">
         <input type="hidden" name="lockerAttendanceID" value="<%=rsLock("lockerAttendanceID")%>">
   
        <input type="hidden" name="lockerTimeIn" id="lockerTimeIn" size="35" maxlength="35" value="<%=lockerTimeIn%>" readonly></td>
      <tr>
     <!--   <td nowrap class="FormLabell">LOCKER OUT TIME</td>
        <td class="FormLabell"><input type="text" name="lockerTimeOut" id="lockerTimeOut" size="35" maxlength="35" value="<%=lockerTimeOut%>"></td>
        <td class="FormLabell">STAFF INVOLVED</td>
        <td class="FormLabell"><input type="text" name="staffInvolved" id="staffInvolved" size="35" maxlength="35" value="<%=staffInvolved%>"></td>-->
      <tr>
        <td nowrap class="FormLabell">
          <%=iRemitButton("update||"&rsLock("BUTTON")&"|addLockerAttendance()|"& EnableAdd)%>
        </td>
			
        <td colspan="3" class="FormLabell">&nbsp;</td>
      </tr>
        <%
		'ctr=ctr+1
'		rsLock.MOVENEXT
'		WEND
		
	%>
      
    </table>

  
  


</form>       





	<%
	response.write create_formfooter()
	%>

</html>

<script>

//function searchLockerData() 
//	{
//		
//		$("#attendance").submit();
//		// '#' take form id
//	
//	}
	function addLockerAttendance() 
	{
		attendance.action="addLockerAttendance.asp"
		attendance.submit()

	
	}
	
</script>
