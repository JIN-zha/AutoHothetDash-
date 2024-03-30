#Persistent
SetTimer, ShowCountdown, 5000  ; 设置定时器每隔五秒触发一次
SetTimer, RestReminder, 1200000  ; 设置定时器每隔20分钟提醒一次休息

ShowCountdown:
    ; 获取当前时间的小时、分钟和秒
    FormatTime, CurrentTime, A_Now, HH:mm:ss

    ; 将当前时间转换为分钟
    CurrentMinutes := SubStr(CurrentTime, 1, 2) * 60 + SubStr(CurrentTime, 4, 2)

    ; 计算下一个五分钟的时刻
    NextFiveMinutes := Ceil(CurrentMinutes / 5) * 5

    ; 计算下一个五分钟的小时和分钟
    NextHour := Floor(NextFiveMinutes / 60)
    NextMinute := NextFiveMinutes - (NextHour * 60)

    ; 计算剩余分钟和秒数
    RemainingMinutes := NextFiveMinutes - CurrentMinutes
    RemainingSeconds := (RemainingMinutes * 60) - SubStr(CurrentTime, 7, 2)

    ; 格式化剩余时间
    RemainingTime := RemainingMinutes "分钟 " RemainingSeconds "秒"

    ; 格式化下一个五分钟的时刻
    FutureTime := NextHour ":" NextMinute ":00"

    ; 显示倒计时提示
    ToolTip, Elon Musk Timeboxing Countdown:`nNext Unit: %FutureTime%`nRemaining: %RemainingTime%
    return

RestReminder:
    MsgBox, 48, Rest Reminder, It's time to rest your eyes!
    return

Gui, Color, 00008B ; 设置背景颜色为深蓝色
Gui, Add, Text, x10 y10 w200 h30, %CurrentTime% ; 添加一个文本控件显示当前时间
Gui, Add, Text, x10 y50 w200 h30, Elon Musk Timeboxing Countdown:`nNext Unit: %FutureTime%`nRemaining: %RemainingTime% ; 添加一个文本控件显示倒计时提示
Gui, Show, w300 h200, Timeboxing Countdown ; 显示GUI窗口