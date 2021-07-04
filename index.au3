Func _TimeStampUNIX_ms($iYear = @YEAR, $iMonth = @MON, $iDay = @MDAY, $iHour = @HOUR, $iMin = @MIN, $iSec = @SEC)
    Local $stSystemTime = DllStructCreate('ushort;ushort;ushort;ushort;ushort;ushort;ushort;ushort')
    DllCall('kernel32.dll', 'none', 'GetSystemTime', 'ptr', DllStructGetPtr($stSystemTime))
    $iMSec = StringFormat('%03d', DllStructGetData($stSystemTime, 8))
    Local $nYear = $iYear - ($iMonth < 3 ? 1 : 0)
    Return ((Int(Int($nYear / 100) / 4) - Int($nYear / 100) + $iDay + Int(365.25 * ($nYear + 4716)) + Int(30.6 * (($iMonth < 3 ? $iMonth + 12 : $iMonth) + 1)) - 2442110) * 86400 + ($iHour * 3600 + $iMin * 60 + $iSec)) * ($iMSec ? 1000 : 1) + $iMSec
EndFunc

$id = _TimeStampUNIX_ms()
MsgBox(0,0,$id)