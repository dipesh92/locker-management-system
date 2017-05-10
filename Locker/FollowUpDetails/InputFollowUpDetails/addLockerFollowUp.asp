
<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<%
SetVars "form"
set Con=Server.CreateObject("Adodb.Connection")
Con.open getConn

sql = "spa_lockerFollowUp "& _                  
					"@flag="& singleQuote(spa_flag) &","& _
					"@lockerFollowUpId="& singleQuote(lockerFollowUpId) &","& _
					"@lockerNo="& singleQuote(lockerNo) &","& _
					"@lockerId="& singleQuote(lockerId) &","& _ 
					"@lockerHolderName="& singleQuote(lockerHolderName) &","& _ 
					"@accountNumber ="& singleQuote(accountNumber) &","& _ 
					"@followUpMadeFor  ="& singleQuote(followUpMadeFor) &","& _                      
					"@followUp="& singleQuote(followUp) &","& _   
					"@followUpMadeBy="& singleQuote(followUpMadeBy) &","& _
					"@dateFollowUp="& singleQuote(dateFollowUp) &","& _
					"@timeFollowUp="& singleQuote(timeFollowUp) &","& _
					
					"@remarks="& singleQuote(remarks) 
					
				Response.Write sql
				'Response.End()
				set rsLock=server.CreateObject("Adodb.RecordSet")
				rsLock.open sql,con
				'Response.redirect("default.asp")

%>