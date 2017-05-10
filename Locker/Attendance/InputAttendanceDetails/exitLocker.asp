
<!--#include virtual="/func.asp"-->
<!--#include virtual="/checkuser.asp"-->
<%
SetVars "form"
set Con=Server.CreateObject("Adodb.Connection")
Con.open getConn
'lockerNo = strRequest("lockerNo")	

					
sql = "spa_lockerAttendance "& _                  
					"@flag='U'"
'"UPDATE lockerAttendance SET  lockerOutTime = GETDATE() WHERE lockerAttendanceId ="  &singleQuote(16) 


				'Response.Write(sql)

				set rsLock=server.CreateObject("Adodb.RecordSet")
				rsLock.open sql,con
				Response.Write(sql)
				Response.End()
				'Response.redirect("default.asp")

%>
