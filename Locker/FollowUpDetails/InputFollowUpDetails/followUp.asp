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

lockerNo=strRequest("lockerNo")
lockerId= strRequest("lockerId")
'Response.Write(lockerId)

%>

<%
 				sql= "Select * from lockerDetails where lockerId="& singleQuote(lockerId) 
				set rsLock=server.CreateObject("Adodb.RecordSet")
				rsLock.open sql,con
				'lockerId =rsLock("lockerId")
				'Response.Write(sql)
				
				sql= "Select * from lockerFollowUp where lockerId="& singleQuote(lockerId) 
				set rsFollow=server.CreateObject("Adodb.RecordSet")
				rsFollow.open sql,con
				'Response.Write(rsFollow("remarks"))
				
				
	
	  %>
    <%
    	 	response.write create_formheader(defaultText &": "& strRequest("report_name"),"","90%") 
			
	%>
    
	
<form action="default.asp" method="post" name="followUp" id="followUp">

	
       
    <table cellSpacing=0 cellPadding=4 align=center bgColor=#ffffff
		border=0 width=100% class="colText">
         
   
      <tr>
        <td width="244" class="FormLabell">LOCKER HOLDER'S NAME</td>
        <td width="1046" class="FormLabell">
        <input type="text" name="lockerHolderName" id="lockerHolderName" size="35" maxlength="35" value="<%=rsLock("lockerHolderName")%>">
         <input type="hidden" name="lockerId" id="lockerId" size="35" maxlength="35" value="<%=rsLock("lockerId")%>"></td>
        <!--<td width="215" class="FormLabell">LOCKER  NO.</td>
        <td width="483" class="FormLabell"><input type="text" name="lockerNo" id="lockerNo" size="35" maxlength="35" value=""></td>-->
           
      </tr>
      <tr>
        <td nowrap class="FormLabell">ACCOUNT NUMBER</td>
        <td colspan="3" class="FormLabell"><input type="text" name="accountNumber" id="accountNumber" size="35" maxlength="35" value="<%=rsLock("accountNumber")%>"></td>
      <tr>
        <td nowrap class="FormLabell">FOLLOW UP MADE FOR</td>
        <td colspan="3" class="FormLabell"><select id="followUpMadeFor" name="followUpMadeFor">
          <%
                 'post = rsLock("lockerStatus")
                %>
          <option value ="">--Select--</option>
          <option value  ="pendingDocuments"<% if post="pendingDocuments" then Response.Write("selected='selected'") else Response.Write("") end if%>>PENDING DOCUMENTS</option>
          <option value ="insufficentAnnualCharge"<% if post="insufficentAnnualCharge" then Response.Write("selected='selected'") else Response.Write("") end if%>>INSUFFICIENT ANNUAL CHARGE</option>
          <option value ="insufficentLienAmount"<% if post="insufficentLienAmount" then Response.Write("selected='selected'") else Response.Write("") end if%>>INSUFFICIENT LIEN AMOUNT</option>
        <option value ="kycUpdate"<% if post="kycUpdate" then Response.Write("selected='selected'") else Response.Write("") end if%>>KYC UPDATE</option>
        </select></td>
        </tr>
      
     	<% 
			i=0
			while not rsFollow.eof 
			
			i=i+1
			%>
            
        <tr>
    
         <table id="followUp_<%=i%>"  cellSpacing=0 cellPadding=4 align=center bgColor=#ffffff
		border=0 width=100% class="colText" >
      
      <tr>
        <td nowrap class="FormLabell">FOLLOW UP </td>
       <!-- <td colspan="3" class="FormLabell"><input type="text" name="folloup" id="folloup" size="35" maxlength="35" value=""></td>-->
       </tr>
     
        
      <tr>
        <td nowrap class="FormLabell">FOLLOW UP MADE BY</td>
        <td colspan="3" class="FormLabell"><input type="text" name="followUpMadeBy_<%=i%>" id="followUpMadeBy_<%=i%>" size="35" maxlength="35" value="<%=rsFollow("followUpMadeBy")%>"></td>
       </tr>
       
      <tr>
        <td nowrap class="FormLabell">DATE (DD/MM/YY)</td>
        <td colspan="3" class="FormLabell"><input type="text" name="dateFollowUp_<%=i%>" id="dateFollowUp_<%=i%>" size="35" maxlength="35" value="<%=rsFollow("dateFollowUp")%>"></td>
      </tr>
      
      <tr>
        <td nowrap class="FormLabell">TIME : </td>
        <td colspan="3" class="FormLabell"><input type="text" name="timeFollowUp_<%=i%>" id="timeFollowUp_<%=i%>" size="35" maxlength="35" value="<%=rsFollow("timeFollowUp")%>"></td>
       </tr> 
       
       <tr>
        <td nowrap class="FormLabell">REMARKS</td>
        <td colspan="3" class="FormLabell">
        <textarea name="remarks_<%=i%>" cols="68" rows="5" id="remarks_<%=i%>" placeholder="Type Name Of Pending Document" 
               value="<%Response.Write(rsFollow("remarks"))%>"  ><%Response.Write(rsFollow("remarks"))%></textarea>
               
         	
        </td>
        
        </tr>
        
        <tr>
            <td colspan="6">
			
			<%=iRemitButtonGroupStart() %> 
             <%=iRemitButton("update||Update|updateFollowUpTable("&i&")")%>
         	<%=iRemitButtonGroupEnd() %>
            
            <input type="hidden" name="lockerFollowUpId_<%=i%>" id="lockerFollowUpId_<%=i%>" value="<%=rsFollow("lockerFollowUpId")%>">
            </td>
            </tr>
        </table>
        
        </tr>
        
         <%
		 rsFollow.movenext
		 wend
		 %>
        
        <tr>
        
        <table id="followUp1" style="display:none"  bgColor=#ffffff cellSpacing=0 cellPadding=4 align=center
			border=0 width=100% class=coltext  >
      
    	 <tr  align="center">
        <td colspan="6" align="center"><h4>FOLLOW UP </h4></td>
       <!-- <td colspan="3" class="FormLabell"><input type="text" name="folloup" id="folloup" size="35" maxlength="35" value=""></td>-->
       </tr>
     
        
      <tr>
        <td nowrap class="FormLabell">FOLLOW UP MADE BY</td>
        <td colspan="3" class="FormLabell"><input type="text" name="followUpMadeBy" id="followUpMadeBy" size="35" maxlength="35" value=""></td>
       </tr>
       
      <tr>
        <td nowrap class="FormLabell">DATE (DD/MM/YY)</td>
        <td colspan="3" class="FormLabell"><input type="text" name="dateFollowUp" id="dateFollowUp" size="35" maxlength="35" value=""></td>
      </tr>
      
      <tr>
        <td nowrap class="FormLabell">TIME : </td>
        <td colspan="3" class="FormLabell"><input type="text" name="timeFollowUp" id="timeFollowUp" size="35" maxlength="35" value=""></td>
       </tr> 
       
       <tr>
        <td nowrap class="FormLabell">REMARKS</td>
        <td colspan="3" class="FormLabell">
        <textarea name="remarks" cols="68" rows="5" id="remarks" placeholder="Type Name Of Pending Document" 
               value=""  ></textarea>
        </td>
        
        </tr>
        
        <tr>
            <td colspan="6">

			<%=iRemitButtonGroupStart() %> 
            <%=iRemitButton("new||Save|saveFollowUp()|"& EnableAdd)%>
            <%=iRemitButtonGroupEnd() %>
            <input type="hidden" name="spa_flag" value="<%=spa_flag%>">
            <input type="hidden" name="lockerFollowUpId" value="">
            
            </td>
            </tr>
        
        </table>
        
        </tr>
        
        <tr >
      	<td ><i class='fa fa-plus' onClick="addFollowUp()"> <i class='fa fa-user' onClick="addFollowUp()"></i> Add Follow Up </i></td>
      	</tr>
        
      
       
        
      
    </table>

  
  


</form>       
	<%
	response.write create_formfooter()
	%>

</html>

<script>

function updateFollowUpTable(i){
			
			followUp.spa_flag.value="U";
			followUp.lockerFollowUpId.value=document.getElementById("lockerFollowUpId_"+i).value;
			followUp.followUpMadeBy.value=document.getElementById("followUpMadeBy_"+i).value;
			followUp.dateFollowUp.value=document.getElementById("dateFollowUp_"+i).value;
			followUp.timeFollowUp.value=document.getElementById("timeFollowUp_"+i).value;
			followUp.remarks.value=document.getElementById("remarks_"+i).value;
			
			
			followUp.action="addLockerFollowUp.asp";
			followUp.submit()
}

function saveFollowUp(){
	//followUp.enctype="";
	followUp.spa_flag.value="I";
	followUp.action="addLockerFollowUp.asp";
	followUp.submit()
}

function addFollowUp(){
				//alert("da")
			$('#followUp1').show();
	
		}

function searchLockerData() 
	{
		
		$("#followUp").submit();
		// '#' take form id
	
	}
	function addLockerFollowUp() 
	{
		followUp.action="addLockerFollowUp.asp"
		followUp.submit()

	
	}
	
</script>
