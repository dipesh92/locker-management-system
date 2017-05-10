<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta http-equiv="content-style-type" content="text/css; charset=UTF-8" />
<meta http-equiv="Content-Script-Type" content="text/javascript charset=UTF-8" />

<html>
<head>
<script src="/js/jsFunc.js"></script>
<script type="text/javascript" src="../../Attendance/InputAttendanceDetails/common/ajax/ajaxfun.js"></script>

<style>
h4{
	text-align:center;
}

</style>

</head>
<body topmargin=0>

			<%
        
        
			set Con=Server.CreateObject("Adodb.Connection")
			Con.open getConn
			
			doc_type		= trim(strRequest("doc_type"))
			
			'ename=session("user")
			lockerId= strRequest("lockerId")
			set rsLock = server.CreateObject ("ADODB.Recordset")
			lockerId = request.QueryString("lockerId")
			
			sql="select * from lockerDetails where lockerId= "& singleQuote(lockerId)
			'Response.Write(sql)
'			Response.End()
			rsLock.open sql,Con
			lockerId = rsLock ("lockerId")
			
			set rsCol = server.CreateObject ("ADODB.Recordset")
			lockerId = request.QueryString("lockerId")
			
			sql="select * from colesseeDetails where lockerId= "& singleQuote(lockerId)
			'Response.Write(sql)
'			Response.End()
			rsCol.open sql,Con
			'Response.Write(rsCol("nameOfColessee"))
			'Response.End()
			
			
        
        
        %>


    <%
    	 	response.write create_formheader(defaultText &": "& strRequest("report_name"),"","90%") 
	%>
    
   		 <% IF rsLock.EOF Then%>
					<tr>
						<td colspan="5"><strong style="color:red;font-size:12px">No Record Found</strong></td>
					</tr>
				<%END IF%> 
			<%
                
                ctr=1
                WHILE NOT rsLock.EOF
				
            %>
 
    
<form name="updateLocker" id="updateLocker" method="post" action="updateLockerData.asp?lockerId=<% response.Write(rsLock("lockerId"))%>" 
enctype="multipart/form-data">      
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
                  <Td width="12%" ><input name="lockerHolderName"   type="text" id="lockerHolderName"  value="<% response.Write(rsLock("lockerHolderName"))%>"></Td>
                   <Td width="18%" align=center><%=getlabel("LOCKER NO.")%></Td>
                  <Td width="18%" ><input name="lockerNo"   type="text" id="lockerNo" value="<% response.Write(rsLock("lockerNo"))%>"></Td>
                   <Td width="17%" align=RIGHT><%=getlabel("LOCKER SIZE")%></Td>
                   <Td colspan="2" >
							<%
                                post=rsLock("lockerSize")		
                            %>
                   		<select id="lockerSize" name="lockerSize">
                        <option value ="">--Select--</option>
                        <option value  ="small"<% if post="small" then Response.Write("selected='selected'") else Response.Write("") end if%>>Small</option>
                         <option value ="medium"<% if post="medium" then Response.Write("selected='selected'") else Response.Write("") end if%>>Medium</option>
                         <option value ="large"<% if post="large" then Response.Write("selected='selected'") else Response.Write("") end if%>>Large</option>
                       </select>
                       </Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("ACCOUNT NUMBER")%></Td>
              <Td width="12%" ><input name="accountNumber"   type="text" id="accountNumber" value="<% response.Write(rsLock("accountNumber"))%>"></Td>
              <Td align=center><%=getlabel("ACCOUNT CLASS")%></Td>
              <Td width="18%" ><input name="accountClass"   type="text" id="accountClass" value="<% response.Write(rsLock("accountClass"))%>"></Td>
               <Td align=RIGHT><%=getlabel("WAIVER (IN %)")%></Td>
               <Td width="20%" ><input name="waiverIn"   type="text" id="waiverIn" value="<% response.Write(rsLock("waiver"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("ANNUAL CHARGE (IN NPR)")%></Td>
              <Td width="12%" ><input name="annualCharge"   type="text" id="annualCharge" value="<% response.Write(rsLock("annualCharge"))%>"></Td>
              <Td align=center><%=getlabel("LIEN AMOUNT (IN NPR)")%></Td>
              <Td width="18%" ><input name="lienAmount"   type="text" id="lienAmount" value="<% response.Write(rsLock("lienAmount"))%>"></Td>
               <Td align=RIGHT><%=getlabel("LOCKER OPEN DATE")%></Td>
               <Td width="20%" >
			   <%
			   if isnull(rsLock("lockerOpenDate"))=false AND rsLock("lockerOpenDate")<>"" THEN
			   lockerOpenDate = cdate(rsLock("lockerOpenDate"))
			   END IF
			   %><%=ct_datecontrol("updateLocker","lockerOpenDate",lockerOpenDate,"")%></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("ANNUAL CHARGE TAKEN ON")%></Td>
              <Td width="12%" >
              <%
			   if isnull(rsLock("annualChargeTakeOn"))=false AND rsLock("annualChargeTakeOn")<>"" THEN
			   annualChargeTakeOn = cdate(rsLock("annualChargeTakeOn"))
			   END IF
			   %><%=ct_datecontrol("updateLocker","annualChargeTakeOn",annualChargeTakeOn,"")%>
             </Td>
              <Td align=center><%=getlabel("NEXT RENEWAL DATE/EXPIRY")%></Td>
              <Td width="18%" >
              <%
			   if isnull(rsLock("nextRenewalDate"))=false AND rsLock("nextRenewalDate")<>"" THEN
			   nextRenewalDate = cdate(rsLock("nextRenewalDate"))
			   END IF
			   %><%=ct_datecontrol("updateLocker","nextRenewalDate",nextRenewalDate,"")%>
              </Td>
              <Td align=center><%=getlabel("Locker Status")%></Td>
               <Td width="18%" >
               <%
                                post=rsLock("lockerStatus")		
                            %>
                   		<select id="lockerStatus" name="lockerStatus">
                        <option value ="">--Select--</option>
                        <option value  ="freeze"<% if post="freeze" then Response.Write("selected='selected'") else Response.Write("") end if%>>Locker Freezed</option>
                         <option value ="closed"<% if post="closed" then Response.Write("selected='selected'") else Response.Write("") end if%>>Locker Closed</option>
                         
                       </select>
              
                </Td>
              
            </tr>
            
             <tr align="center"  >
              <Td colspan="6" >&nbsp;</Td>
               
            </tr>
            
             <tr align="center"  >
              <Td colspan="6" ><h4><%=getlabel("PERSONAL INFORMATION OF LOCKER HOLDER *")%></h4></Td>
               
            </tr>
            
            
            
            
            
            <tr>
                  <Td align=LEFT><%=getlabel("DATE OF BIRTH")%></Td>
                  <Td width="12%" >
                   <%
				   if isnull(rsLock("dateOfBirth"))=false AND rsLock("dateOfBirth")<>"" THEN
				   dateOfBirth = cdate(rsLock("dateOfBirth"))
				   END IF
				   %><%=ct_datecontrol("updateLocker","dateOfBirth",dateOfBirth,"")%>
                  </Td>
                   <Td width="18%" align=center><%=getlabel("MARITAL STATUS")%></Td>
                  <Td width="18%" >
                  			<%
                                post=rsLock("maritalStatus")		
                            %>
                  		<select id="maritalStatus" name="maritalStatus">
                        <option value ="">--Select--</option>
                        <option value ="married" <% if post="married" then Response.Write("selected='selected'") else Response.Write("") end if%>>Married</option>
                         <option value ="unmarried" <% if post="unmarried" then Response.Write("selected='selected'") else Response.Write("") end if%>>Unmarried</option>
                       </select></Td>
                   <Td width="17%" align=RIGHT><%=getlabel("GENDER")%></Td>
                   <Td colspan="2" ><select id="gender" name="gender">
                   			<%
                                post=rsLock("gender")		
                            %>
                        <option value ="">--Select--</option>
                        <option value ="male" <% if post="male" then Response.Write("selected='selected'") else Response.Write("") end if%>>Male</option>
                         <option value ="female"  <% if post="female" then Response.Write("selected='selected'") else Response.Write("") end if%>>Female</option>
                         <option value ="other"  <% if post="other" then Response.Write("selected='selected'") else Response.Write("") end if%>>Other</option>
                       </select></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("CITIZENSHIP NO.")%></Td>
              <Td width="12%" ><input name="citizenshipNo"   type="text" id="citizenshipNo" value="<% response.Write(rsLock("citizenshipNo"))%>"></Td>
              <Td align=center><%=getlabel("CTZN ISSUE DATE")%></Td>
              <Td width="18%" >
               <%
				   if isnull(rsLock("ctznIssueDate"))=false AND rsLock("ctznIssueDate")<>"" THEN
				   ctznIssueDate = cdate(rsLock("ctznIssueDate"))
				   END IF
				   %><%=ct_datecontrol("updateLocker","ctznIssueDate",ctznIssueDate,"")%>
              </Td>
               <Td align=RIGHT><%=getlabel("CTZN ISSUE PLACE")%></Td>
               <Td width="20%" ><input name="ctznIssuePlace"   type="text" id="ctznIssuePlace" value="<% response.Write(rsLock("ctznIssuePlace"))%>"></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("CONTACT NUMBER")%></Td>
              <Td align=center></Td>
              <Td align=center><%=getlabel("RESIDENCE:")%></Td>
              <Td width="18%" ><input name="residence"   type="text" id="residence" value="<% response.Write(rsLock("residenceNo"))%>"></Td>
               <Td align=RIGHT><%=getlabel("MOBILE: ")%></Td>
               <Td width="20%" ><input name="mobile"   type="text" id="mobile" value="<% response.Write(rsLock("mobileNo"))%>"></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("PERMANENT ADDRESS")%></Td>
              <Td width="12%" ><input name="permanentAddress"   type="text" id="permanentAddress" value="<% response.Write(rsLock("permanentAddress"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("TEMPORARY ADDRESS")%></Td>
              <Td width="12%" ><input name="temporaryAddress"   type="text" id="temporaryAddress" value="<% response.Write(rsLock("temporaryAddress"))%>"></Td>
            </tr>
            
           <!-- <tr>
              <Td align=center><%'=getlabel("CO-LESSEE")%></Td>
             				 <%
                                'post=rsLock("colessee")		
                            %>
              <Td width="12%" ><select id="colessee" name="colessee">
                        <option value ="yes"  <% 'if post="yes" then Response.Write("selected='selected'") else Response.Write("") end if%>>Yes</option>
                         <option value ="no" <% 'if post="no" then Response.Write("selected='selected'") else Response.Write("") end if%>>No</option>
                        
                       </select></Td>
            </tr>-->
            
            <% 
			i=0
			while not rsCol.eof 
			colesseeId = rsCol("colesseeId")
			i=i+1
			%>
           
           <tr>
           
            
            <table bgColor=#ffffff cellSpacing=0 cellPadding=4 align=center
			border=0 width=100% class=coltext id="colesseeTable_<%=i%>" >
            
            <tr align="center"  >
              <Td colspan="6" ><h4><%=getlabel("CO-LESSEE PROFILE *")%></h4></Td>
               
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("NAME OF  CO-LESSEE")%></Td>
              <Td width="12%" ><input name="nameOfColessee_<%=i%>"   type="text" id="nameOfColessee_<%=i%>" value="<% response.Write(rsCol("nameOfColessee"))%>"></Td>
              <Td align=center><%=getlabel("GENDER")%></Td>
              <Td width="18%" >
              				<%
                                post=rsCol("genderColessee")		
                            %>
              			<select id="genderColessee_<%=i%>" name="genderColessee_<%=i%>">
                        <option value ="">--Select--</option>
                        <option value ="male" <% if post="male" then Response.Write("selected='selected'") else Response.Write("") end if%>>Male</option>
                         <option value ="female" <% if post="female" then Response.Write("selected='selected'") else Response.Write("") end if%>>Female</option>
                         <option value ="other"  <% if post="other" then Response.Write("selected='selected'") else Response.Write("") end if%>>Other</option>
                       </select></Td>
              <Td align=center><%=getlabel("MARITAL STATUS")%></Td>
              <Td width="20%" >
              			<%
                                post=rsCol("maritalStatusColessee")		
                            %>
              			<select id="maritalStatusColessee_<%=i%>" name="maritalStatusColessee_<%=i%>">
                        <option value ="">--Select--</option>
                        <option value ="married" <% if post="married" then Response.Write("selected='selected'") else Response.Write("") end if%>>Married</option>
                         <option value ="unmarried" <% if post="unmarried" then Response.Write("selected='selected'") else Response.Write("") end if%>>Unmarried</option>
                       </select></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("DATE OF BIRTH")%></Td>
              <Td width="12%" >
              <%
				   if isnull(rsCol("dateOfBirthColessee"))=false AND rsCol("dateOfBirthColessee")<>"" THEN
				   dateOfBirthColessee = cdate(rsCol("dateOfBirthColessee"))
				   END IF
				   %><%=ct_datecontrol("updateLocker","dateOfBirthColessee_"&i,dateOfBirthColessee,"")%>
              </Td>
            </tr>
            
            <tr>
            
            <Td align=center><%=getlabel("CONTACT NUMBER")%></Td>
            </tr>
            <tr>
                           
              <Td align=center><%=getlabel("RESIDENCE:")%></Td>
              <Td width="18%" ><input name="residenceNumberColessee_<%=i%>"   type="text" id="residenceNumberColessee_<%=i%>" value="<% response.Write(rsCol("residenceNumberColessee"))%>"></Td>
               <Td align=RIGHT><%=getlabel("MOBILE: ")%></Td>
               <Td width="17%" ><input name="mobileNumberColessee_<%=i%>"   type="text" id="mobileNumberColessee_<%=i%>" value="<% response.Write(rsCol("mobileNumberColessee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("CITIZENSHIP NO.")%></Td>
              <Td width="12%" ><input name="citizenshipNoColessee_<%=i%>"   type="text" id="citizenshipNoColessee_<%=i%>" value="<% response.Write(rsCol("citizenshipNoColessee"))%>"></Td>
              <Td align=center><%=getlabel("CTZN ISSUE DATE")%></Td>
              <Td width="18%" >
              		<%
				   if isnull(rsCol("citizenIssueDateColessee"))=false AND rsCol("citizenIssueDateColessee")<>"" THEN
				   citizenIssueDateColessee = cdate(rsCol("citizenIssueDateColessee"))
				   END IF
				   %><%=ct_datecontrol("updateLocker","citizenIssueDateColessee_"&i,citizenIssueDateColessee,"")%>
                   
             </Td>
              <Td align=RIGHT><%=getlabel("CTZN ISSUE PLACE")%></Td>
              <Td width="20%" ><input name="citizenIsssuPlaceColessee_<%=i%>"   type="text" id="citizenIsssuPlaceColessee_<%=i%>" value="<% response.Write(rsCol("citizenIsssuPlaceColessee"))%>"></Td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="fatherNameColessee_<%=i%>"   type="text" id="fatherNameColessee_<%=i%>" value="<% response.Write(rsCol("fatherNameColessee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("GRAND FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="grandFatherNameColessee_<%=i%>"   type="text" id="grandFatherNameColessee_<%=i%>" value="<% response.Write(rsCol("grandFatherNameColessee"))%>"></Td>
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("MOTHER'S NAME")%></Td>
              <Td width="12%" ><input name="motherNameColessee_<%=i%>"   type="text" id="motherNameColessee_<%=i%>" value="<% response.Write(rsCol("motherNameColessee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("SPOUSE'S NAME")%></Td>
              <Td width="12%" ><input name="spouseNameColessee_<%=i%>"   type="text" id="spouseNameColessee_<%=i%>" value="<% response.Write(rsCol("spouseNameColessee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("PERMANENT ADDRESS")%></Td>
              <Td width="12%" ><input name="permanentAddressColessee_<%=i%>"   type="text" id="permanentAddressColessee_<%=i%>" value="<% response.Write(rsCol("permanentAddressColessee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("TEMPORARY ADDRESS")%></Td>
              <Td width="12%" ><input name="temporaryAddressColessee_<%=i%>"   type="text" id="temporaryAddressColessee_<%=i%>" value="<% response.Write(rsCol("temporaryAddressColessee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("OCCUPATION")%></Td>
              <Td width="12%" ><input name="occupationColessee_<%=i%>"   type="text" id="occupationColessee_<%=i%>" value="<% response.Write(rsCol("occupationColessee"))%>"></Td>
              <Td align=center><%=getlabel("NAME OF ORGANIZATION")%></Td>
              <Td width="18%" ><input name="nameOfOrganizationColessee_<%=i%>"   type="text" id="nameOfOrganizationColessee_<%=i%>" value="<% response.Write(rsCol("nameOfOrganizationColessee"))%>"></Td>
               <Td align=RIGHT><%=getlabel("ANNUAL INCOME")%></Td>
               <Td width="20%" ><input name="annualIncomeColessee_<%=i%>"   type="text" id="annualIncomeColessee_<%=i%>" value="<% response.Write(rsCol("annualIncomeColessee"))%>"></Td>
           		<Td align=RIGHT><%=getlabel("RISK PROFILE")%></Td>
                <Td colspan="2" >
               				<%
                                post=rsCol("riskProfile")		
                            %>
              			<select id="riskProfile_<%=i%>" name="riskProfile_<%=i%>">
                        <option value ="">--Select--</option>
                        <option value ="high" <% if post="high" then Response.Write("selected='selected'") else Response.Write("") end if%>>High Risk</option>
                         <option value ="medium" <% if post="medium" then Response.Write("selected='selected'") else Response.Write("") end if%>>Medium Risk</option>
                       	 <option value ="low" <% if post="low" then Response.Write("selected='selected'") else Response.Write("") end if%>>Low Risk</option>
                       </select></Td>
                        
                
            </tr>
             <tr>
            <td colspan="6">
			
			<%=iRemitButtonGroupStart() %> 
            <%'=iRemitButton("new||Save|addForm()|"& EnableAdd)%>
            
            <%=iRemitButton("update||Update|updateColesseeTable("&i&")")%>
            <%'=iRemitButton("delete||Delete|deleteForm()|"& EnableDelete)%>
            <%'=iRemitButton("audit||Authorize|authForm()|"& EnableAuth)%>
            <%=iRemitButtonGroupEnd() %>
            
            <input type="hidden" name="colesseeId_<%=i%>" id="colesseeId_<%=i%>" value="<%=rsCol("colesseeId")%>">
            </td>
            </tr>
           
            
            </table>
            
           
           </tr> 
           
            <%
		 rsCol.movenext
		 wend
		 %>
           
            <tr>
            <td colspan="4" class=FormLabel valign="top">
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
            <tr>
            <td colspan="6">

			<%=iRemitButtonGroupStart() %> 
            <%=iRemitButton("new||Save|addColesseeTable()|"& EnableAdd)%>
            <%'=iRemitButton("update||Update|updateForm()|"& EnableUpdate)%>
            <%'=iRemitButton("delete||Delete|deleteForm()|"& EnableDelete)%>
            <%'=iRemitButton("audit||Authorize|authForm()|"& EnableAuth)%>
            <%=iRemitButtonGroupEnd() %>
            <input type="hidden" name="spa_flag" value="<%=spa_flag%>">
            <input type="hidden" name="lockerId" value="<%=lockerId%>">
            <input type="hidden" name="colesseeId" value="">
            
            </td>
            </tr>
             
          
                
                </table>
            
            </td>
            </tr>
            
            
            <tr >
      	<td ><i class='fa fa-plus' onClick="showAdditional()"> <i class='fa fa-user' onClick="showAdditional()"></i> Add Other Colessee </i></td>
      		</tr>
        
            <tr>
            
            <td>
            <table  bgColor=#ffffff cellSpacing=0 cellPadding=4 align=center
			border=0 width=100% class=coltext>
            
             <tr align="center"  >
              <Td colspan="6" ><h4><%=getlabel("DETAILS OF NOMINEE *")%></h4></Td>
               
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("NAME OF NOMINEE")%></Td>
              <Td width="12%" ><input name="nameOfNominee"   type="text" id="nameOfNominee" value="<% response.Write(rsLock("nameOfNominee"))%>"></Td>
              <Td align=center><%=getlabel("DATE OF BIRTH")%></Td>
              <Td width="18%" >
              <%
				   if isnull(rsLock("dateOfBirthNominee"))=false AND rsLock("dateOfBirthNominee")<>"" THEN
				   dateOfBirthNominee = cdate(rsLock("dateOfBirthNominee"))
				   END IF
				   %><%=ct_datecontrol("updateLocker","dateOfBirthNominee",dateOfBirthNominee,"")%>
             </Td>
              <Td align=center><%=getlabel("GENDER")%></Td>
              <Td width="20%" >
              				<%
                                post=rsLock("genderNominee")		
                            %>
                <select id="genderNominee" name="genderNominee">
                        <option value ="">--Select--</option>
                        <option value ="male"  <% if post="male" then Response.Write("selected='selected'") else Response.Write("") end if%>>Male</option>
                         <option value ="female"  <% if post="female" then Response.Write("selected='selected'") else Response.Write("") end if%>>Female</option>
                         <option value ="other" <% if post="other" then Response.Write("selected='selected'") else Response.Write("") end if%>>Other</option>
                       </select></Td>
              
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("CITIZENSHIP NO.")%></Td>
              <Td width="12%" ><input name="ctznNoNominee"   type="text" id="ctznNoNominee" value="<% response.Write(rsLock("citizenshipNoNominee"))%>"></Td>
              <Td align=center><%=getlabel("CTZN ISSUE DATE")%></Td>
              <Td width="18%" >
              <%
				   if isnull(rsLock("ctznIssueDateNominee"))=false AND rsLock("ctznIssueDateNominee")<>"" THEN
				   ctznIssueDateNominee = cdate(rsLock("ctznIssueDateNominee"))
				   END IF
				   %><%=ct_datecontrol("updateLocker","ctznIssueDateNominee",ctznIssueDateNominee,"")%>
              
             </Td>
               <Td align=RIGHT><%=getlabel("CTZN ISSUE PLACE")%></Td>
               <Td width="20%" ><input name="ctznIssuePlaceNominee"   type="text" id="ctznIssuePlaceNominee" value="<% response.Write(rsLock("ctznIssuePlaceNominee"))%>"></Td>
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("RELATIONSHIP WITH LOCKER HOLDER")%></Td>
              <Td width="12%" ><input name="relationshipNominee"   type="text" id="relationshipNominee" value="<% response.Write(rsLock("relationshipWithLockerHolder"))%>"></Td>
              <Td align=center><%=getlabel("CONTACT NO.")%></Td>
              <Td width="18%" ><input name="contactNoNominee"   type="text" id="contactNoNominee" value="<% response.Write(rsLock("contactNoNominee"))%>"></Td>
               
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="fatherNameNominee"   type="text" id="fatherNameNominee" value="<% response.Write(rsLock("fatherNameNominee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("GRAND FATHER'S NAME")%></Td>
              <Td width="12%" ><input name="grandFatherNameNominee"   type="text" id="grandFatherNameNominee" value="<% response.Write(rsLock("grandFatherNameNominee"))%>"></Td>
            </tr>
            
             <tr>
              <Td align=center><%=getlabel("MOTHER'S NAME")%></Td>
              <Td width="12%" ><input name="motherNameNominee"   type="text" id="motherNameNominee" value="<% response.Write(rsLock("motherNameNominee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("SPOUSE'S NAME")%></Td>
              <Td width="12%" ><input name="spouseNameNominee"   type="text" id="spouseNameNominee" value="<% response.Write(rsLock("spouseNameNominee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("PERMANENT ADDRESS")%></Td>
              <Td width="12%" ><input name="permanentAddressNominee"   type="text" id="permanentAddressNominee" value="<% response.Write(rsLock("permanentAddressNominee"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("TEMPORARY ADDRESS")%></Td>
              <Td width="12%" ><input name="temporaryAddressNominee"   type="text" id="temporaryAddressNominee" value="<% response.Write(rsLock("temporaryAddressNominee"))%>"></Td>
            </tr>
            
            <tr align="center"  >
              <Td colspan="6" >&nbsp;</Td>
               
            </tr>
            
            
             <tr align="center"  >
              <Td colspan="1" >Upload Document</Td>
             	 <td><input name="docUpload" id="docUpload" value="" type="file" size="40" tabindex="3" ></td>
            </tr>
            
            
            <tr>
              <Td align=center><%=getlabel("KEY HANDER OVER BY (STAFF NAME)")%></Td>
              <Td width="12%" ><input name="keyHandler"   type="text" id="keyHandler" value="<% response.Write(rsLock("keyHanderOverBy"))%>"></Td>
            </tr>
            
            <tr>
              <Td align=center><%=getlabel("PENDING DOCUMENTS ?")%></Td>
             				 <%
                                post=rsLock("pendingDocument")		
                            %>
              <Td width="12%" ><select id="pendingDocument" name="pendingDocument" onChange="pending(this)" >
                        <option value ="yes"  <% if post="yes" then Response.Write("selected='selected'") else Response.Write("") end if%>>Yes</option>
                         <option value ="no" <% if post="no" then Response.Write("selected='selected'") else Response.Write("") end if%>>No</option>
                        
                       </select></Td>
            </tr>
            
            </tr>
             
           	<tr  id="namePendingDocument">
              <Td align=center><%=getlabel("NAMES OF PENDING DOCUMENTS")%></Td>
              <Td width="12%" ><textarea name="namePendingDocument" cols="40" rows="5" id="namePendingDocument" placeholder="Type Name Of Pending Document" 
               value="<% response.Write(rsLock("nameOfPendingDocuments"))%>"  ><% response.Write(rsLock("nameOfPendingDocuments"))%></textarea></Td>
            </tr>
            
            
            
            <tr>
            <td colspan="6">
			
			<%=iRemitButtonGroupStart() %> 
            <%'=iRemitButton("new||Add|addForm()|"& EnableAdd)%>
            <%=iRemitButton("update||Update|updateForm()|"& EnableUpdate)%>
            <%'=iRemitButton("delete||Delete|deleteForm()|"& EnableDelete)%>
            <%'=iRemitButton("audit||Authorize|authForm()|"& EnableAuth)%>
            <%=iRemitButtonGroupEnd() %>
            
            </td>
            </tr>
            
            </table>
            </td>
            </tr>
        
</table>

<%
	response.write create_formfooter()
	%>
  
  
 
</form>

<%
		ctr=ctr+1
		rsLock.MOVENEXT
		WEND
		
	%>

<script>

function pending(select)
{
	//alert("ldk")
	b=updateLocker.pendingDocument.value;
		if(b=='no')
	{
		
		$("#namePendingDocument").hide();
		 
	}
	else
	{
		$('#namePendingDocument').show();
	}
} 
function saveDoc(){
	//alert("da")
	
	url="documentUpload.asp?lockerId=<%=lockerId%>"
	location.href=url


}

	function updateForm ()
		{
			$("#updateLocker").submit();

		
		}
		
		function showAdditional(){
			//alert("da")
			$('#colesseeTable').show();
	//document.getElementById("colesseeTable").style.display="";
		}
		
		function updateColesseeTable(i){
			
			updateLocker.spa_flag.value="U";
			updateLocker.colesseeId.value=document.getElementById("colesseeId_"+i).value;
			
			updateLocker.nameOfColessee.value=document.getElementById("nameOfColessee_"+i).value;
			
			updateLocker.genderColessee.value=document.getElementById("genderColessee_"+i).value;
			updateLocker.maritalStatusColessee.value=document.getElementById("maritalStatusColessee_"+i).value;
			updateLocker.dateOfBirthColessee.value=document.getElementById("dateOfBirthColessee_"+i).value;
			
			
			updateLocker.residenceNumberColessee.value=document.getElementById("residenceNumberColessee_"+i).value;
			updateLocker.mobileNumberColessee.value=document.getElementById("mobileNumberColessee_"+i).value;
			updateLocker.citizenshipNoColessee.value=document.getElementById("citizenshipNoColessee_"+i).value;
			updateLocker.citizenIsssuPlaceColessee.value=document.getElementById("citizenIsssuPlaceColessee_"+i).value;
			updateLocker.citizenIssueDateColessee.value=document.getElementById("citizenIssueDateColessee_"+i).value;
			
			updateLocker.fatherNameColessee.value=document.getElementById("fatherNameColessee_"+i).value;
			updateLocker.grandFatherNameColessee.value=document.getElementById("grandFatherNameColessee_"+i).value;
			updateLocker.motherNameColessee.value=document.getElementById("motherNameColessee_"+i).value;
			updateLocker.spouseNameColessee.value=document.getElementById("spouseNameColessee_"+i).value;
			
			
			updateLocker.permanentAddressColessee.value=document.getElementById("permanentAddressColessee_"+i).value;
			updateLocker.temporaryAddressColessee.value=document.getElementById("temporaryAddressColessee_"+i).value;
			updateLocker.occupationColessee.value=document.getElementById("occupationColessee_"+i).value;
			updateLocker.nameOfOrganizationColessee.value=document.getElementById("nameOfOrganizationColessee_"+i).value;
			updateLocker.annualIncomeColessee.value=document.getElementById("annualIncomeColessee_"+i).value;
			updateLocker.riskProfile.value=document.getElementById("riskProfile_"+i).value;
			
		
			
			updateLocker.enctype="";
			updateLocker.action="updateColesseeTable.asp";
			updateLocker.submit()
	}
	
	function addColesseeTable(){
	updateLocker.enctype="";
	updateLocker.spa_flag.value="I";
	updateLocker.action="updateColesseeTable.asp";
	updateLocker.submit()
}
	


</script>