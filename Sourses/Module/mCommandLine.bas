Attribute VB_Name = "mCommandLine"
Option Explicit

' ������ � ���������� �������
Public mbRunWithParam                    As Boolean

' �������� � ����� ������
Public mbSilentRun                       As Boolean
Public miSilentRunTimer                  As Integer
Public mbSilentDLL                       As Boolean
Public strSilentSelectMode               As String

'Api-Declare for Unicode Support for CommandLine. Writen by  Krool - http://www.vbforums.com/showthread.php?748607-Command%28%29-Unicode-aware
Private Declare Function GetCommandLine Lib "kernel32" Alias "GetCommandLineW" () As Long
Private Declare Function PathGetArgs Lib "shlwapi" Alias "PathGetArgsW" (ByVal lpszPath As Long) As Long
Private Declare Function SysReAllocString Lib "oleaut32" (ByVal pbString As Long, ByVal pszStrPtr As Long) As Long

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub CmdLineParsing
'! Description (��������)  :   [������� ������� ���������� ������ � ���������� ���������� �� ��������� ������������ �������, ����������� True ���� ��������� �����]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Public Function CmdLineParsing() As Boolean

    Dim argRetCMD    As Collection
    Dim i            As Integer
    Dim intArgCount  As Integer
    Dim strArg       As String
    Dim strArg_x()   As String
    Dim iArgRavno    As Integer
    Dim iArgDvoetoch As Integer
    Dim strArgParam  As String

    With New cCMDArguments
        .CommandLine = "CMDLineParams " & Command
        Set argRetCMD = .Arguments
        intArgCount = argRetCMD.Count
    End With

    For i = 2 To intArgCount
        strArg = argRetCMD(i)
        iArgRavno = InStr(strArg, strRavno)
        iArgDvoetoch = InStr(strArg, strColon)

        If iArgRavno Then
            strArg_x = Split(strArg, strRavno)
            strArg = strArg_x(0)
            strArgParam = strArg_x(1)
        ElseIf iArgDvoetoch Then
            strArg = Left$(argRetCMD(i), iArgDvoetoch - 1)
            strArgParam = Right$(argRetCMD(i), Len(argRetCMD(i)) - iArgDvoetoch)
        End If

        mbRunWithParam = True
        
        Select Case LCase$(strArg)

            Case "/?", "/h", "-help", "/help", "-h", "--h", "--help"
                
                ShowHelpMsg
                CmdLineParsing = True

            Case "/extractdll", "-extractdll", "--extractdll"
                
                mbSilentRun = True
                ExtractrResToFolder strArgParam
                CmdLineParsing = True

            Case "/regdll", "-regdll", "--regdll"
                
                RegisterAddComponent
                CmdLineParsing = True

            Case "/t", "-t", "--t"

                If IsNumeric(strArgParam) Then
                    miSilentRunTimer = CInt(strArgParam)
                Else
                    miSilentRunTimer = 10
                End If

                mbDebugStandart = True
                mbUpdateCheck = False

            Case "/s", "-s", "--s"

                mbSilentRun = True
                
                Select Case LCase$(strArgParam)

                    Case "n"
                        '�����
                        strSilentSelectMode = "n"

                    Case "q"
                        '���������������
                        strSilentSelectMode = "q"

                    Case "a"
                        '��� �� �������
                        strSilentSelectMode = "a"

                    Case "n2"
                        '�����
                        strSilentSelectMode = "n2"

                    Case "q2"
                        '���������������
                        strSilentSelectMode = "q2"

                    Case "a2"
                        '��� �� �������
                        strSilentSelectMode = "a2"

                    Case Else
                        '�� ���������
                        strSilentSelectMode = "n"
                End Select

                ' �� ������ ���� �� ������� ����� �������� �������
                If miSilentRunTimer <= 0 Then
                    miSilentRunTimer = 10
                End If

                mbDebugStandart = True
                mbUpdateCheck = False
                
            ' SaveSnapReport - ���������� ������ ������� � ����
            Case "/savereport", "-savereport", "--savereport"
                
                mbSilentRun = True
                ' �������� ������ �� devcon.exe � ��������� ������ �� �������
                If RunDevcon Then
                    DevParserLocalHwids2
                    CollectHwidFromReestr
                    strCompModel = GetMBInfo()
                    ' ��������� ������
                    SaveSnapReport strArgParam
                End If
                CmdLineParsing = True
                
            Case Else
            
                ShowHelpMsg
                CmdLineParsing = True

        End Select

    Next i

End Function

' (VB-Overwrite)
'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub CmdLineParsing
'! Description (��������)  :   [������� ��������� ������ ������� ���������, �������� ���������� ������� VBA.Command$()]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Public Function Command() As String
    If InIDE() = False Then
        SysReAllocString VarPtr(Command), PathGetArgs(GetCommandLine())
        Command = LTrim$(Command)
    Else
        Command = VBA.Command$()
    End If
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub ShowHelpMsg
'! Description (��������)  :   [����� ���� � ����������� �������]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub ShowHelpMsg()
    MsgBoxEx strMessages(137), vbInformation & vbOKOnly, strProductName, 25
End Sub
