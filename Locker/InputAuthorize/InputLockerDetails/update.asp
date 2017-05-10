<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<%
	SetVars "form"		

	set Con=Server.CreateObject("Adodb.Connection")
	Con.open getConn
	
	Created_By=strRequest("ename")
	'Authorized_By=strRequest("ename")
	'Modified_By =strRequest("ename")
	'lockerHolderName = strRequest("lockerHolderName")
'	lockerSize = strRequest("lockerSize")
'	lockerNo = strRequest("lockerNo")
'	accountNumber = strRequest("accountNumber")
'	accountClass = strRequest("accountClass")
'	waiverIn = strRequest("waiverIn")
'	annualCharge = strRequest("annualCharge")
'	lienAmount = strRequest("lienAmount")
'	lockerOpenDate = strRequest("lockerOpenDate")
'	annualChargeTaken = strRequest("annualChargeTaken")
'	nextRenewalDate = strRequest("nextRenewalDate")
'	
'	dateOfBirth = strRequest("dateOfBirth")
'	maritalStatus = strRequest("maritalStatus")
'	gender = strRequest("gender")
'	citizenshipNo = strRequest("citizenshipNo")
'	ctznIssueDate = strRequest("ctznIssueDate")
'	ctznIssuePlace = strRequest("ctznIssuePlace")
'	residence = strRequest("residence")
'	mobile = strRequest("mobile")
'	permanentAddress = strRequest("permanentAddress")
'	temporaryAddress = strRequest("temporaryAddress")
'	
'	nameOfColessee = strRequest("nameOfColessee")
'	genderColessee = strRequest("genderColessee")
'	maritalStatusColessee = strRequest("maritalStatusColessee")
'	dobColessee = strRequest("dobColessee")
'	residenceColessee = strRequest("residenceColessee")
'	mobileColessee = strRequest("mobileColessee")
'	ctznNoColessee = strRequest("ctznNoColessee")
'	mobile = strRequest("mobile")
'	ctznIssueDateColessee = strRequest("ctznIssueDateColessee")
'	ctznIssuePlaceColessee = strRequest("ctznIssuePlaceColessee")
'	
'	fatherNameColessee = strRequest("fatherNameColessee")
'	grandFatherNameColessee = strRequest("grandFatherNameColessee")
'	motherNameColessee = strRequest("motherNameColessee")
'	spouseNameColessee = strRequest("spouseNameColessee")
'	permanentAddressColessee = strRequest("permanentAddressColessee")
'	temporaryAddressColessee = strRequest("temporaryAddressColessee")
'	occupationColessee = strRequest("occupationColessee")
'	nameOfOrganizationColessee = strRequest("nameOfOrganizationColessee")
'	annualIncomeColessee = strRequest("annualIncomeColessee")
'	
'	
'	nameOfNominee = strRequest("nameOfNominee")
'	dobNominee = strRequest("dobNominee")
'	genderNominee = strRequest("genderNominee")
'	ctznNoNominee = strRequest("ctznNoNominee")
'	ctznIssueDateNominee = strRequest("ctznIssueDateNominee")
'	ctznIssuePlaceNominee = strRequest("ctznIssuePlaceNominee")
'	relationshipNominee = strRequest("relationshipNominee")
'	contactNoNominee = strRequest("contactNoNominee")
'	fatherNameNominee = strRequest("fatherNameNominee")
'	grandFatherNameNominee = strRequest("grandFatherNameNominee")
'	motherNameNominee = strRequest("motherNameNominee")
'	spouseNameNominee = strRequest("spouseNameNominee")
'	permanentAddressNominee = strRequest("permanentAddressNominee")
'	temporaryAddressNominee = strRequest("temporaryAddressNominee")
'	
'	keyHandler = strRequest("keyHandler")
'	pendingDocument = strRequest("pendingDocument")
'	namePendingDocument = strRequest("namePendingDocument")
'	
	
	%>
    
    <%
	
	sql = "spa_lockerDetails "& _                  
					"@flag='I',"& _
					"@lockerHolderName="& singleQuote(lockerHolderName) &","& _ 
					"@lockerSize ="& singleQuote(lockerSize) &","& _ 
					"@lockerNo  ="& singleQuote(lockerNo) &","& _                      
					"@accountNumber="& singleQuote(accountNumber) &","& _   
					"@accountClass="& singleQuote(accountClass) &","& _
					"@waiverIn="& singleQuote(waiverIn) &","& _
					"@annualCharge="& singleQuote(annualCharge) &","& _ 
					"@lienAmount ="& singleQuote(lienAmount) &","& _ 
					"@lockerOpenDate  ="& singleQuote(lockerOpenDate) &","& _                      
					"@annualChargeTakeOn="& singleQuote(annualChargeTakeOn) &","& _   
					"@nextRenewalDate="& singleQuote(nextRenewalDate) &","& _
					
					"@dateOfBirth="& singleQuote(dateOfBirth) &","& _
					"@maritalStatus="& singleQuote(maritalStatus) &","& _   
					"@gender="& singleQuote(gender) &","& _
					"@citizenshipNo="& singleQuote(citizenshipNo) &","& _
					"@ctznIssueDate="& singleQuote(ctznIssueDate) &","& _ 
					"@ctznIssuePlace ="& singleQuote(ctznIssuePlace) &","& _ 
					"@residence  ="& singleQuote(residence) &","& _                      
					"@mobile="& singleQuote(mobile) &","& _   
					"@permanentAddress="& singleQuote(permanentAddress) &","& _
					"@temporaryAddress="& singleQuote(temporaryAddress) &","& _
					
					
					
					"@colessee="& singleQuote(colessee) &","& _
					"@nameOfColessee="& singleQuote(nameOfColessee) &","& _   
					"@genderColessee="& singleQuote(genderColessee) &","& _
					"@maritalStatusColessee="& singleQuote(maritalStatusColessee) &","& _
					"@dateOfBirthColessee="& singleQuote(dateOfBirthColessee) &","& _ 
					"@residenceNumberColessee ="& singleQuote(residenceNumberColessee) &","& _ 
					"@mobileNumberColessee  ="& singleQuote(mobileNumberColessee) &","& _                      
					"@citizenshipNoColessee="& singleQuote(citizenshipNoColessee) &","& _   
					"@citizenIssueDateColessee="& singleQuote(citizenIssueDateColessee) &","& _
					"@citizenIsssuPlaceColessee="& singleQuote(citizenIsssuPlaceColessee) &","& _
					
					"@fatherNameColessee="& singleQuote(fatherNameColessee) &","& _
					"@grandFatherNameColessee="& singleQuote(grandFatherNameColessee) &","& _   
					"@motherNameColessee="& singleQuote(motherNameColessee) &","& _
					"@spouseNameColessee="& singleQuote(spouseNameColessee) &","& _
					"@permanentAddressColessee="& singleQuote(permanentAddressColessee) &","& _ 
					"@temporaryAddressColessee ="& singleQuote(temporaryAddressColessee) &","& _ 
					"@occupationColessee  ="& singleQuote(occupationColessee) &","& _                      
					"@nameOfOrganizationColessee="& singleQuote(nameOfOrganizationColessee) &","& _   
					"@annualIncomeColessee="& singleQuote(annualIncomeColessee) &","& _
					"@riskProfile="& singleQuote(riskProfile) &","& _
					 
					
					"@nameOfNominee="& singleQuote(nameOfNominee) &","& _   
					"@dateOfBirthNominee="& singleQuote(dateOfBirthNominee) &","& _
					"@genderNominee="& singleQuote(genderNominee) &","& _
					"@ctznNoNominee="& singleQuote(ctznNoNominee) &","& _ 
					"@ctznIssueDateNominee ="& singleQuote(ctznIssueDateNominee) &","& _ 
					"@ctznIssuePlaceNominee  ="& singleQuote(ctznIssuePlaceNominee) &","& _                      
					"@relationshipNominee="& singleQuote(relationshipNominee) &","& _   
					"@contactNoNominee="& singleQuote(contactNoNominee) &","& _
					 
					
					
					
					"@fatherNameNominee="& singleQuote(fatherNameNominee) &","& _ 
					"@grandFatherNameNominee ="& singleQuote(grandFatherNameNominee) &","& _ 
					"@motherNameNominee  ="& singleQuote(motherNameNominee) &","& _                      
					"@spouseNameNominee="& singleQuote(spouseNameNominee) &","& _   
					"@permanentAddressNominee="& singleQuote(permanentAddressNominee) &","& _
					"@temporaryAddressNominee ="& singleQuote(temporaryAddressNominee) &","& _
					 
					"@keyHandler  ="& singleQuote(keyHandler) &","& _                      
					"@pendingDocument="& singleQuote(pendingDocument) &","& _ 
					"@Created_By="& singleQuote(session("user")) &","& _
					
					"@namePendingDocument="& singleQuote(namePendingDocument)
					
					
					'Response.Write sql
'					response.End()
					set rsTran=Server.CreateObject("Adodb.Recordset")
					rsTran.open sql,con
					
					Response.redirect("../ModifyLockerDetails/default.asp")
					
					
	
	%>
    
