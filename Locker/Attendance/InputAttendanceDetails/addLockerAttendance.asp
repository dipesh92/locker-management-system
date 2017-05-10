
<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<%
SetVars "form"
staffInvolved = session("user")
set Con=Server.CreateObject("Adodb.Connection")
Con.open getConn
	
		'lockerHolderName = strRequest("lockerHolderName")
'		accountNumber = strRequest("accountNumber")
'		expireDate = strRequest("expireDate")
'		nameOfColessee = strRequest("nameOfColessee")
'		insufficentLienAmount = strRequest("insufficentLienAmount")
'		lockerStatus = strRequest("lockerStatus")
'		insufficentAnnualCharge = strRequest("insufficentAnnualCharge")
'		personVisited = strRequest("personVisited")
'		insufficentAnnualCharge = strRequest("insufficentAnnualCharge")
'		lockerTimeIn = strRequest("lockerTimeIn")



sql = "spa_lockerAttendance "& _                  
					"@flag="& singleQuote(spa_flag) &","& _
					"@lockerNo="& singleQuote(lockerNo) &","& _
					"@lockerAttendanceID="& singleQuote(lockerAttendanceID 	) &","& _
					"@lockerId="& singleQuote(lockerId) &","& _
					"@lockerHolderName="& singleQuote(lockerHolderName) &","& _ 
					"@accountNumber ="& singleQuote(accountNumber) &","& _ 
					"@expiryDate  ="& singleQuote(expireDate) &","& _                      
					"@nameOfColessee="& singleQuote(nameOfColessee) &","& _   
					"@pendingDocument="& singleQuote(pendingDocument) &","& _
					"@insufficentLienAmount="& singleQuote(insufficentLienAmount) &","& _
					"@lockerStatus="& singleQuote(lockerStatus) &","& _
					
					"@nameOfPersonVisitingLocker="& singleQuote(personVisited) &","& _
					"@insufficentAnnualCharge="& singleQuote(insufficentAnnualCharge) &","& _
					"@lockerInTime="& singleQuote(lockerTimeIn) &","& _
					"@lockerOutTime="& singleQuote(lockerOutTime) &","& _
					
					"@staffInvolved  ="& singleQuote(staffInvolved)
					
				'Response.Write sql
				' Response.End()
				set rsLock=server.CreateObject("Adodb.RecordSet")
				rsLock.open sql,con
				Response.redirect("default.asp")

%>
<%'=iRemitButton(" fa-sign-out||Exit|exitLockerAttendance()|"& EnableExit)%>


<script>
function exitLockerAttendance() 
	{
		
		window.location.href = "exitLocker.asp";
	
	}



</script>