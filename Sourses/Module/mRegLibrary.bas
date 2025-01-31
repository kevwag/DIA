Attribute VB_Name = "mRegLibrary"
Option Explicit

#Const mbIDE_DBSProject = False

' ���������� ����������� ������� �����������
'TabCtl32.ocx
Private Const strTabCtl32Reference As String = "{BDC217C8-ED16-11CD-956C-0000C04E4C0A}"
Private Const strTabCtl32Ver       As String = "1.1"
Private Const strTabCtl32VerDll    As String = "6.1.98.16"

'MSFLXGRD.ocx
Private Const strMSFLXGRDReference As String = "{5E9E78A0-531B-11CF-91F6-C2863C385E30}"
Private Const strMSFLXGRDVer       As String = "1.0"
Private Const strMSFLXGRDVerDll    As String = "6.1.98.14"

'VBScript.dll
Private Const strVBScriptReference As String = "{3F4DACA7-160D-11D2-A8E9-00104B365C9F}"
Private Const strVBScriptVer       As String = "5.5"
Private Const strVBScriptVerDll    As String = "5.8.6001.18700"

' Not add to project (if not DBS) - option for compile
#If mbIDE_DBSProject Then
    'Capicom.dll
    Private Const strCAPICOMReference  As String = "{BD26B198-EE42-4725-9B23-AFA912434229}"
    Private Const strCAPICOMVer        As String = "2.1"
    Private Const strCAPICOMVerDll     As String = "2.1.0.2"
#End If

'Windows Script 5.7
'XP - http://www.microsoft.com/downloads/details.aspx?displaylang=en&FamilyID=47809025-d896-482e-a0d6-524e7e844d81
'2003 - http://www.microsoft.com/downloads/details.aspx?familyid=F00CB8C0-32E9-411D-A896-F2CD5EF21EB4&displaylang=en
'2000 - http://www.microsoft.com/downloads/details.aspx?familyid=C03D3E49-B40E-4CA1-A0C7-CC135EC4D2BE&displaylang=en
'http://support.microsoft.com/?kbid=951978

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function APIFunctionPresent
'! Description (��������)  :   [�������� �� ��������� ������� Api � ������� �����]
'! Parameters  (����������):   FunctionName (String)
'                              DLLName (String)
'!--------------------------------------------------------------------------------
Public Function APIFunctionPresent(ByVal FunctionName As String, ByVal DLLName As String) As Boolean

    Dim lHandle   As Long
    Dim lAddr     As Long
    Dim FreeLib   As Boolean
    Dim lngStrPtr As Long

    lngStrPtr = StrPtr(DLLName)
    lHandle = GetModuleHandle(lngStrPtr)

    If lHandle = 0 Then
        lHandle = LoadLibraryEx(lngStrPtr, 0&, DONT_RESOLVE_DLL_REFERENCES)
        FreeLib = True
    End If

    If lHandle <> 0 Then
        lAddr = GetProcAddress(lHandle, FunctionName)

        If FreeLib Then
            FreeLibrary lHandle
        End If
    End If

    APIFunctionPresent = (lAddr <> 0)
    If mbDebugDetail Then DebugMode vbTab & "APIFunctionPresent: " & FunctionName & strRavno & APIFunctionPresent
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function DLLOCX
'! Description (��������)  :   [����������� ���������� ActiveX ��� ������������� (���� ������� �� ��������)]
'! Parameters  (����������):   lngHWnd (Long)
'                              Path (String)
'                              mbRegister (Boolean)
'!--------------------------------------------------------------------------------
Private Function DLLOCX(ByVal lngHWnd As Long, ByVal Path As String, ByVal mbRegister As Boolean) As Boolean

    Dim lb As Long
    Dim PA As Long

    On Error Resume Next

    lb = LoadLibrary(StrPtr(Path))

    If Not lb = 0 Then
        If mbRegister Then
            PA = GetProcAddress(lb, "DllRegisterServer")
        Else
            PA = GetProcAddress(lb, "DllUnregisterServer")
        End If

        If PA = 0 Then
            GoTo FreeLib
        End If

        CallWindowProc PA, lngHWnd, ByVal 0&, ByVal 0&, ByVal 0&
        DLLOCX = True

FreeLib:
        FreeLibrary lb

        On Error GoTo FreeLib

    End If

End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub RegisterAddComponent
'! Description (��������)  :   [����������� ������� ���������]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Public Function RegisterAddComponent() As Boolean
    
    Dim lngRet As Long

    If mbDebugDetail Then DebugMode "RegisterAddComponent - Start"

    RegisterAddComponent = True
    
    lngRet = RegOCX(strWorkTempBackSL & "TabCtl32.OCX", strTabCtl32Reference, strTabCtl32Ver, strTabCtl32VerDll)
    If lngRet = 0 Then
        If MsgBox("System OCX or DLL: 'TabCtl32.OCX'" & str2vbNewLine & strMessages(8), vbYesNo + vbQuestion, strProductName) = vbNo Then

            RegisterAddComponent = False
            Exit Function

        End If
    ElseIf lngRet = -1 Then
        RegisterAddComponent = False
    End If

    If mbDebugStandart Then DebugMode "RegisterAddComponent - *****************Check Next File********************"

    lngRet = RegOCX(strWorkTempBackSL & "MSFLXGRD.OCX", strMSFLXGRDReference, strMSFLXGRDVer, strMSFLXGRDVerDll)
    If lngRet = 0 Then
        If MsgBox("System OCX or DLL: 'MSFLXGRD.OCX'" & str2vbNewLine & strMessages(8), vbYesNo + vbQuestion, strProductName) = vbNo Then

            RegisterAddComponent = False
            Exit Function

        End If
    ElseIf lngRet = -1 Then
        RegisterAddComponent = False
    End If

    If mbDebugStandart Then DebugMode "RegisterAddComponent - *****************Check Next File********************"

    lngRet = RegOCX(strWorkTempBackSL & "vbscript.dll", strVBScriptReference, strVBScriptVer, strVBScriptVerDll)
    If lngRet = 0 Then
        If MsgBox("System OCX or DLL: 'vbscript.dll'" & str2vbNewLine & strMessages(8), vbYesNo + vbQuestion, strProductName) = vbNo Then

            RegisterAddComponent = False
            Exit Function

        End If
    ElseIf lngRet = -1 Then
        RegisterAddComponent = False
    End If

    ' Not add to project (if not DBS) - option for compile
    #If mbIDE_DBSProject Then
        If mbDebugStandart Then DebugMode "RegisterAddComponent - *****************Check Next File********************"
    
        lngRet = RegOCX(strWorkTempBackSL & "capicom.dll", strCAPICOMReference, strCAPICOMVer, strCAPICOMVerDll)
        If lngRet = 0 Then
            If MsgBox("System DLL: 'capicom.dll'" & str2vbNewLine & strMessages(8), vbYesNo + vbQuestion, strProductName) = vbNo Then
                
                RegisterAddComponent = False
                Exit Function
                
            End If
        ElseIf lngRet = -1 Then
            RegisterAddComponent = False
        End If
    #End If
    
    If mbDebugStandart Then DebugMode "RegisterAddComponent - Finish"
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function RegOCX
'! Description (��������)  :   [������� ����������� �������� ����������]
'! Parameters  (����������):   strPathOcx (String)
'                              strReference (String)
'                              strVerOcx (String)
'                              strVerFileOcx (String)
'!--------------------------------------------------------------------------------
Public Function RegOCX(ByVal strPathOcx As String, ByVal strReference As String, ByVal strVerOcx As String, ByVal strVerFileOcx As String) As Long

    Dim strPathOcxSystem        As String
    Dim strPathOcxSystemSPFiles As String
    Dim strPathOcxSystemCache   As String
    Dim strOCXFileName          As String
    Dim strVersionFile          As String
    Dim mbForceReg              As Boolean
    Dim lngMsgRet               As Integer

    regParam = LCase$(GetRegString(HKEY_CLASSES_ROOT, "TypeLib\" & strReference & vbBackslash & strVerOcx & "\0\win32", vbNullString))
    strOCXFileName = GetFileNameFromPath(strPathOcx)
    If mbDebugStandart Then DebugMode vbTab & strReference & ": Path to " & strOCXFileName & " from Reestr: " & regParam
    
    strPathOcxSystem = strWinDir & "system32\" & strOCXFileName
    strPathOcxSystemCache = strWinDir & "system32\dllcache\" & strOCXFileName
    strPathOcxSystemSPFiles = strWinDir & "ServicePackFiles\i386\" & strOCXFileName

    If InStr(regParam, "vbscript.dll\3") Then
        regParam = Replace$(regParam, "vbscript.dll\3", "vbscript.dll")
    End If

    If PathExists(regParam) = False Then
        If InStr(regParam, "vbscript.dll\3") = 0 Then
            If PathExists(strPathOcxSystem) = False Or LenB(regParam) = 0 Then

StartRegOCXForce:

                If GetBinaryFileFromResource(strPathOcx, "OCX_" & GetFileName_woExt(strOCXFileName), "CUSTOM") Then
                    If mbDebugStandart Then DebugMode vbTab & strReference & ": BinaryFileFromResourse: True"

                    '�������������� ����� ��� �������������
                    If mbForceReg Then
                        RegOCX = DLLOCX(0, regParam, False)
                        If mbDebugStandart Then DebugMode vbTab & strReference & ": Unregistred old dll: " & RegOCX
                    End If

                    '�������� ����� ���� � ������� � ��������� ���
                    If StrComp(GetFileNameExtension(strPathOcx), "dll", vbTextCompare) = 0 Then
                        If PathExists(strPathOcxSystemSPFiles) Then
                            If CopyFileTo(strPathOcx, strPathOcxSystemSPFiles) = False Then
                                RegOCX = 0
                                If mbDebugStandart Then DebugMode vbTab & strReference & ": CopyOcxFileToServicePackFiles: False: " & strPathOcxSystemSPFiles

                                Exit Function

                            Else
                                If mbDebugStandart Then DebugMode vbTab & strReference & ": CopyOcxFileToServicePackFiles: True: " & strPathOcxSystemSPFiles
                            End If
                        End If

                        If PathExists(strPathOcxSystemCache) Then
                            If CopyFileTo(strPathOcx, strPathOcxSystemCache) = False Then
                                RegOCX = 0
                                If mbDebugStandart Then DebugMode vbTab & strReference & ": CopyOcxFileToSystemCache: False: " & strPathOcxSystemCache

                                Exit Function

                            Else
                                If mbDebugStandart Then DebugMode vbTab & strReference & ": CopyOcxFileToSystemCache: True: " & strPathOcxSystemCache
                            End If
                        End If
                    End If

                    '�������� ����� ���� � �������
                    If CopyFileTo(strPathOcx, strPathOcxSystem) = False Then
                        RegOCX = 0
                        If mbDebugStandart Then DebugMode vbTab & strReference & ": CopyOcxFileToSystem: False: " & strPathOcxSystem

                        Exit Function

                    Else
                        If mbDebugStandart Then DebugMode vbTab & strReference & ": CopyOcxFileToSystem: True: " & strPathOcxSystem
                    End If

                    strPathOcx = strPathOcxSystem
                Else
                    RegOCX = 0
                    If mbDebugStandart Then DebugMode vbTab & strReference & ": BinaryFileFromResourse: False"

                    Exit Function

                End If
            End If

            If mbDebugStandart Then DebugMode vbTab & strReference & ": Registration in system"
            RegOCX = DLLOCX(0, strPathOcxSystem, True)
        Else
            RegOCX = 1
            regParam = Replace$(regParam, "vbscript.dll\3", "vbscript.dll")

            If PathExists(regParam) Then
                ' ���������� ������ ���������
                strVersionFile = GetFileVersionOnly(regParam)

                '��������� ���������� ����������, ���� ����� ���� 2003
                If InStr(regParam, "vbscript.dll") Then
                    If OSCurrVersionStruct.VerFull >= "6.0" Or mbIsWin64 Then
                        If mbDebugStandart Then DebugMode vbTab & strReference & ": Update file for your operating system does not provide"

                        Exit Function

                    End If
                End If

                
                ' ������ ����� ���������
                If CompareByVersion(strVersionFile, strVerFileOcx) = crLessVer Then
                    If Not mbRunWithParam Then
                        If mbSilentDLL Then
                            lngMsgRet = vbYes
                        Else
                            lngMsgRet = MsgBox("System OCX or DLL:" & strPathOcxSystem & vbNewLine & strVersionFile & " < " & strVerFileOcx & str2vbNewLine & strMessages(106), vbYesNoCancel + vbQuestion, strProductName)
                        End If

                        If lngMsgRet = vbYes Then
                            mbForceReg = True
                            GoTo StartRegOCXForce
                        ElseIf lngMsgRet = vbNo Then

                            RegOCX = 0
                            Exit Function

                        Else

                            RegOCX = -1
                            Exit Function

                        End If

                    Else
                        mbForceReg = True
                        GoTo StartRegOCXForce
                    End If
                End If
            End If
        End If

    Else
        RegOCX = 1

        If PathExists(regParam) Then
            If LenB(regParam) Then
                ' ���������� ������ ���������
                strVersionFile = GetFileVersionOnly(regParam)

                '��������� ���������� ����������, ���� ����� ���� 2003 ��� 64x
                If InStr(regParam, "vbscript.dll") Then
                    If OSCurrVersionStruct.VerFull >= "6.0" Or mbIsWin64 Then
                        If mbDebugStandart Then DebugMode vbTab & strReference & ": Update file for your operating system does not provide"

                        Exit Function

                    End If
                End If

                ' ������ ����� ���������
                If CompareByVersion(strVersionFile, strVerFileOcx) = crLessVer Then
                    If Not mbRunWithParam Then
                        If mbSilentDLL Then
                            lngMsgRet = vbYes
                        Else
                            lngMsgRet = MsgBox("System OCX or DLL:" & strPathOcxSystem & vbNewLine & strVersionFile & " < " & strVerFileOcx & str2vbNewLine & strMessages(106), vbYesNoCancel + vbQuestion, strProductName)
                        End If

                        If lngMsgRet = vbYes Then
                            mbForceReg = True
                            GoTo StartRegOCXForce
                        ElseIf lngMsgRet = vbNo Then

                            RegOCX = 0
                            Exit Function

                        Else

                            RegOCX = -1
                            Exit Function

                        End If

                    Else
                        mbForceReg = True
                        GoTo StartRegOCXForce
                    End If
                End If
            End If
        End If

        If mbDebugStandart Then DebugMode vbTab & strReference & ": is already present in system - File version: " & strVersionFile
    End If

    If mbDebugStandart Then DebugMode vbTab & strReference & ": Result=" & RegOCX
End Function
