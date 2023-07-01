;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GLOBAL KEYBINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autohotkey configuration file
; AHK Version v.1.1.34.03
; Franklin Chou (franklin.chou@nelsonmullins.com)

#Persistent 

SetCapsLockState, AlwaysOff

selected_keyboard_hids := "HID\VID_0853&PID_0138\9&323F0D2&0&0000"

connected_keyboard_devices := Array()
for device in ComObjGet("winmgmts:").ExecQuery("SELECT * FROM Win32_PnPEntity WHERE DeviceID = ''") {	
	if InStr(device.name, "HID Keyboard Device") {
		connected_keyboard_devices.Push(device.pnpdeviceid)
	}
}

is_selected_keyboard_attached := 0
for _, v in hid_keyboard_devices {
	if InStr(selected_keyboard_hids, v) {
		is_selected_keyboard_attached := 1	
	}
}

if is_selected_keyboard_attached := 0 { 
	CapsLock::Ctrl
	PrintScreen::AppsKey
}

XButton1::PgDn
XButton2::PgUp

::fc.::franklin.chou@nelsonmullins.com
::plz::Please let us know if we can provide further assistance.
::byy:: {Enter}{Enter}Best{,} {Enter}{Enter}Franklin
::dd::
	FormatTime, current_date, , yyyy_MM_dd
	SendInput %current_date%{Space}_{Space}
	Return