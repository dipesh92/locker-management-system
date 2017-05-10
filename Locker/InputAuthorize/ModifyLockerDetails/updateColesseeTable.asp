<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<%
	SetVars "form"		

	set Con=Server.CreateObject("Adodb.Connection")
	Con.open getConn
	'lockerId = request.QueryString("lockerId")
	
	
'	
	
	%>
    
    <%
	
	sql = "spa_updateColesseeTable "& _                  
					"@flag="& singleQuote(spa_flag) &","& _
					"@lockerId="& singleQuote(lockerId) &","& _
					"@colesseeId="& singleQuote(colesseeId) &","& _
					"@nameOfColessee="& singleQuote(nameOfColessee) &","& _   
					"@genderColessee="& singleQuote(genderColessee) &","& _
					"@maritalStatusColessee="& singleQuote(maritalStatusColessee) &","& _
					"@dateOfBirthColessee="& singleQuote(dateOfBirthColessee) &","& _
					"@residenceNumberColessee ="& singleQuote(residenceNumberColessee) &","& _ 
					"@mobileNumberColessee  ="& singleQuote(mobileNumberColessee) &","& _                      
					"@citizenshipNoColessee="& singleQuote(citizenshipNoColessee) &","& _   
					
					"@citizenIsssuPlaceColessee="& singleQuote(citizenIsssuPlaceColessee) &","& _
					"@citizenIssueDateColessee="& singleQuote(citizenIssueDateColessee) &","& _
					"@fatherNameColessee="& singleQuote(fatherNameColessee) &","& _
					"@grandFatherNameColessee="& singleQuote(grandFatherNameColessee) &","& _   
					"@motherNameColessee="& singleQuote(motherNameColessee) &","& _
					"@spouseNameColessee="& singleQuote(spouseNameColessee) &","& _
					"@permanentAddressColessee="& singleQuote(permanentAddressColessee) &","& _ 
					"@temporaryAddressColessee ="& singleQuote(temporaryAddressColessee) &","& _ 
					"@occupationColessee  ="& singleQuote(occupationColessee) &","& _                      
					"@nameOfOrganizationColessee="& singleQuote(nameOfOrganizationColessee) &","& _   
					"@annualIncomeColessee="& singleQuote(annualIncomeColessee) &","& _
					"@riskProfile="& singleQuote(riskProfile) 
					
					'Response.Write sql
					'response.End()
					set rsTran=Server.CreateObject("Adodb.Recordset")
					rsTran.open sql,con
					'Response.End()
					
					Response.redirect("updateLocker.asp?lockerId="&lockerId)
					
					
	
	%>
    
