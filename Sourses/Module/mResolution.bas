Attribute VB_Name = "mResolution"
Option Explicit

'���������� ��� ��������� ���������� ������
'GetDeviceCaps() ��������� �������� �������� ����� ������������ ��������� ����� ��������,
'����� ��� ���������� �� ��������� � �����������, � ����� ������� ����� � ������� ������� ����������.
'----------------------------------------------------------
'������ �� ����������� � ������
Private Const HORZRES                   As Long = 8

'������ �� ��������� � ������
Private Const VERTRES                   As Long = 10

'���-�� ��� �� �����
Private Const BITSPIXEL                 As Long = 12

Private EW                              As Long

Private Const CCDEVICENAME              As Long = 32
Private Const CCFORMNAME                As Long = 32
Private Const DM_BITSPERPEL             As Long = &H40000
Private Const DM_PELSWIDTH              As Long = &H80000
Private Const DM_PELSHEIGHT             As Long = &H100000
Private Const CDS_UPDATEREGISTRY        As Long = &H1
Private Const CDS_TEST                  As Long = &H4
Private Const DISP_CHANGE_SUCCESSFUL    As Long = 0
Private Const DISP_CHANGE_RESTART       As Long = 1

Private Type DEVMODE
    DMDeviceName                            As String * CCDEVICENAME
    DMSpecVersion                       As Integer
    DMDriverVersion                     As Integer
    DMSize                              As Integer
    DMDriverExtra                       As Integer
    DMFields                            As Long
    DMOrientation                       As Integer
    DMPaperSize                         As Integer
    DMPaperLength                       As Integer
    DMPaperWidth                        As Integer
    DMScale                             As Integer
    DMCopies                            As Integer
    DMDefaultSource                     As Integer
    DMPrintQuality                      As Integer
    DMColor                             As Integer
    DMDuplex                            As Integer
    DMYResolution                       As Integer
    DMTTOption                          As Integer
    DMCollate                           As Integer
    DMFormName                          As String * CCFORMNAME
    DMUnusedPadding                     As Integer
    DMBitsPerPel                        As Integer
    DMPelsWidth                         As Long
    DMPelsHeight                        As Long
    DMDisplayFlags                      As Long
    DMDisplayFrequency                  As Long

End Type

Private MyDevMode                       As DEVMODE
Private BackVal                         As Long

'--------------------------------------------------
'��������� ������ �������
'--------------------------------------------------
'������������� ���������
Private Const EWX_REBOOT                As Long = 2

Private Declare Function ChangeDisplaySettings _
                          Lib "user32.dll" _
                              Alias "ChangeDisplaySettingsA" (lpDevMode As Any, _
                                                              ByVal dwFlags As Long) As Long

Private Declare Function EnumDisplaySettings _
                          Lib "user32.dll" _
                              Alias "EnumDisplaySettingsA" (ByVal lpszDeviceName As String, _
                                                            ByVal iModeNum As Long, _
                                                            lpDevMode As DEVMODE) As Long

Private Declare Function GetDC Lib "user32.dll" (ByVal hWnd As Long) As Long
Private Declare Function ExitWindowsEx _
                          Lib "user32.dll" (ByVal uFlags As Long, _
                                            ByVal dwReserved As Long) As Long

Private Declare Function GetDeviceCaps _
                          Lib "gdi32.dll" (ByVal hDC As Long, _
                                           ByVal nIndex As Long) As Long

Private Declare Function GetDesktopWindow Lib "user32.dll" () As Long

'! -----------------------------------------------------------
'!  �������     :  ChangeResolution
'!  ����������  :  Width As Long, Height As Long, BitColor As Long
'!  ��������    :  ��������� �������� ���������� ��������
'! -----------------------------------------------------------
Private Sub ChangeResolution(ByVal lngWidth As Long, _
                             ByVal lngHeight As Long, _
                             ByVal BitColor As Long)

Dim iMsg                                As Long

    MyDevMode.DMSize = Len(MyDevMode)
    BackVal = EnumDisplaySettings(vbNullString, 0&, MyDevMode)

    With MyDevMode
        .DMFields = DM_PELSWIDTH Or DM_PELSHEIGHT Or DM_BITSPERPEL
        .DMPelsWidth = lngWidth
        .DMPelsHeight = lngHeight
        .DMBitsPerPel = BitColor

    End With

    'MYDEVMODE
    BackVal = ChangeDisplaySettings(MyDevMode, CDS_TEST)
    DebugMode "ResolutionChangeStatus=" & BackVal

    If BackVal <> DISP_CHANGE_SUCCESSFUL Then
        If Not mbRunWithParam Then
            MsgBox strMessages(47), 16, strProductName

        End If

    Else
        BackVal = ChangeDisplaySettings(MyDevMode, CDS_UPDATEREGISTRY)

        If Not mbRunWithParam Then

            Select Case BackVal

                Case DISP_CHANGE_SUCCESSFUL
                    MsgBox strMessages(48), 64, strProductName

                Case DISP_CHANGE_RESTART
                    iMsg = MsgBox(strMessages(49), vbQuestion, strProductName)

                    If iMsg = vbYes Then
                        EW = ExitWindowsEx(EWX_REBOOT, 0)

                        '������������
                        'ExitWindowsEx(EWX_FORCE,0) ������� ��� ���������� ��� ����������� ��������� ���������
                    End If

                Case Else
                    MsgBox strMessages(50), 16, "Oops!"

            End Select

        End If

    End If

End Sub

'! -----------------------------------------------------------
'!  �������     :  GetVideoMode
'!  ����������  :  ByRef Width As Long, ByRef Height As Long, ByRef Depth As Long
'!  ��������    :  ��������� �������� ���������� ��������
'! -----------------------------------------------------------
Private Sub GetVideoMode(ByRef lngWidth As Long, _
                         ByRef lngHeight As Long, _
                         ByRef Depth As Long)

Dim hDC                                 As Long

    hDC = GetDC(GetDesktopWindow())
    lngWidth = GetDeviceCaps(hDC, HORZRES)
    lngHeight = GetDeviceCaps(hDC, VERTRES)
    Depth = GetDeviceCaps(hDC, BITSPIXEL)
    ReleaseDC GetDesktopWindow(), hDC

End Sub

'! -----------------------------------------------------------
'!  �������     :  SetVideoMode
'!  ����������  :
'!  ��������    :  ��������� ���������� ������
'! -----------------------------------------------------------
Public Sub SetVideoMode()

Dim iXres                               As Long
Dim iYres                               As Long
Dim iColor                              As Long

    '������� ��������� ������
    GetVideoMode iXres, iYres, iColor
    DebugMode "Resolution=" & iXres & "x" & iYres & "x" & iColor

    '��������� �������� ��������, ���� ��� ������ 800/600
    If iXres < 800 Or iYres < 600 Then
        If Not mbRunWithParam Then
            If MsgBox(strMessages(51) & " " & iXres & "x" & iYres & "x" & iColor & "." & vbNewLine & strMessages(52), vbYesNo + vbQuestion + vbApplicationModal, strProductName) = vbYes Then
                ChangeResolution 800, 600, iColor
            End If

        Else
            ChangeResolution 800, 600, iColor

        End If

    End If

    GetVideoMode iXres, iYres, iColor
    If iXres <= 800 Or iYres <= 600 Then
        mbChangeResolution = True
    End If

End Sub
