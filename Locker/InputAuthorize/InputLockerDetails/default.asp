<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript charset=UTF-8" />

<html>
<head>
<script src="/js/jsFunc.js"></script>
<script type="text/javascript" src="common/ajax/ajaxfun.js"></script>

<style>
h4{
	text-align:center;
}

</style>

</head>
<body topmargin=0>


    <%
    	 	response.write create_formheader(defaultText &": "& strRequest("report_name"),"","90%") 
			
	%>
    
    
 
    
<form name="lockerDetails" id="lockerDetails" method="post" action="update.asp">      
        <table bgColor=#ffffff cellSpacing=0 cellPadding=4 align=center
			border=0 width=100% class=coltext>
			<%' if searchParam = "y" then %>
            <tr>
              <td width="15%">&nbsp;</td>
            </tr>
            <%' end if %>
            <tr>
              <Td align=center><%'=CONST_UNDER_CONSTRUCTION%></Td>
            </tr>

            <tr align="center"  >
           <Td colspan="6" >  <h4><%=getlabel("LOCKER PROFILE*")%> </h4></Td>
               
            </tr>

            <tr>
                  <Td align=LEFT><%=getlabel("LOCKER HOLDER'S NAME")%></Td>
                  <Td width="12%" ><input name="lockerHolderName"   type="text" id="lockerHolderName" value=""></Td>
                   <Td width="18%" align=center><%=getlabel("LOCKER NO.")%></Td>
                  <Td width="18%" ><input name="lockerNo"   type="text" id="lockerNo" value=""></Td>
                   <Td width="17%" align=RIGHT><%=getlabel("LOCKER SIZE")%></Td>
                   <Td colspan="2" >
                   		<select id="lockerSize" name="lockerSize">
                        <option value ="">--Select--</option>
                        <option value ="small">Small</option>
                         <option value ="medium">Medium</option>
                         <option value ="large">Large</option>
                       </select>
                       </Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("ACCOUNT NUMBER")%></Td>
              <Td width="12%" ><input name="accountNumber"   type="text" id="accountNumber" value=""></Td>
              <Td align=center><%=getlabel("ACCOUNT CLASS")%></Td>
              <Td width="18%" ><input name="accountClass"   type="text" id="accountClass" value=""></Td>
               <Td align=RIGHT><%=getlabel("WAIVER (IN %)")%></Td>
               <Td width="20%" ><input name="waiverIn"   type="text" id="waiverIn" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("ANNUAL CHARGE (IN NPR)")%></Td>
              <Td width="12%" ><input name="annualCharge"   type="text" id="annualCharge" value=""></Td>
              <Td align=center><%=getlabel("LIEN AMOUNT (IN NPR)")%></Td>
              <Td width="18%" ><input name="lienAmount"   type="text" id="lienAmount" value=""></Td>
               <Td align=RIGHT><%=getlabel("LOCKER OPEN DATE")%></Td>
               <Td width="20%" ><%=ct_datecontrol("lockerDetails","lockerOpenDate",lockerOpenDate,"")%></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("ANNUAL CHARGE TAKEN ON")%></Td>
              <Td width="12%" ><%=ct_datecontrol("lockerDetails","annualChargeTakeOn",annualChargeTakenOn,"")%></Td>
              <Td align=center><%=getlabel("NEXT RENEWAL DATE/EXPIRY")%></Td>
              <Td width="18%" ><%=ct_datecontrol("lockerDetails","nextRenewalDate",nextRenewalDate,"")%></Td>
              
            </tr>
            
             <tr align="center"  >
              <Td colspan="6" >&nbsp;</Td>
               
            </tr>
            
             <tr align="center"  >
              <Td colspan="6" ><h4><%=getlabel("PERSONAL INFORMATION OF LOCKER HOLDER *")%></h4></Td>
               
            </tr>
            
            <tr>
                  <Td align=LEFT><%=getlabel("DATE OF BIRTH")%></Td>
                  <Td width="12%" ><%=ct_datecontrol("lockerDetails","dateOfBirth",dateOfBirth,"")%></Td>
                   <Td width="18%" align=center><%=getlabel("MARITAL STATUS")%></Td>
                  <Td width="18%" >
                  
                  		<select id="maritalStatus" name="maritalStatus">
                        <option value ="">--Select--</option>
                        <option value ="married">Married</option>
                         <option value ="unmarried">Unmarried</option>
                       </select></Td>
                   <Td width="17%" align=RIGHT><%=getlabel("GENDER")%></Td>
                   <Td colspan="2" ><select id="gender" name="gender">
                        <option value ="">--Select--</option>
                        <option value ="male">Male</option>
                         <option value ="female">Female</option>
                         <option value ="other">Other</option>
                       </select></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("CITIZENSHIP NO.")%></Td>
              <Td width="12%" ><input name="citizenshipNo"   type="text" id="citizenshipNo" value=""></Td>
              <Td align=center><%=getlabel("CTZN ISSUE DATE")%></Td>
              <Td width="18%" ><%=ct_datecontrol("lockerDetails","ctznIssueDate",ctznIssueDate,"")%></Td>
               <Td align=RIGHT><%=getlabel("CTZN ISSUE PLACE")%></Td>
               <Td width="20%" ><input name="ctznIssuePlace"   type="text" id="ctznIssuePlace" value=""></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("CONTACT NUMBER")%></Td>
              <Td align=center></Td>
              <Td align=center><%=getlabel("RESIDENCE:")%></Td>
              <Td width="18%" ><input name="residence"   type="text" id="residence" value=""></Td>
               <Td align=RIGHT><%=getlabel("MOBILE: ")%></Td>
               <Td width="17%" ><input name="mobile"   type="text" id="mobile" value=""></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("PERMANENT ADDRESS")%></Td>
              <Td width="12%" ><input name="permanentAddress"   type="text" id="permanentAddress" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("TEMPORARY ADDRESS")%></Td>
              <Td width="12%" ><input name="temporaryAddress"   type="text" id="temporaryAddress" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("CO-LESSEE")%></Td>
              <Td width="12%" ><select id="colessee" name="colessee" onChange="colesseeHide(this)" >
                        <option value ="yes" >Yes</option>
                         <option value ="no" selected>No</option>
                         </select></Td>
            </tr>
           <!-- <div id="my" style="display: none;">Hello hidden content</div>
            <div id="my1" style="display: none;">-->
         
          
              <Td colspan="6" >&nbsp;</Td>
               
            </tr>
            	
                
                <table id="colesseeTable" style="display:none" bgColor=#ffffff cellSpacing=0 cellPadding=4 align=center 
			border=0 width=100% class=coltext>
                
                <tr align="center"  >
              <Td colspan="6" ><h4><%=getlabel("CO-LESSEE PROFILE *")%></h4></Td>
               
            </tr>
              
             <tr >
              <Td align=center><%=getlabel("NAME OF  CO-LESSEE")%></Td>
              <Td width="12%" ><input name="nameOfColessee"   type="text" id="nameOfColessee" value=""></Td>
              <Td align=center><%=getlabel("GENDER")%></Td>
              <Td width="18%" ><select id="genderColessee" name="genderColessee">
                        <option value ="">--Select--</option>
                        <option value ="male">Male</option>
                         <option value ="female">Female</option>
                         <option value ="other">Other</option>
                       </select></Td>
              <Td align=center><%=getlabel("MARITAL STATUS")%></Td>
              <Td width="20%" ><select id="maritalStatusColessee" name="maritalStatusColessee">
                        <option value ="">--Select--</option>
                        <option value ="married">Married</option>
                         <option value ="unmarried">Unmarried</option>
                       </select></Td>
            </tr>
            <!--</div>-->
            <tr>
              <Td align=center><%=getlabel("DATE OF BIRTH")%></Td>
              <Td width="12%" ><%=ct_datecontrol("lockerDetails","dateOfBirthColessee",dateOfBirthColessee,"")%></Td>
            </tr>
            
            <tr>
            
            <Td align=center><%=getlabel("CONTACT NUMBER")%></Td>
            </tr>
            <tr>
                           
              <Td align=center><%=getlabel("RESIDENCE NUMBER:")%></Td>
              <Td width="18%" ><input name="residenceNumberColessee"   type="text" id="residenceNumberColessee" value=""></Td>
               <Td align=RIGHT><%=getlabel("MOBILE: ")%></Td>
               <Td width="17%" ><input name="mobileNumberColessee"   type="text" id="mobileNumberColessee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("CITIZENSHIP NO.")%></Td>
              <Td width="12%" ><input name="citizenshipNoColessee"   type="text" id="citizenshipNoColessee" value=""></Td>
              <Td align=center><%=getlabel("CTZN ISSUE DATE")%></Td>
              <Td width="18%" ><%=ct_datecontrol("lockerDetails","citizenIssueDateColessee",citizenIssueDateColessee,"")%></Td>
              <Td align=RIGHT><%=getlabel("CTZN ISSUE PLACE")%></Td>
              <Td width="20%" ><input name="citizenIsssuPlaceColessee"   type="text" id="citizenIsssuPlaceColessee" value=""></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="fatherNameColessee"   type="text" id="fatherNameColessee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("GRAND FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="grandFatherNameColessee"   type="text" id="grandFatherNameColessee" value=""></Td>
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("MOTHER'S NAME")%></Td>
              <Td width="12%" ><input name="motherNameColessee"   type="text" id="motherNameColessee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("SPOUSE'S NAME")%></Td>
              <Td width="12%" ><input name="spouseNameColessee"   type="text" id="spouseNameColessee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("PERMANENT ADDRESS")%></Td>
              <Td width="12%" ><input name="permanentAddressColessee"   type="text" id="permanentAddressColessee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("TEMPORARY ADDRESS")%></Td>
              <Td width="12%" ><input name="temporaryAddressColessee"   type="text" id="temporaryAddressColessee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("OCCUPATION")%></Td>
              <Td width="12%" ><input name="occupationColessee"   type="text" id="occupationColessee" value=""></Td>
              <Td align=center><%=getlabel("NAME OF ORGANIZATION")%></Td>
              <Td width="18%" ><input name="nameOfOrganizationColessee"   type="text" id="nameOfOrganizationColessee" value=""></Td>
               <Td align=RIGHT><%=getlabel("ANNUAL INCOME")%></Td>
               <Td width="20%" ><input name="annualIncomeColessee"   type="text" id="annualIncomeColessee" value=""></Td>
               <Td align=RIGHT><%=getlabel("RISK PROFILE")%></Td>
                <Td colspan="2" ><select id="riskProfile" name="riskProfile">
                        <option value ="">--Select--</option>
                        <option value ="high">High Risk</option>
                         <option value ="medium">Medium Risk</option>
                         <option value ="low">Low Risk</option>
                       </select></Td>
            </tr>
           
                
                </table>
                
            
            
            
            <table  bgColor=#ffffff cellSpacing=0 cellPadding=4 align=center
			border=0 width=100% class=coltext>
            
             <tr align="center"  >
              <Td colspan="6" ><h4><%=getlabel("DETAILS OF NOMINEE *")%></h4></Td>
               
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("NAME OF NOMINEE")%></Td>
              <Td width="12%" ><input name="nameOfNominee"   type="text" id="nameOfNominee" value=""></Td>
              <Td align=center><%=getlabel("DATE OF BIRTH")%></Td>
              <Td width="18%" ><%=ct_datecontrol("lockerDetails","dateOfBirthNominee",dateOfBirthNominee,"")
					%></Td>
              <Td align=center><%=getlabel("GENDER")%></Td>
              <Td width="20%" ><select id="genderNominee" name="genderNominee">
                        <option value ="">--Select--</option>
                        <option value ="male">Male</option>
                         <option value ="female">Female</option>
                         <option value ="other">Other</option>
                       </select></Td>
              
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("CITIZENSHIP NO.")%></Td>
              <Td width="12%" ><input name="ctznNoNominee"   type="text" id="ctznNoNominee" value=""></Td>
              <Td align=center><%=getlabel("CTZN ISSUE DATE")%></Td>
              <Td width="18%" ><% =ct_datecontrol("lockerDetails","ctznIssueDateNominee",ctznIssueDateNominee,"")
					%>	</Td>
               <Td align=RIGHT><%=getlabel("CTZN ISSUE PLACE")%></Td>
               <Td width="20%" ><input name="ctznIssuePlaceNominee"   type="text" id="ctznIssuePlaceNominee" value=""></Td>
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("RELATIONSHIP WITH LOCKER HOLDER")%></Td>
              <Td width="12%" ><input name="relationshipNominee"   type="text" id="relationshipNominee" value=""></Td>
              <Td align=center><%=getlabel("CONTACT NO.")%></Td>
              <Td width="18%" ><input name="contactNoNominee"   type="text" id="contactNoNominee" value=""></Td>
               
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="fatherNameNominee"   type="text" id="fatherNameNominee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("GRAND FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="grandFatherNameNominee"   type="text" id="grandFatherNameNominee" value=""></Td>
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("MOTHER'S NAME")%></Td>
              <Td width="12%" ><input name="motherNameNominee"   type="text" id="motherNameNominee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("SPOUSE'S NAME")%></Td>
              <Td width="12%" ><input name="spouseNameNominee"   type="text" id="spouseNameNominee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("PERMANENT ADDRESS")%></Td>
              <Td width="12%" ><input name="permanentAddressNominee"   type="text" id="permanentAddressNominee" value=""></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("TEMPORARY ADDRESS")%></Td>
              <Td width="12%" ><input name="temporaryAddressNominee"   type="text" id="temporaryAddressNominee" value=""></Td>
            </tr>
            
            
            
           <!-- <tr align="center"  >
              <Td colspan="6" >&nbsp;</Td>
               
            </tr>
            
            
             <tr align="center"  >
              <Td colspan="6" >Upload Document</Td>
               
            </tr>-->
            
            <tr align="center"  >
              <Td colspan="6" >&nbsp;</Td>
               
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("KEY HANDER OVER BY (STAFF NAME)")%></Td>
              <Td width="12%" ><input name="keyHandler"   type="text" id="keyHandler" value=""></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("PENDING DOCUMENTS ?")%></Td>
              <Td width="12%" >
              <select id="pendingDocument" name="pendingDocument" onChange="pending(this)" >
              
                        <option value ="yes" >Yes</option>
                         <option value ="no" selected>No</option>
                         </select>
             </Td>
            </tr>
             
           	<tr  id="namePendingDocument" style="display:none">
              <Td align=center><%=getlabel("NAMES OF PENDING DOCUMENTS")%></Td>
              <Td width="12%" ><textarea name="namePendingDocument" cols="40" rows="5" id="namePendingDocument" placeholder="Type Name Of Pending Document" ></textarea></Td>
            </tr>
           
         
            <tr>
            <td colspan="6">

			<%=iRemitButtonGroupStart() %> 
            <%=iRemitButton("new||Save|addForm()|"& EnableAdd)%>
           <%'=iRemitButton("update||Update|updateForm()|"& EnableUpdate)%>
            <%'=iRemitButton("delete||Delete|deleteForm()|"& EnableDelete)%>
            <%'=iRemitButton("audit||Authorize|authForm()|"& EnableAuth)%>
            <%=iRemitButtonGroupEnd() %>
            
            </td>
            </tr>
            </table>
            
            
            
            
            
</table>

<%
	response.write create_formfooter()
	%>
  
  
 
</form>

<script>

function colesseeHide()
 {
  a=$('#colessee :selected').val();
  if(a=='no')
  
  {
   $('#colesseeTable').hide();
  }
  else
  {
   $('#colesseeTable').show();
  }
  
 }



function pending(select)
{

	b=lockerDetails.pendingDocument.value;
	
		if(b=='no')
	{
		
		$("#namePendingDocument").hide();
		 
	}
	else
	{
		$("#namePendingDocument").show();
	}
} 


	

	function addForm ()
		{
			$("#lockerDetails").submit();

		
		}
		
		
		

</script>