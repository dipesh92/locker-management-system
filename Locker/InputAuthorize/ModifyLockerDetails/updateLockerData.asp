<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<!-- #include virtual="/common/ASPUpload.asp" -->
<%
	SetVars "form"
	
	Dim uploadsDirVar
	SaveFiles=""
	Set Upload = New ASPUpload		

	set Con=Server.CreateObject("Adodb.Connection")
	Con.open getConn
	lockerId = request.QueryString("lockerId")
	
	uploadsDirVar=CHEQUE_UPLOAD_PATH

	Upload.Save(uploadsDirVar)
	
    'for each fileKey in Upload.UploadedFiles.keys
			'SaveFiles = SaveFiles & Upload.UploadedFiles(fileKey).FileName,"here"
	'next
	RND_NAME=replace(NOW,"/","") &"_DOC_"& session("user") 
	RND_NAME=replace(RND_NAME," ","")
	RND_NAME=replace(RND_NAME,":","")

	Upload.SaveImg CHEQUE_UPLOAD_PATH, RND_NAME
	
	for each fileKey in Upload.UploadedFiles.keys
		SaveFiles = Upload.UploadedFiles(fileKey).FileName
	next

	saved_img_file=RND_NAME&"_"& SaveFiles
	doc=CHEQUE_SAVE_PATH&saved_img_file
	
	lockerHolderName = Upload.Form("lockerHolderName")
	lockerSize = Upload.Form("lockerSize")
	lockerNo = Upload.Form("lockerNo")
	accountNumber = Upload.Form("accountNumber")
	accountClass = Upload.Form("accountClass")
	waiverIn = Upload.Form("waiverIn")
	annualCharge = Upload.Form("annualCharge")
	lienAmount = Upload.Form("lienAmount")
	lockerOpenDate = Upload.Form("lockerOpenDate")
	annualChargeTaken = Upload.Form("annualChargeTaken")
	nextRenewalDate = Upload.Form("nextRenewalDate")
	lockerStatus = Upload.Form("lockerStatus")
	
	dateOfBirth = Upload.Form("dateOfBirth")
	maritalStatus = Upload.Form("maritalStatus")
	gender = Upload.Form("gender")
	citizenshipNo = Upload.Form("citizenshipNo")
	ctznIssueDate = Upload.Form("ctznIssueDate")
	ctznIssuePlace = Upload.Form("ctznIssuePlace")
	residence = Upload.Form("residence")
	mobile = Upload.Form("mobile")
	permanentAddress = Upload.Form("permanentAddress")
	temporaryAddress = Upload.Form("temporaryAddress")
	
	nameOfColessee = Upload.Form("nameOfColessee")
	genderColessee = Upload.Form("genderColessee")
	maritalStatusColessee = Upload.Form("maritalStatusColessee")
	dobColessee = Upload.Form("dobColessee")
	residenceColessee = Upload.Form("residenceColessee")
	mobileColessee = Upload.Form("mobileColessee")
	ctznNoColessee = Upload.Form("ctznNoColessee")
	mobile = Upload.Form("mobile")
	ctznIssueDateColessee = Upload.Form("ctznIssueDateColessee")
	ctznIssuePlaceColessee = Upload.Form("ctznIssuePlaceColessee")
	
	fatherNameColessee = Upload.Form("fatherNameColessee")
	grandFatherNameColessee = Upload.Form("grandFatherNameColessee")
	motherNameColessee = Upload.Form("motherNameColessee")
	spouseNameColessee = Upload.Form("spouseNameColessee")
	permanentAddressColessee = Upload.Form("permanentAddressColessee")
	temporaryAddressColessee = Upload.Form("temporaryAddressColessee")
	occupationColessee = Upload.Form("occupationColessee")
	nameOfOrganizationColessee = Upload.Form("nameOfOrganizationColessee")
	annualIncomeColessee = Upload.Form("annualIncomeColessee")
	
	
	nameOfNominee = Upload.Form("nameOfNominee")
	dateOfBirthNominee = Upload.Form("dateOfBirthNominee")
	genderNominee = Upload.Form("genderNominee")
	ctznNoNominee = Upload.Form("ctznNoNominee")
	ctznIssueDateNominee = Upload.Form("ctznIssueDateNominee")
	ctznIssuePlaceNominee = Upload.Form("ctznIssuePlaceNominee")
	relationshipNominee = Upload.Form("relationshipNominee")
	contactNoNominee = Upload.Form("contactNoNominee")
	fatherNameNominee = Upload.Form("fatherNameNominee")
	grandFatherNameNominee = Upload.Form("grandFatherNameNominee")
	motherNameNominee = Upload.Form("motherNameNominee")
	spouseNameNominee = Upload.Form("spouseNameNominee")
	permanentAddressNominee = Upload.Form("permanentAddressNominee")
	temporaryAddressNominee = Upload.Form("temporaryAddressNominee")
	
	docUpload = Upload.Form("docUpload")
	keyHandler = Upload.Form("keyHandler")
	pendingDocument = Upload.Form("pendingDocument")
	namePendingDocument = Upload.Form("namePendingDocument")
	Modified_By = session("user")
'	
	
	%>
    
    <%
	
	sql = "spa_lockerDetails "& _                  
					"@flag='U',"& _
					"@lockerId="& singleQuote(lockerId) &","& _
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
					"@lockerStatus="& singleQuote(lockerStatus) &","& _
					
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
					 
					"@docUpload  ="& singleQuote(doc) &","& _
					"@keyHandler  ="& singleQuote(keyHandler) &","& _                      
					"@pendingDocument="& singleQuote(pendingDocument) &","& _ 
					"@Modified_By="& singleQuote(Modified_By) &","& _  
					"@namePendingDocument="& singleQuote(namePendingDocument)
					
					
					'Response.Write sql
'					response.End()
					set rsTran=Server.CreateObject("Adodb.Recordset")
					rsTran.open sql,con
					
					Response.redirect("default.asp")
					
					
	
	%>
    
