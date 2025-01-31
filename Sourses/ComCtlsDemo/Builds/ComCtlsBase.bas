Attribute VB_Name = "ComCtlsBase"
Option Explicit

#Const ImplementIDEStopProtection = True

#If False Then
Private OLEDropModeNone, OLEDropModeManual
Private CCAppearanceFlat, CCAppearance3D
Private CCBorderStyleNone, CCBorderStyleSingle, CCBorderStyleThin, CCBorderStyleSunken, CCBorderStyleRaised
Private CCBackStyleTransparent, CCBackStyleOpaque
Private CCLeftRightAlignmentLeft, CCLeftRightAlignmentRight
Private CCVerticalAlignmentTop, CCVerticalAlignmentCenter, CCVerticalAlignmentBottom
Private CCIMEModeNoControl, CCIMEModeOn, CCIMEModeOff, CCIMEModeDisable, CCIMEModeHiragana, CCIMEModeKatakana, CCIMEModeKatakanaHalf, CCIMEModeAlphaFull, CCIMEModeAlpha, CCIMEModeHangulFull, CCIMEModeHangul
#End If
Public Enum OLEDropModeConstants
OLEDropModeNone = vbOLEDropNone
OLEDropModeManual = vbOLEDropManual
End Enum
Public Enum CCAppearanceConstants
CCAppearanceFlat = 0
CCAppearance3D = 1
End Enum
Public Enum CCBorderStyleConstants
CCBorderStyleNone = 0
CCBorderStyleSingle = 1
CCBorderStyleThin = 2
CCBorderStyleSunken = 3
CCBorderStyleRaised = 4
End Enum
Public Enum CCBackStyleConstants
CCBackStyleTransparent = 0
CCBackStyleOpaque = 1
End Enum
Public Enum CCLeftRightAlignmentConstants
CCLeftRightAlignmentLeft = 0
CCLeftRightAlignmentRight = 1
End Enum
Public Enum CCVerticalAlignmentConstants
CCVerticalAlignmentTop = 0
CCVerticalAlignmentCenter = 1
CCVerticalAlignmentBottom = 2
End Enum
Public Enum CCIMEModeConstants
CCIMEModeNoControl = 0
CCIMEModeOn = 1
CCIMEModeOff = 2
CCIMEModeDisable = 3
CCIMEModeHiragana = 4
CCIMEModeKatakana = 5
CCIMEModeKatakanaHalf = 6
CCIMEModeAlphaFull = 7
CCIMEModeAlpha = 8
CCIMEModeHangulFull = 9
CCIMEModeHangul = 10
End Enum
Private Type TagInitCommonControlsEx
dwSize As Long
dwICC As Long
End Type
Private Type DLLVERSIONINFO
cbSize As Long
dwMajor As Long
dwMinor As Long
dwBuildNumber As Long
dwPlatformID As Long
End Type
Private Type OSVERSIONINFO
dwOSVersionInfoSize As Long
dwMajorVersion As Long
dwMinorVersion As Long
dwBuildNumber As Long
dwPlatformID As Long
szCSDVersion(0 To ((128 * 2) - 1)) As Byte
End Type
Private Type POINTAPI
X As Long
Y As Long
End Type
Private Type CWPRETSTRUCT
lResult As Long
lParam As Long
wParam As Long
Message As Long
hWnd As Long
End Type
Private Type TMSG
hWnd As Long
Message As Long
wParam As Long
lParam As Long
Time As Long
PT As POINTAPI
End Type
Private Declare Sub CopyMemory Lib "kernel32" Alias "RtlMoveMemory" (ByRef Destination As Any, ByRef Source As Any, ByVal Length As Long)
Private Declare Function InitCommonControlsEx Lib "comctl32" (ByRef ICCEX As TagInitCommonControlsEx) As Long
Private Declare Function SendMessage Lib "user32" Alias "SendMessageW" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByRef lParam As Any) As Long
Private Declare Function PeekMessage Lib "user32" Alias "PeekMessageW" (ByRef lpMsg As TMSG, ByVal hWnd As Long, ByVal wMsgFilterMin As Long, ByVal wMsgFilterMax As Long, ByVal wRemoveMsg As Long) As Long
Private Declare Function SetWindowsHookEx Lib "user32" Alias "SetWindowsHookExW" (ByVal IDHook As Long, ByVal lpfn As Long, ByVal hMod As Long, ByVal dwThreadID As Long) As Long
Private Declare Function UnhookWindowsHookEx Lib "user32" (ByVal hHook As Long) As Long
Private Declare Function CallNextHookEx Lib "user32" (ByVal hHook As Long, ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function GetAncestor Lib "user32" (ByVal hWnd As Long, ByVal gaFlags As Long) As Long
Private Declare Function GetClassName Lib "user32" Alias "GetClassNameW" (ByVal hWnd As Long, ByVal lpClassName As Long, ByVal nMaxCount As Long) As Long
Private Declare Function GetKeyboardLayout Lib "user32" (ByVal dwThreadID As Long) As Long
Private Declare Function ImmIsIME Lib "imm32" (ByVal hKL As Long) As Long
Private Declare Function ImmCreateContext Lib "imm32" () As Long
Private Declare Function ImmDestroyContext Lib "imm32" (ByVal hIMC As Long) As Long
Private Declare Function ImmGetContext Lib "imm32" (ByVal hWnd As Long) As Long
Private Declare Function ImmReleaseContext Lib "imm32" (ByVal hWnd As Long, ByVal hIMC As Long) As Long
Private Declare Function ImmGetOpenStatus Lib "imm32" (ByVal hIMC As Long) As Long
Private Declare Function ImmSetOpenStatus Lib "imm32" (ByVal hIMC As Long, ByVal fOpen As Long) As Long
Private Declare Function ImmAssociateContext Lib "imm32" (ByVal hWnd As Long, ByVal hIMC As Long) As Long
Private Declare Function ImmGetConversionStatus Lib "imm32" (ByVal hIMC As Long, ByRef lpfdwConversion As Long, ByRef lpfdwSentence As Long) As Long
Private Declare Function ImmSetConversionStatus Lib "imm32" (ByVal hIMC As Long, ByVal lpfdwConversion As Long, ByVal lpfdwSentence As Long) As Long
Private Declare Function IsDialogMessage Lib "user32" Alias "IsDialogMessageW" (ByVal hDlg As Long, ByRef lpMsg As TMSG) As Long
Private Declare Function DllGetVersion Lib "comctl32" (ByRef pdvi As DLLVERSIONINFO) As Long
Private Declare Function GetVersionEx Lib "kernel32" Alias "GetVersionExW" (ByRef lpVersionInfo As OSVERSIONINFO) As Long
Private Declare Function LoadLibrary Lib "kernel32" Alias "LoadLibraryW" (ByVal lpLibFileName As Long) As Long
Private Declare Function FreeLibrary Lib "kernel32" (ByVal hLibModule As Long) As Long
Private Declare Function SetWindowLong Lib "user32" Alias "SetWindowLongW" (ByVal hWnd As Long, ByVal nIndex As Long, ByVal dwNewLong As Long) As Long
Private Declare Function GetWindowLong Lib "user32" Alias "GetWindowLongW" (ByVal hWnd As Long, ByVal nIndex As Long) As Long
Private Declare Function SetWindowPos Lib "user32" (ByVal hWnd As Long, ByVal hWndInsertAfter As Long, ByVal X As Long, ByVal Y As Long, ByVal CX As Long, ByVal CY As Long, ByVal wFlags As Long) As Long
Private Declare Function SetProp Lib "user32" Alias "SetPropW" (ByVal hWnd As Long, ByVal lpString As Long, ByVal hData As Long) As Long
Private Declare Function GetProp Lib "user32" Alias "GetPropW" (ByVal hWnd As Long, ByVal lpString As Long) As Long
Private Declare Function RemoveProp Lib "user32" Alias "RemovePropW" (ByVal hWnd As Long, ByVal lpString As Long) As Long
Private Declare Function SetWindowSubclass Lib "comctl32" (ByVal hWnd As Long, ByVal pfnSubclass As Long, ByVal uIdSubclass As Long, ByVal dwRefData As Long) As Long
Private Declare Function RemoveWindowSubclass Lib "comctl32" (ByVal hWnd As Long, ByVal pfnSubclass As Long, ByVal uIdSubclass As Long) As Long
Private Declare Function DefSubclassProc Lib "comctl32" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function SetWindowSubclass_W2K Lib "comctl32" Alias "#410" (ByVal hWnd As Long, ByVal pfnSubclass As Long, ByVal uIdSubclass As Long, ByVal dwRefData As Long) As Long
Private Declare Function RemoveWindowSubclass_W2K Lib "comctl32" Alias "#412" (ByVal hWnd As Long, ByVal pfnSubclass As Long, ByVal uIdSubclass As Long) As Long
Private Declare Function DefSubclassProc_W2K Lib "comctl32" Alias "#413" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Private Declare Function VirtualAlloc Lib "kernel32" (ByRef lpAddress As Long, ByVal dwSize As Long, ByVal flAllocType As Long, ByVal flProtect As Long) As Long
Private Declare Function VirtualProtect Lib "kernel32" (ByVal lpAddress As Long, ByVal dwSize As Long, ByVal flNewProtect As Long, ByRef lpflOldProtect As Long) As Long
Private Declare Function VirtualFree Lib "kernel32" (ByRef lpAddress As Long, ByVal dwSize As Long, ByVal dwFreeType As Long) As Long
Private Declare Function GetProcAddress Lib "kernel32" (ByVal hModule As Long, ByVal lpProcName As String) As Long
Private Declare Function GetModuleHandle Lib "kernel32" Alias "GetModuleHandleW" (ByVal lpModuleName As Long) As Long
Private Const MEM_COMMIT As Long = &H1000
Private Const PAGE_EXECUTE_READWRITE As Long = &H40
Private Const GWL_WNDPROC As Long = (-4)
Private Const GWL_STYLE As Long = (-16)
Private Const GWL_EXSTYLE As Long = (-20)
Private Const WM_DESTROY As Long = &H2
Private Const WM_NCDESTROY As Long = &H82
Private Const WM_UAHDESTROYWINDOW As Long = &H90
Private Const WM_INITDIALOG As Long = &H110
Private ShellModHandle As Long, ShellModCount As Long
Private CdlPDEXHookHandle As Long, CdlPDEXHookCustData As Long
Private CdlFRHookHandle As Long
Private CdlFRDialogHandle() As Long, CdlFRDialogCount As Long

#If ImplementIDEStopProtection = True Then

Private Type IMAGE_DATA_DIRECTORY
VirtualAddress As Long
Size As Long
End Type
Private Type IMAGE_OPTIONAL_HEADER32
Magic As Integer
MajorLinkerVersion As Byte
MinorLinkerVersion As Byte
SizeOfCode As Long
SizeOfInitalizedData As Long
SizeOfUninitalizedData As Long
AddressOfEntryPoint As Long
BaseOfCode As Long
BaseOfData As Long
ImageBase As Long
SectionAlignment As Long
FileAlignment As Long
MajorOperatingSystemVer As Integer
MinorOperatingSystemVer As Integer
MajorImageVersion As Integer
MinorImageVersion As Integer
MajorSubsystemVersion As Integer
MinorSubsystemVersion As Integer
Reserved1 As Long
SizeOfImage As Long
SizeOfHeaders As Long
CheckSum As Long
Subsystem As Integer
DllCharacteristics As Integer
SizeOfStackReserve As Long
SizeOfStackCommit As Long
SizeOfHeapReserve As Long
SizeOfHeapCommit As Long
LoaderFlags As Long
NumberOfRvaAndSizes As Long
DataDirectory(15) As IMAGE_DATA_DIRECTORY
End Type
Private Type IMAGE_DOS_HEADER
e_magic As Integer
e_cblp As Integer
e_cp As Integer
e_crlc As Integer
e_cparhdr As Integer
e_minalloc As Integer
e_maxalloc As Integer
e_ss As Integer
e_sp As Integer
e_csum As Integer
e_ip As Integer
e_cs As Integer
e_lfarlc As Integer
e_onvo As Integer
e_res(0 To 3) As Integer
e_oemid As Integer
e_oeminfo As Integer
e_res2(0 To 9) As Integer
e_lfanew As Long
End Type

#End If

Public Sub ComCtlsLoadShellMod()
If (ShellModHandle Or ShellModCount) = 0 Then ShellModHandle = LoadLibrary(StrPtr("Shell32.dll"))
ShellModCount = ShellModCount + 1
End Sub

Public Sub ComCtlsReleaseShellMod()
ShellModCount = ShellModCount - 1
If ShellModCount = 0 And ShellModHandle <> 0 Then
    FreeLibrary ShellModHandle
    ShellModHandle = 0
End If
End Sub

Public Sub ComCtlsInitCC(ByVal ICC As Long)
Dim ICCEX As TagInitCommonControlsEx
With ICCEX
.dwSize = LenB(ICCEX)
.dwICC = ICC
End With
InitCommonControlsEx ICCEX
End Sub

Public Sub ComCtlsShowAllUIStates(ByVal hWnd As Long)
Const WM_CHANGEUISTATE As Long = &H127
Const UIS_CLEAR As Long = 2, UISF_HIDEFOCUS As Long = &H1, UISF_HIDEACCEL As Long = &H2
SendMessage hWnd, WM_CHANGEUISTATE, MakeDWord(UIS_CLEAR, UISF_HIDEFOCUS Or UISF_HIDEACCEL), ByVal 0&
End Sub

Public Sub ComCtlsInitBorderStyle(ByRef dwStyle As Long, ByRef dwExStyle As Long, ByVal Value As CCBorderStyleConstants)
Const WS_BORDER As Long = &H800000, WS_DLGFRAME As Long = &H400000
Const WS_EX_CLIENTEDGE As Long = &H200, WS_EX_STATICEDGE As Long = &H20000, WS_EX_WINDOWEDGE As Long = &H100
Select Case Value
    Case CCBorderStyleSingle
        dwStyle = dwStyle Or WS_BORDER
    Case CCBorderStyleThin
        dwExStyle = dwExStyle Or WS_EX_STATICEDGE
    Case CCBorderStyleSunken
        dwExStyle = dwExStyle Or WS_EX_CLIENTEDGE
    Case CCBorderStyleRaised
        dwExStyle = dwExStyle Or WS_EX_WINDOWEDGE
        dwStyle = dwStyle Or WS_DLGFRAME
End Select
End Sub

Public Sub ComCtlsChangeBorderStyle(ByVal hWnd As Long, ByVal Value As CCBorderStyleConstants)
Const WS_BORDER As Long = &H800000, WS_DLGFRAME As Long = &H400000
Const WS_EX_CLIENTEDGE As Long = &H200, WS_EX_STATICEDGE As Long = &H20000, WS_EX_WINDOWEDGE As Long = &H100
Dim dwStyle As Long, dwExStyle As Long
dwStyle = GetWindowLong(hWnd, GWL_STYLE)
dwExStyle = GetWindowLong(hWnd, GWL_EXSTYLE)
If (dwStyle And WS_BORDER) = WS_BORDER Then dwStyle = dwStyle And Not WS_BORDER
If (dwStyle And WS_DLGFRAME) = WS_DLGFRAME Then dwStyle = dwStyle And Not WS_DLGFRAME
If (dwExStyle And WS_EX_STATICEDGE) = WS_EX_STATICEDGE Then dwExStyle = dwExStyle And Not WS_EX_STATICEDGE
If (dwExStyle And WS_EX_CLIENTEDGE) = WS_EX_CLIENTEDGE Then dwExStyle = dwExStyle And Not WS_EX_CLIENTEDGE
If (dwExStyle And WS_EX_WINDOWEDGE) = WS_EX_WINDOWEDGE Then dwExStyle = dwExStyle And Not WS_EX_WINDOWEDGE
Select Case Value
    Case CCBorderStyleSingle
        dwStyle = dwStyle Or WS_BORDER
    Case CCBorderStyleThin
        dwExStyle = dwExStyle Or WS_EX_STATICEDGE
    Case CCBorderStyleSunken
        dwExStyle = dwExStyle Or WS_EX_CLIENTEDGE
    Case CCBorderStyleRaised
        dwExStyle = dwExStyle Or WS_EX_WINDOWEDGE
        dwStyle = dwStyle Or WS_DLGFRAME
End Select
SetWindowLong hWnd, GWL_STYLE, dwStyle
SetWindowLong hWnd, GWL_EXSTYLE, dwExStyle
Const SWP_FRAMECHANGED As Long = &H20, SWP_NOMOVE As Long = &H2, SWP_NOOWNERZORDER As Long = &H200, SWP_NOSIZE As Long = &H1, SWP_NOZORDER As Long = &H4
SetWindowPos hWnd, 0, 0, 0, 0, 0, SWP_NOMOVE Or SWP_NOSIZE Or SWP_NOOWNERZORDER Or SWP_NOZORDER Or SWP_FRAMECHANGED
End Sub

Public Sub ComCtlsCreateIMC(ByVal hWnd As Long, ByRef hIMC As Long)
If hIMC = 0 Then
    hIMC = ImmCreateContext()
    If hIMC <> 0 Then ImmAssociateContext hWnd, hIMC
End If
End Sub

Public Sub ComCtlsDestroyIMC(ByVal hWnd As Long, ByRef hIMC As Long)
If hIMC <> 0 Then
    ImmAssociateContext hWnd, 0
    ImmDestroyContext hIMC
    hIMC = 0
End If
End Sub

Public Sub ComCtlsSetIMEMode(ByVal hWnd As Long, ByVal hIMCOrig As Long, ByVal Value As CCIMEModeConstants)
Const IME_CMODE_ALPHANUMERIC As Long = &H0, IME_CMODE_NATIVE As Long = &H1, IME_CMODE_KATAKANA As Long = &H2, IME_CMODE_FULLSHAPE As Long = &H8
Dim hKL As Long
hKL = GetKeyboardLayout(0)
If ImmIsIME(hKL) = 0 Or hIMCOrig = 0 Then Exit Sub
Dim hIMC As Long
hIMC = ImmGetContext(hWnd)
If Value = CCIMEModeDisable Then
    If hIMC <> 0 Then
        ImmReleaseContext hWnd, hIMC
        ImmAssociateContext hWnd, 0
    End If
Else
    If hIMC = 0 Then
        ImmAssociateContext hWnd, hIMCOrig
        hIMC = ImmGetContext(hWnd)
    End If
    If hIMC <> 0 And Value <> CCIMEModeNoControl Then
        Dim dwConversion As Long, dwSentence As Long
        ImmGetConversionStatus hIMC, dwConversion, dwSentence
        Select Case Value
            Case CCIMEModeOn
                ImmSetOpenStatus hIMC, 1
            Case CCIMEModeOff
                ImmSetOpenStatus hIMC, 0
            Case CCIMEModeHiragana
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion Or IME_CMODE_NATIVE
                If Not (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion Or IME_CMODE_FULLSHAPE
                If (dwConversion And IME_CMODE_KATAKANA) = IME_CMODE_KATAKANA Then dwConversion = dwConversion And Not IME_CMODE_KATAKANA
            Case CCIMEModeKatakana
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion Or IME_CMODE_NATIVE
                If Not (dwConversion And IME_CMODE_KATAKANA) = IME_CMODE_KATAKANA Then dwConversion = dwConversion Or IME_CMODE_KATAKANA
                If Not (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion Or IME_CMODE_FULLSHAPE
            Case CCIMEModeKatakanaHalf
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion Or IME_CMODE_NATIVE
                If Not (dwConversion And IME_CMODE_KATAKANA) = IME_CMODE_KATAKANA Then dwConversion = dwConversion Or IME_CMODE_KATAKANA
                If (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion And Not IME_CMODE_FULLSHAPE
            Case CCIMEModeAlphaFull
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion Or IME_CMODE_FULLSHAPE
                If (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion And Not IME_CMODE_NATIVE
                If (dwConversion And IME_CMODE_KATAKANA) = IME_CMODE_KATAKANA Then dwConversion = dwConversion And Not IME_CMODE_KATAKANA
            Case CCIMEModeAlpha
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_ALPHANUMERIC) = IME_CMODE_ALPHANUMERIC Then dwConversion = dwConversion Or IME_CMODE_ALPHANUMERIC
                If (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion And Not IME_CMODE_NATIVE
                If (dwConversion And IME_CMODE_KATAKANA) = IME_CMODE_KATAKANA Then dwConversion = dwConversion And Not IME_CMODE_KATAKANA
                If (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion And Not IME_CMODE_FULLSHAPE
            Case CCIMEModeHangulFull
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion Or IME_CMODE_NATIVE
                If Not (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion Or IME_CMODE_FULLSHAPE
            Case CCIMEModeHangul
                ImmSetOpenStatus hIMC, 1
                If Not (dwConversion And IME_CMODE_NATIVE) = IME_CMODE_NATIVE Then dwConversion = dwConversion Or IME_CMODE_NATIVE
                If (dwConversion And IME_CMODE_FULLSHAPE) = IME_CMODE_FULLSHAPE Then dwConversion = dwConversion And Not IME_CMODE_FULLSHAPE
        End Select
        ImmSetConversionStatus hIMC, dwConversion, dwSentence
        ImmReleaseContext hWnd, hIMC
    End If
End If
End Sub

Public Sub ComCtlsIPPBSetDisplayStringMousePointer(ByVal MousePointer As Integer, ByRef DisplayName As String)
Select Case MousePointer
    Case 0: DisplayName = "0 - Default"
    Case 1: DisplayName = "1 - Arrow"
    Case 2: DisplayName = "2 - Cross"
    Case 3: DisplayName = "3 - I-Beam"
    Case 4: DisplayName = "4 - Hand"
    Case 5: DisplayName = "5 - Size"
    Case 6: DisplayName = "6 - Size NE SW"
    Case 7: DisplayName = "7 - Size N S"
    Case 8: DisplayName = "8 - Size NW SE"
    Case 9: DisplayName = "9 - Size W E"
    Case 10: DisplayName = "10 - Up Arrow"
    Case 11: DisplayName = "11 - Hourglass"
    Case 12: DisplayName = "12 - No Drop"
    Case 13: DisplayName = "13 - Arrow and Hourglass"
    Case 14: DisplayName = "14 - Arrow and Question"
    Case 15: DisplayName = "15 - Size All"
    Case 16: DisplayName = "16 - Arrow and CD"
    Case 99: DisplayName = "99 - Custom"
End Select
End Sub

Public Sub ComCtlsIPPBSetPredefinedStringsMousePointer(ByRef StringsOut() As String, ByRef CookiesOut() As Long)
ReDim StringsOut(0 To (17 + 1)) As String
ReDim CookiesOut(0 To (17 + 1)) As Long
StringsOut(0) = "0 - Default": CookiesOut(0) = 0
StringsOut(1) = "1 - Arrow": CookiesOut(1) = 1
StringsOut(2) = "2 - Cross": CookiesOut(2) = 2
StringsOut(3) = "3 - I-Beam": CookiesOut(3) = 3
StringsOut(4) = "4 - Hand": CookiesOut(4) = 4
StringsOut(5) = "5 - Size": CookiesOut(5) = 5
StringsOut(6) = "6 - Size NE SW": CookiesOut(6) = 6
StringsOut(7) = "7 - Size N S": CookiesOut(7) = 7
StringsOut(8) = "8 - Size NW SE": CookiesOut(8) = 8
StringsOut(9) = "9 - Size W E": CookiesOut(9) = 9
StringsOut(10) = "10 - Up Arrow": CookiesOut(10) = 10
StringsOut(11) = "11 - Hourglass": CookiesOut(11) = 11
StringsOut(12) = "12 - No Drop": CookiesOut(12) = 12
StringsOut(13) = "13 - Arrow and Hourglass": CookiesOut(13) = 13
StringsOut(14) = "14 - Arrow and Question": CookiesOut(14) = 14
StringsOut(15) = "15 - Size All": CookiesOut(15) = 15
StringsOut(16) = "16 - Arrow and CD": CookiesOut(16) = 16
StringsOut(17) = "99 - Custom": CookiesOut(17) = 99
End Sub

Public Sub ComCtlsPPInitComboMousePointer(ByVal ComboBox As Object)
With ComboBox
.AddItem "0 - Default"
.ItemData(.NewIndex) = 0
.AddItem "1 - Arrow"
.ItemData(.NewIndex) = 1
.AddItem "2 - Cross"
.ItemData(.NewIndex) = 2
.AddItem "3 - I-Beam"
.ItemData(.NewIndex) = 3
.AddItem "4 - Hand"
.ItemData(.NewIndex) = 4
.AddItem "5 - Size"
.ItemData(.NewIndex) = 5
.AddItem "6 - Size NE SW"
.ItemData(.NewIndex) = 6
.AddItem "7 - Size N S"
.ItemData(.NewIndex) = 7
.AddItem "8 - Size NW SE"
.ItemData(.NewIndex) = 8
.AddItem "9 - Size W E"
.ItemData(.NewIndex) = 9
.AddItem "10 - Up Arrow"
.ItemData(.NewIndex) = 10
.AddItem "11 - Hourglass"
.ItemData(.NewIndex) = 11
.AddItem "12 - No Drop"
.ItemData(.NewIndex) = 12
.AddItem "13 - Arrow and Hourglass"
.ItemData(.NewIndex) = 13
.AddItem "14 - Arrow and Question"
.ItemData(.NewIndex) = 14
.AddItem "15 - Size All"
.ItemData(.NewIndex) = 15
.AddItem "16 - Arrow and CD"
.ItemData(.NewIndex) = 16
.AddItem "99 - Custom"
.ItemData(.NewIndex) = 99
End With
End Sub

Public Sub ComCtlsPPInitComboIMEMode(ByVal ComboBox As Object)
With ComboBox
.AddItem CCIMEModeNoControl & " - NoControl"
.ItemData(.NewIndex) = CCIMEModeNoControl
.AddItem CCIMEModeOn & " - On"
.ItemData(.NewIndex) = CCIMEModeOn
.AddItem CCIMEModeOff & " - Off"
.ItemData(.NewIndex) = CCIMEModeOff
.AddItem CCIMEModeDisable & " - Disable"
.ItemData(.NewIndex) = CCIMEModeDisable
.AddItem CCIMEModeHiragana & " - Hiragana"
.ItemData(.NewIndex) = CCIMEModeHiragana
.AddItem CCIMEModeKatakana & " - Katakana"
.ItemData(.NewIndex) = CCIMEModeKatakana
.AddItem CCIMEModeKatakanaHalf & " - KatakanaHalf"
.ItemData(.NewIndex) = CCIMEModeKatakanaHalf
.AddItem CCIMEModeAlphaFull & " - AlphaFull"
.ItemData(.NewIndex) = CCIMEModeAlphaFull
.AddItem CCIMEModeAlpha & " - Alpha"
.ItemData(.NewIndex) = CCIMEModeAlpha
.AddItem CCIMEModeHangulFull & " - HangulFull"
.ItemData(.NewIndex) = CCIMEModeHangulFull
.AddItem CCIMEModeHangul & " - Hangul"
.ItemData(.NewIndex) = CCIMEModeHangul
End With
End Sub

Public Sub ComCtlsPPKeyPressOnlyNumeric(ByRef KeyAscii As Integer)
If KeyAscii < 48 Or KeyAscii > 57 Then If KeyAscii <> 8 Then KeyAscii = 0
End Sub

Public Function ComCtlsPeekCharCode(ByVal hWnd As Long) As Long
Dim Msg As TMSG
Const PM_NOREMOVE As Long = &H0, WM_CHAR As Long = &H102
If PeekMessage(Msg, hWnd, WM_CHAR, WM_CHAR, PM_NOREMOVE) <> 0 Then ComCtlsPeekCharCode = Msg.wParam
End Function

Public Function ComCtlsSupportLevel() As Byte
Static Done As Boolean, Value As Byte
If Done = False Then
    Dim Version As DLLVERSIONINFO
    On Error Resume Next
    Version.cbSize = LenB(Version)
    Const S_OK As Long = &H0
    If DllGetVersion(Version) = S_OK Then
        If Version.dwMajor = 6 And Version.dwMinor = 0 Then
            Value = 1
        ElseIf Version.dwMajor > 6 Or (Version.dwMajor = 6 And Version.dwMinor > 0) Then
            Value = 2
        End If
    End If
    Done = True
End If
ComCtlsSupportLevel = Value
End Function

Public Function ComCtlsW2KCompatibility() As Boolean
Static Done As Boolean, Value As Boolean
If Done = False Then
    Dim Version As OSVERSIONINFO
    On Error Resume Next
    Version.dwOSVersionInfoSize = LenB(Version)
    If GetVersionEx(Version) <> 0 Then
        With Version
        Const VER_PLATFORM_WIN32_NT As Long = 2
        If .dwPlatformID = VER_PLATFORM_WIN32_NT Then
            If .dwMajorVersion = 5 And .dwMinorVersion = 0 Then Value = True
        End If
        End With
    End If
    Done = True
End If
ComCtlsW2KCompatibility = Value
End Function

Public Function ComCtlsRootIsEditor(ByVal hWnd As Long) As Boolean
Static Done As Boolean, Value As Boolean
If Done = False Then
    Const GA_ROOT As Long = 2
    hWnd = GetAncestor(hWnd, GA_ROOT)
    If hWnd <> 0 Then
        Dim Buffer As String, RetVal As Long
        Buffer = String(256, vbNullChar)
        RetVal = GetClassName(hWnd, StrPtr(Buffer), Len(Buffer))
        If RetVal <> 0 Then Value = CBool(Left$(Buffer, RetVal) = "wndclass_desked_gsk")
    End If
    Done = True
End If
ComCtlsRootIsEditor = Value
End Function

Public Sub ComCtlsSetSubclass(ByVal hWnd As Long, ByVal This As ISubclass, ByVal dwRefData As Long, Optional ByVal Name As String)
If hWnd = 0 Then Exit Sub
If Name = vbNullString Then Name = "ComCtl"
If GetProp(hWnd, StrPtr(Name & "SubclassInit")) = 0 Then
    If ComCtlsW2KCompatibility() = False Then
        SetWindowSubclass hWnd, AddressOf ComCtlsSubclassProc, ObjPtr(This), dwRefData
    Else
        SetWindowSubclass_W2K hWnd, AddressOf ComCtlsSubclassProc, ObjPtr(This), dwRefData
    End If
    SetProp hWnd, StrPtr(Name & "SubclassID"), ObjPtr(This)
    SetProp hWnd, StrPtr(Name & "SubclassInit"), 1
End If
End Sub

Public Function ComCtlsDefaultProc(ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
If ComCtlsW2KCompatibility() = False Then
    ComCtlsDefaultProc = DefSubclassProc(hWnd, wMsg, wParam, lParam)
Else
    ComCtlsDefaultProc = DefSubclassProc_W2K(hWnd, wMsg, wParam, lParam)
End If
End Function

Public Sub ComCtlsRemoveSubclass(ByVal hWnd As Long, Optional ByVal Name As String)
If hWnd = 0 Then Exit Sub
If Name = vbNullString Then Name = "ComCtl"
If GetProp(hWnd, StrPtr(Name & "SubclassInit")) = 1 Then
    If ComCtlsW2KCompatibility() = False Then
        RemoveWindowSubclass hWnd, AddressOf ComCtlsSubclassProc, GetProp(hWnd, StrPtr(Name & "SubclassID"))
    Else
        RemoveWindowSubclass_W2K hWnd, AddressOf ComCtlsSubclassProc, GetProp(hWnd, StrPtr(Name & "SubclassID"))
    End If
    RemoveProp hWnd, StrPtr(Name & "SubclassID")
    RemoveProp hWnd, StrPtr(Name & "SubclassInit")
End If
End Sub

Public Function ComCtlsSubclassProc(ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long, ByVal uIdSubclass As Long, ByVal dwRefData As Long) As Long
Select Case wMsg
    Case WM_DESTROY
        ComCtlsSubclassProc = ComCtlsDefaultProc(hWnd, wMsg, wParam, lParam)
        Exit Function
    Case WM_NCDESTROY, WM_UAHDESTROYWINDOW
        ComCtlsSubclassProc = ComCtlsDefaultProc(hWnd, wMsg, wParam, lParam)
        If ComCtlsW2KCompatibility() = False Then
            RemoveWindowSubclass hWnd, AddressOf ComCtlsBase.ComCtlsSubclassProc, uIdSubclass
        Else
            RemoveWindowSubclass_W2K hWnd, AddressOf ComCtlsBase.ComCtlsSubclassProc, uIdSubclass
        End If
        Exit Function
End Select
On Error Resume Next
Dim This As ISubclass
Set This = PtrToObj(uIdSubclass)
If Err.Number = 0 Then
    ComCtlsSubclassProc = This.Message(hWnd, wMsg, wParam, lParam, dwRefData)
Else
    ComCtlsSubclassProc = ComCtlsDefaultProc(hWnd, wMsg, wParam, lParam)
End If
End Function

Public Function ComCtlsLvwSortingFunctionBinary(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsLvwSortingFunctionBinary = This.Message(0, 0, lParam1, lParam2, 10)
End Function

Public Function ComCtlsLvwSortingFunctionText(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsLvwSortingFunctionText = This.Message(0, 0, lParam1, lParam2, 11)
End Function

Public Function ComCtlsLvwSortingFunctionNumeric(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsLvwSortingFunctionNumeric = This.Message(0, 0, lParam1, lParam2, 12)
End Function

Public Function ComCtlsLvwSortingFunctionCurrency(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsLvwSortingFunctionCurrency = This.Message(0, 0, lParam1, lParam2, 13)
End Function

Public Function ComCtlsLvwSortingFunctionDate(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsLvwSortingFunctionDate = This.Message(0, 0, lParam1, lParam2, 14)
End Function

Public Function ComCtlsLvwSortingFunctionGroups(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsLvwSortingFunctionGroups = This.Message(0, 0, lParam1, lParam2, 0)
End Function

Public Function ComCtlsTvwSortingFunctionBinary(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsTvwSortingFunctionBinary = This.Message(0, 0, lParam1, lParam2, 10)
End Function

Public Function ComCtlsTvwSortingFunctionText(ByVal lParam1 As Long, ByVal lParam2 As Long, ByVal This As ISubclass) As Long
ComCtlsTvwSortingFunctionText = This.Message(0, 0, lParam1, lParam2, 11)
End Function

Public Function ComCtlsCdlOFN1CallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlOFN1CallbackProcCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 64), 4
    SetProp hDlg, StrPtr("ComCtlsCdlOFN1CallbackProcCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlOFN1CallbackProc = This.Message(hDlg, wMsg, wParam, lParam, -1)
Else
    ComCtlsCdlOFN1CallbackProc = 0
End If
End Function

Public Function ComCtlsCdlOFN1CallbackProcOldStyle(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlOFN1CallbackProcOldStyleCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 64), 4
    SetProp hDlg, StrPtr("ComCtlsCdlOFN1CallbackProcOldStyleCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlOFN1CallbackProcOldStyle = This.Message(hDlg, wMsg, wParam, lParam, -1001)
Else
    ComCtlsCdlOFN1CallbackProcOldStyle = 0
End If
End Function

Public Function ComCtlsCdlOFN2CallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlOFN2CallbackProcCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 64), 4
    SetProp hDlg, StrPtr("ComCtlsCdlOFN2CallbackProcCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlOFN2CallbackProc = This.Message(hDlg, wMsg, wParam, lParam, -2)
Else
    ComCtlsCdlOFN2CallbackProc = 0
End If
End Function

Public Function ComCtlsCdlOFN2CallbackProcOldStyle(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlOFN2CallbackProcOldStyleCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 64), 4
    SetProp hDlg, StrPtr("ComCtlsCdlOFN2CallbackProcOldStyleCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlOFN2CallbackProcOldStyle = This.Message(hDlg, wMsg, wParam, lParam, -1002)
Else
    ComCtlsCdlOFN2CallbackProcOldStyle = 0
End If
End Function

Public Function ComCtlsCdlCCCallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlCCCallbackProcCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 24), 4
    SetProp hDlg, StrPtr("ComCtlsCdlCCCallbackProcCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlCCCallbackProc = This.Message(hDlg, wMsg, wParam, lParam, -3)
Else
    ComCtlsCdlCCCallbackProc = 0
End If
End Function

Public Function ComCtlsCdlCFCallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlCFCallbackProcCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 28), 4
    SetProp hDlg, StrPtr("ComCtlsCdlCFCallbackProcCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlCFCallbackProc = This.Message(hDlg, wMsg, wParam, lParam, -4)
Else
    ComCtlsCdlCFCallbackProc = 0
End If
End Function

Public Function ComCtlsCdlPDCallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlPDCallbackProcCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 38), 4
    SetProp hDlg, StrPtr("ComCtlsCdlPDCallbackProcCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlPDCallbackProc = This.Message(hDlg, wMsg, wParam, lParam, -5)
Else
    ComCtlsCdlPDCallbackProc = 0
End If
End Function

Public Sub ComCtlsCdlPDEXSetHook(ByVal This As ISubclass)
If CdlPDEXHookHandle = 0 Then
    CdlPDEXHookCustData = ObjPtr(This)
    Const WH_CALLWNDPROCRET As Long = 12
    CdlPDEXHookHandle = SetWindowsHookEx(WH_CALLWNDPROCRET, AddressOf ComCtlsCdlPDEXHookProc, 0, App.ThreadID)
End If
End Sub

Public Sub ComCtlsCdlPDEXRemoveHook()
If CdlPDEXHookHandle <> 0 Then
    UnhookWindowsHookEx CdlPDEXHookHandle
    CdlPDEXHookHandle = 0
    CdlPDEXHookCustData = 0
End If
End Sub

Private Function ComCtlsCdlPDEXHookProc(ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
ComCtlsCdlPDEXHookProc = CallNextHookEx(CdlPDEXHookHandle, nCode, wParam, lParam)
Const HC_ACTION As Long = 0
If nCode >= HC_ACTION Then
    Dim CWPRET As CWPRETSTRUCT
    CopyMemory CWPRET, ByVal lParam, LenB(CWPRET)
    If CWPRET.Message = WM_INITDIALOG Then
        Dim This As ISubclass
        If CdlPDEXHookCustData <> 0 Then Set This = PtrToObj(CdlPDEXHookCustData)
        Call ComCtlsCdlPDEXRemoveHook
        If Not This Is Nothing Then This.Message CWPRET.hWnd, CWPRET.Message, CWPRET.wParam, CWPRET.lParam, -5
    End If
End If
End Function

Public Function ComCtlsCdlPSDCallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Dim lCustData As Long
If wMsg <> WM_INITDIALOG Then
    lCustData = GetProp(hDlg, StrPtr("ComCtlsCdlPSDCallbackProcCustData"))
Else
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 64), 4
    SetProp hDlg, StrPtr("ComCtlsCdlPSDCallbackProcCustData"), lCustData
End If
If lCustData <> 0 Then
    Dim This As ISubclass
    Set This = PtrToObj(lCustData)
    ComCtlsCdlPSDCallbackProc = This.Message(hDlg, wMsg, wParam, lParam, -7)
Else
    ComCtlsCdlPSDCallbackProc = 0
End If
End Function

Public Function ComCtlsCdlBIFCallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal lParam As Long, ByVal This As ISubclass) As Long
ComCtlsCdlBIFCallbackProc = This.Message(hDlg, wMsg, 0, lParam, -8)
End Function

Public Function ComCtlsCdlFR1CallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
If wMsg <> WM_INITDIALOG Then
    ComCtlsCdlFR1CallbackProc = 0
Else
    Dim lCustData As Long
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 28), 4
    If lCustData <> 0 Then
        Dim This As ISubclass
        Set This = PtrToObj(lCustData)
        This.Message hDlg, wMsg, wParam, lParam, -9
    End If
    ' Need to return a nonzero value or else the dialog box will not be shown.
    ComCtlsCdlFR1CallbackProc = 1
End If
End Function

Public Function ComCtlsCdlFR2CallbackProc(ByVal hDlg As Long, ByVal wMsg As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
If wMsg <> WM_INITDIALOG Then
    ComCtlsCdlFR2CallbackProc = 0
Else
    Dim lCustData As Long
    CopyMemory lCustData, ByVal UnsignedAdd(lParam, 28), 4
    If lCustData <> 0 Then
        Dim This As ISubclass
        Set This = PtrToObj(lCustData)
        This.Message hDlg, wMsg, wParam, lParam, -10
    End If
    ' Need to return a nonzero value or else the dialog box will not be shown.
    ComCtlsCdlFR2CallbackProc = 1
End If
End Function

Public Sub ComCtlsCdlFRAddHook(ByVal hDlg As Long)
If (CdlFRHookHandle Or CdlFRDialogCount) = 0 Then
    Const WH_GETMESSAGE As Long = 3
    CdlFRHookHandle = SetWindowsHookEx(WH_GETMESSAGE, AddressOf ComCtlsCdlFRHookProc, 0, App.ThreadID)
    ReDim CdlFRDialogHandle(0) As Long
    CdlFRDialogHandle(0) = hDlg
Else
    ReDim Preserve CdlFRDialogHandle(0 To CdlFRDialogCount) As Long
    CdlFRDialogHandle(CdlFRDialogCount) = hDlg
End If
CdlFRDialogCount = CdlFRDialogCount + 1
End Sub

Public Sub ComCtlsCdlFRReleaseHook(ByVal hDlg As Long)
CdlFRDialogCount = CdlFRDialogCount - 1
If CdlFRDialogCount = 0 And CdlFRHookHandle <> 0 Then
    UnhookWindowsHookEx CdlFRHookHandle
    CdlFRHookHandle = 0
    Erase CdlFRDialogHandle()
Else
    If CdlFRDialogCount > 0 Then
        Dim i As Long
        For i = 0 To CdlFRDialogCount
            If CdlFRDialogHandle(i) = hDlg And i < CdlFRDialogCount Then
                CdlFRDialogHandle(i) = CdlFRDialogHandle(i + 1)
            End If
        Next i
        ReDim Preserve CdlFRDialogHandle(0 To CdlFRDialogCount - 1) As Long
    End If
End If
End Sub

Private Function ComCtlsCdlFRHookProc(ByVal nCode As Long, ByVal wParam As Long, ByVal lParam As Long) As Long
Const HC_ACTION As Long = 0, PM_REMOVE As Long = &H1
Const WM_KEYFIRST As Long = &H100, WM_KEYLAST As Long = &H108, WM_NULL As Long = &H0
If nCode >= HC_ACTION And wParam = PM_REMOVE Then
    Dim Msg As TMSG
    CopyMemory Msg, ByVal lParam, LenB(Msg)
    If Msg.Message >= WM_KEYFIRST And Msg.Message <= WM_KEYLAST Then
        If CdlFRDialogCount > 0 Then
            Dim i As Long
            For i = 0 To CdlFRDialogCount - 1
                If IsDialogMessage(CdlFRDialogHandle(i), Msg) <> 0 Then
                    Msg.Message = WM_NULL
                    Msg.wParam = 0
                    Msg.lParam = 0
                    CopyMemory ByVal lParam, Msg, LenB(Msg)
                    Exit For
                End If
            Next i
        End If
    End If
End If
ComCtlsCdlFRHookProc = CallNextHookEx(CdlFRHookHandle, nCode, wParam, lParam)
End Function

Public Sub ComCtlsInitIDEStopProtection()

#If ImplementIDEStopProtection = True Then

If InIDE() = True Then
    Dim ASMWrapper As Long, RestorePointer As Long, OldAddress As Long
    ASMWrapper = VirtualAlloc(ByVal 0, 20, MEM_COMMIT, PAGE_EXECUTE_READWRITE)
    OldAddress = GetProcAddress(GetModuleHandle(StrPtr("vba6.dll")), "EbProjectReset")
    RestorePointer = HookIATEntry("vb6.exe", "vba6.dll", "EbProjectReset", ASMWrapper)
    WriteCall ASMWrapper, AddressOf ComCtlsIDEStopProtectionHandler
    WriteByte ASMWrapper, &HC7 ' MOV
    WriteByte ASMWrapper, &H5
    WriteLong ASMWrapper, RestorePointer ' IAT Entry
    WriteLong ASMWrapper, OldAddress ' Address from EbProjectReset
    WriteJump ASMWrapper, OldAddress
End If

#End If

End Sub

#If ImplementIDEStopProtection = True Then

Private Sub ComCtlsIDEStopProtectionHandler()
On Error Resume Next
Call RemoveAllVTableSubclass(VTableInterfaceInPlaceActiveObject)
Call RemoveAllVTableSubclass(VTableInterfaceControl)
Call RemoveAllVTableSubclass(VTableInterfacePerPropertyBrowsing)
Call RemoveAllVTableSubclass(VTableInterfaceEnumeration)
Dim AppForm As Form, CurrControl As Control
For Each AppForm In Forms
    For Each CurrControl In AppForm.Controls
        Select Case TypeName(CurrControl)
            Case "Animation", "DTPicker", "MonthView", "Slider", "TabStrip", "ListView", "TreeView", "IPAddress", "ToolBar", "UpDown", "SpinBox", "Pager", "OptionButtonW", "CheckBoxW", "CommandButtonW", "TextBoxW", "HotKey", "CoolBar", "LinkLabel", "CommandLink"
                Call ComCtlsRemoveSubclass(CurrControl.hWnd)
                Call ComCtlsRemoveSubclass(CurrControl.hWndUserControl)
            Case "ProgressBar", "FrameW", "ToolTip"
                Call ComCtlsRemoveSubclass(CurrControl.hWnd)
            Case "StatusBar"
                Call ComCtlsRemoveSubclass(CurrControl.hWnd)
                Call ComCtlsRemoveSubclass(CurrControl.hWndUserControl)
                Call ComCtlsRemoveSubclass(AppForm.hWnd, ProperControlName(CurrControl))
            Case "ImageCombo"
                Call ComCtlsRemoveSubclass(CurrControl.hWnd)
                Call ComCtlsRemoveSubclass(CurrControl.hWndCombo)
                If CurrControl.hWndEdit <> 0 Then Call ComCtlsRemoveSubclass(CurrControl.hWndEdit)
                Call ComCtlsRemoveSubclass(CurrControl.hWndUserControl)
            Case "RichTextBox", "MCIWnd", "SysInfo"
                CurrControl.IDEStop ' Hidden
        End Select
    Next CurrControl
Next AppForm
If CdlFRDialogCount > 0 Then
    Dim DialogHandle() As Long
    DialogHandle() = CdlFRDialogHandle()
    Const WM_CLOSE As Long = &H10
    Dim i As Long
    For i = 0 To CdlFRDialogCount - 1
        SendMessage DialogHandle(i), WM_CLOSE, 0, ByVal 0&
        DoEvents
    Next i
End If
End Sub

Private Function HookIATEntry(ByVal Module As String, ByVal Lib As String, ByVal Fnc As String, ByVal NewAddr As Long) As Long
Dim hMod As Long, OldLibFncAddr As Long
Dim lpIAT As Long, IATLen As Long, IATPos As Long
Dim DOSHdr As IMAGE_DOS_HEADER
Dim PEHdr As IMAGE_OPTIONAL_HEADER32
hMod = GetModuleHandle(StrPtr(Module))
If hMod = 0 Then Exit Function
OldLibFncAddr = GetProcAddress(GetModuleHandle(StrPtr(Lib)), Fnc)
If OldLibFncAddr = 0 Then Exit Function
CopyMemory DOSHdr, ByVal hMod, LenB(DOSHdr)
CopyMemory PEHdr, ByVal UnsignedAdd(hMod, DOSHdr.e_lfanew), LenB(PEHdr)
Const IMAGE_NT_SIGNATURE As Long = &H4550
If PEHdr.Magic = IMAGE_NT_SIGNATURE Then
    lpIAT = PEHdr.DataDirectory(15).VirtualAddress + hMod
    IATLen = PEHdr.DataDirectory(15).Size
    IATPos = lpIAT
    Do Until CLongToULong(IATPos) >= CLongToULong(UnsignedAdd(lpIAT, IATLen))
        If DeRef(IATPos) = OldLibFncAddr Then
            VirtualProtect IATPos, 4, PAGE_EXECUTE_READWRITE, 0
            CopyMemory ByVal IATPos, NewAddr, 4
            HookIATEntry = IATPos
            Exit Do
        End If
        IATPos = UnsignedAdd(IATPos, 4)
    Loop
End If
End Function

Private Function DeRef(ByVal Addr As Long) As Long
CopyMemory DeRef, ByVal Addr, 4
End Function

Private Sub WriteJump(ByRef ASM As Long, ByRef Addr As Long)
WriteByte ASM, &HE9
WriteLong ASM, Addr - ASM - 4
End Sub

Private Sub WriteCall(ByRef ASM As Long, ByRef Addr As Long)
WriteByte ASM, &HE8
WriteLong ASM, Addr - ASM - 4
End Sub

Private Sub WriteLong(ByRef ASM As Long, ByRef Lng As Long)
CopyMemory ByVal ASM, Lng, 4
ASM = ASM + 4
End Sub

Private Sub WriteByte(ByRef ASM As Long, ByRef B As Byte)
CopyMemory ByVal ASM, B, 1
ASM = ASM + 1
End Sub

#End If
