; List all the HID Keyboard Devices attached to the system

; https://docs.microsoft.com/en-us/windows/win32/cimwin32prov/win32-pnpentity

for device in ComObjGet("winmgmts:").ExecQuery("Select * from Win32_PnPEntity")
{	
	If InStr(device.name, "HID Keyboard Device") {
		list .= device.name "`t" device.pnpdeviceid "`n"
	}
}

MsgBox, %list%
