#Persistent

; Set the format for the YYYYMMDD variable
FormatTime, YYYYMMDD, A_Now, yyyyMMdd

; Define the file path for the daily report
DailyReportPath := "C:\Users\86173\Desktop\日报\" . YYYYMMDD . ".xlsx"

; Check if the daily report file exists, if not, create it
IfNotExist, %DailyReportPath%
    FileCopy, C:\Users\86173\Desktop\日报\日报模版.xlsx, %DailyReportPath%

; Define a hotkey (Ctrl+Alt+N) to open today's report
^!n::
    Run, %DailyReportPath%
Return
