;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; GLOBAL KEYBINDINGS
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

; Autohotkey configuration file
; AHK Version v.1.1.34.03
; Franklin Chou (franklin.chou@nelsonmullins.com)

#Persistent 

SetCapsLockState, AlwaysOff

; Note: Backslash in device IDs must be escaped (i.e., double backslash) 
Is_Device_Attached(device_id) {
	query_enum := ComObjGet("winmgmts:").ExecQuery(""
		. "SELECT * FROM Win32_PnPEntity WHERE DeviceID='" . device_id . "'")		
		._NewEnum()

	if query_enum[_] {
		return 1
	} else {
		return 0
	}
}

; If the Leopold Keyboard is not attached, switch the default ThinkPad layout
leopold_keyboard_id := "HID\\VID_0853&PID_0138\\9&323F0D2&0&0000"
If Is_Device_Attached(leopold_keyboard_id) := 0 {
	CapsLock::Ctrl
	PrintScreen::AppsKey
}

; If the Logitech Ergo mouse is attached, swap the browser forward/back buttons
logi_ergo_id := "ACPI\\LEN0302\\4&1B873C3E&0"
If Is_Device_Attached(logi_ergo_id) = 1 {
	XButton1::PgDn
	XButton2::PgUp
}

::fc.::franklin.chou@nelsonmullins.com
::plz::Please let us know if we can provide further assistance.
::byy:: {Enter}{Enter}Best{,} {Enter}{Enter}Franklin
::dd::
	FormatTime, current_date, , yyyy_MM_dd
	SendInput %current_date%{Space}_{Space}
	Return
