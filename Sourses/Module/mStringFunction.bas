Attribute VB_Name = "mStringFunction"
Option Explicit

'******************************************************************************************************************************************************************
' Not use in project
' ��������� ����� � ������ �������� � ���
'Public Declare Function StrCmpI Lib "shlwapi.dll" Alias "StrCmpIW" (ByVal ptr1 As Long, ByVal ptr2 As Long) As Long
'Public Declare Function StrCmp Lib "shlwapi.dll" Alias "StrCmpW" (ByVal ptr1 As Long, ByVal ptr2 As Long) As Long
'Public Declare Function lstrcmp Lib "kernel32" Alias "lstrcmpW" (ByVal lpString1 As Long, ByVal lpString2 As Long) As Long
'Public Declare Function lstrcmpi Lib "kernel32" Alias "lstrcmpiW" (ByVal lpString1 As Long, ByVal lpString2 As Long) As Long
' ����������� ����� � ������ ��������
'Public Declare Function CharLower Lib "user32.dll" Alias "CharLowerA" (ByVal lpsz As String) As String
'Public Declare Function CharUpper Lib "user32.dll" Alias "CharUpperA" (ByVal lpsz As String) As String
'Public Declare Function CharLowerW Lib "user32.dll" Alias "CharLowerW" (ByVal lpsz As Long) As Long
'Public Declare Function CharUpperW Lib "user32.dll" Alias "CharUpperW" (ByVal lpsz As Long) As Long
'Private Declare Function lstrcat Lib "kernel32.dll" Alias "lstrcatA" (ByVal lpString1 As String, ByVal lpString2 As String) As Long
'******************************************************************************************************************************************************************

Public Const str2vbNullChar     As String = vbNullChar & vbNullChar
Public Const str2vbNewLine      As String = vbNewLine & vbNewLine
Public Const str2VbTab          As String = vbTab & vbTab
Public Const str3VbTab          As String = vbTab & vbTab & vbTab
Public Const str4VbTab          As String = vbTab & vbTab & vbTab & vbTab
Public Const str5VbTab          As String = vbTab & vbTab & vbTab & vbTab & vbTab
Public Const str6VbTab          As String = vbTab & vbTab & vbTab & vbTab & vbTab & vbTab
Public Const str7VbTab          As String = vbTab & vbTab & vbTab & vbTab & vbTab & vbTab & vbTab
Public Const str8VbTab          As String = vbTab & vbTab & vbTab & vbTab & vbTab & vbTab & vbTab & vbTab
Public Const strPercent         As String = "%"
Public Const strColon           As String = ":"
Public Const strSemiColon       As String = ";"
Public Const strComma           As String = ","
Public Const strDot             As String = "."
Public Const str2Dot            As String = ".."
Public Const vbDot              As Integer = 46
Public Const strVopros          As String = "?"
Public Const strVosklicanie     As String = "!"
Public Const strRavno           As String = "="
Public Const strDash            As String = "-"
Public Const strQuotes          As String = """" 'ChrW$(34)
Public Const strSpace           As String = " "
Public Const str2Space          As String = "  "
Public Const str3Space          As String = "   "
Public Const strUnknownLCase    As String = "unknown"
Public Const strUnknownUCase    As String = "UNKNOWN"

Private Const bVopros           As Byte = 63 ' "?"

Public Enum eVerCompareResult
    crUnknownVer = -2&
    crLessVer = -1&
    crEqualVer = 0&
    crGreaterVer = 1&
End Enum

Private Declare Function lstrlenW Lib "kernel32.dll" (ByVal lpString As Long) As Long
Private Declare Function MultiByteToWideChar Lib "kernel32.dll" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpMultiByteStr As Long, ByVal cchMultiByte As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long) As Long
Private Declare Function SysAllocStringLen Lib "oleaut32.dll" (ByVal Ptr As Long, ByVal Length As Long) As Long
Private Declare Function WideCharToMultiByte Lib "kernel32.dll" (ByVal CodePage As Long, ByVal dwFlags As Long, ByVal lpWideCharStr As Long, ByVal cchWideChar As Long, ByVal lpMultiByteStr As Long, ByVal cchMultiByte As Long, ByVal lpDefaultChar As Long, lpUsedDefaultChar As Long) As Long
Private Declare Sub PutMem4 Lib "msvbvm60.dll" (ByVal Ptr As Long, ByVal Value As Long)

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function AppendStr
'! Description (��������)  :   [��������� ������ � ������ � ������ ������������]
'! Parameters  (����������):   strHead (String)
'                              strAdd (String)
'                              strSep (String = " ")
'!--------------------------------------------------------------------------------
Public Sub AppendStr(ByRef strHead As String, ByVal strAdd As String, Optional ByVal strSep As String = strSpace)

    If LenB(strAdd) Then
        If LenB(strHead) Then
            strHead = strHead & (strSep & strAdd)
        Else
            strHead = strAdd
        End If

    Else
        strHead = strHead & strSep
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub ByteArray2Str
'! Description (��������)  :   [����������� ���� ������� � ������]
'! Parameters  (����������):   StringIn (String)
'                              ByteArray() (Byte)
'!--------------------------------------------------------------------------------
Private Sub ByteArray2Str(sStringOut As String, ByteArray() As Byte)
    sStringOut = StrConv(ByteArray(), vbUnicode)
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function CompareByDate
'! Description (��������)  :   [Check if date1 newer than date2]
'! Parameters  (����������):   Date1 (String)
'                              Date2 (String)
'                              strResult (ByRef String)
'!--------------------------------------------------------------------------------
Public Function CompareByDate(ByVal Date1 As String, ByVal Date2 As String, Optional ByRef strResult As String) As eVerCompareResult

    Dim objRegExp    As RegExp
    Dim objMatch     As Match
    Dim objMatches   As MatchCollection
    Dim m1           As Integer
    Dim M2           As Integer
    Dim d1           As Integer
    Dim d2           As Integer
    Dim Y1           As Integer
    Dim Y2           As Integer
    Dim strDate1     As String
    Dim strDate2     As String
    Dim strDate1_x() As String
    Dim strDate2_x() As String
    Dim lngResult As eVerCompareResult
    
    If mbDebugDetail Then DebugMode str8VbTab & "CompareByDate: " & Date1 & " compare with " & Date2

    If InStr(Date1, strUnknownLCase) = 0 Then
        If InStr(Date1, strComma) Then
            strDate1_x = Split(Trim$(Date1), strComma)
            Date1 = strDate1_x(0)
        End If

        If InStr(Date2, strComma) Then
            strDate2_x = Split(Trim$(Date2), strComma)
            Date2 = strDate2_x(0)
        End If

        Set objRegExp = New RegExp

        With objRegExp
            .Pattern = "(\d+).(\d+).(\d+)"
            .IgnoreCase = True
            .Global = True
        End With

        '�������� date1
        Set objMatches = objRegExp.Execute(Date1)

        If objMatches.Count Then
            Set objMatch = objMatches.Item(0)
            With objMatch
                m1 = .SubMatches(0)
                d1 = .SubMatches(1)
                Y1 = .SubMatches(2)
            End With
        End If

        '�������� date2
        Set objMatches = objRegExp.Execute(Date2)

        If objMatches.Count Then
            Set objMatch = objMatches.Item(0)
            With objMatch
                M2 = .SubMatches(0)
                d2 = .SubMatches(1)
                Y2 = .SubMatches(2)
            End With
        End If
        
        If mbDateFormatRus Then
            strDate1 = Y1 & strDot & d1 & strDot & m1
            strDate2 = Y2 & strDot & d2 & strDot & M2
        Else
            strDate1 = Y1 & strDot & m1 & strDot & d1
            strDate2 = Y2 & strDot & M2 & strDot & d2
        End If

        lngResult = CompareByVersion(strDate1, strDate2)
    Else
        lngResult = crUnknownVer
    End If

    CompareByDate = lngResult
    strResult = VBA.Choose(lngResult + 3, "?", "<", "=", ">")
    If mbDebugStandart Then DebugMode str8VbTab & "CompareByDate-Result: " & Date1 & strSpace & strResult & strSpace & Date2
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function CompareByVersion
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   strVersionBD (String)
'                              strVersionLocal (String)
'!--------------------------------------------------------------------------------
Public Function CompareByVersion(ByVal strVersionBD As String, ByVal strVersionLocal As String, Optional ByRef strResult As String) As eVerCompareResult

    Dim strDevVer_x()       As String
    Dim strDevVerLocal_x()  As String
    Dim strDevVer_xx        As String
    Dim strDevVerLocal_xx   As String
    Dim strVersionBD_x()    As String
    Dim strVersionLocal_x() As String
    Dim i                   As Integer
    Dim lngResult           As eVerCompareResult

    lngResult = crUnknownVer

    strVersionBD = Trim$(strVersionBD)
    strVersionLocal = Trim$(strVersionLocal)
    If InStr(strVersionBD, strUnknownLCase) = 0 Then
        If InStr(strVersionLocal, strUnknownLCase) = 0 Then
            
            If InStr(strVersionBD, strComma) Then
                strDevVer_x = Split(strVersionBD, strComma)
                strDevVer_xx = LTrim$(strDevVer_x(1))
            Else
                lngResult = crLessVer
                strDevVer_xx = strVersionBD
            End If
            
            If InStr(strVersionLocal, strComma) Then
                strDevVerLocal_x = Split(strVersionLocal, strComma)
                strDevVerLocal_xx = LTrim$(strDevVerLocal_x(1))
            Else
                lngResult = crGreaterVer
                strDevVerLocal_xx = strVersionLocal
            End If

            If LenB(strDevVerLocal_xx) Then
            
                If LenB(strDevVer_xx) Then
                    If AscW(Right$(strDevVer_xx, 1)) = vbDot Then
                        strDevVer_xx = Left$(strDevVer_xx, Len(strDevVer_xx) - 1)
                    End If
                End If
                
                If AscW(Right$(strDevVerLocal_xx, 1)) = vbDot Then
                    strDevVer_xx = Left$(strDevVerLocal_xx, Len(strDevVerLocal_xx) - 1)
                End If
            
                strVersionBD_x = Split(strDevVer_xx, strDot)
                strVersionLocal_x = Split(strDevVerLocal_xx, strDot)
                
                If UBound(strVersionBD_x) > UBound(strVersionLocal_x) Then

                    For i = 0 To UBound(strVersionLocal_x)

                        If IsNumeric(strVersionBD_x(i)) Then
                            If IsNumeric(strVersionLocal_x(i)) Then
                                If CLng(strVersionBD_x(i)) < CLng(strVersionLocal_x(i)) Then
                                    lngResult = crLessVer

                                    Exit For

                                ElseIf CLng(strVersionBD_x(i)) > CLng(strVersionLocal_x(i)) Then
                                    lngResult = crGreaterVer

                                    Exit For

                                Else

                                    If i = UBound(strVersionBD_x) Then
                                        lngResult = crEqualVer
                                    End If
                                End If
                            End If

                        Else
                            lngResult = crUnknownVer
                        End If

                    Next

                Else

                    For i = 0 To UBound(strVersionBD_x)

                        If IsNumeric(strVersionBD_x(i)) Then
                            If IsNumeric(strVersionLocal_x(i)) Then
                                If CLng(strVersionBD_x(i)) < CLng(strVersionLocal_x(i)) Then
                                    lngResult = crLessVer

                                    Exit For

                                ElseIf CLng(strVersionBD_x(i)) > CLng(strVersionLocal_x(i)) Then
                                    lngResult = crGreaterVer

                                    Exit For

                                Else

                                    If i = UBound(strVersionBD_x) Then
                                        lngResult = crEqualVer
                                    End If
                                End If
                            End If

                        Else
                            lngResult = crUnknownVer
                        End If

                    Next

                End If

            Else
                lngResult = crUnknownVer
            End If

        Else
            lngResult = crGreaterVer
        End If

    Else
        lngResult = crUnknownVer
    End If

CompareFinish:
    CompareByVersion = lngResult
    strResult = VBA.Choose(lngResult + 3, "?", "<", "=", ">")
    If mbDebugDetail Then DebugMode str8VbTab & "CompareByVersion-Result: " & strVersionBD & strSpace & strResult & strSpace & strVersionLocal
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub ConvertDate2Rus
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   dtDate (String)
'!--------------------------------------------------------------------------------
Public Sub ConvertDate2Rus(ByRef dtDate As String)

    Dim DD         As String
    Dim MM         As String
    Dim YYYY       As String
    Dim objRegExp  As RegExp
    Dim objMatch   As Match
    Dim objMatches As MatchCollection

    If LenB(dtDate) Then
        If InStr(dtDate, strUnknownLCase) = 0 Then
            Set objRegExp = New RegExp

            With objRegExp
                .Pattern = "(\d+).(\d+).(\d+)"
                .IgnoreCase = True
                .Global = True
            End With

            '�������� date1
            Set objMatches = objRegExp.Execute(dtDate)

            With objMatches

                If .Count Then
                    Set objMatch = .Item(0)
                    MM = Format$(objMatch.SubMatches(0), "00")
                    DD = Format$(objMatch.SubMatches(1), "00")
                    YYYY = DateTime.Year(dtDate)
                End If

            End With

            ' ���� ���������� �������������� ���� � ������ dd/mm/yyyy
            If mbDateFormatRus Then
                dtDate = DD & "/" & MM & "/" & YYYY
            Else
                dtDate = MM & "/" & DD & "/" & YYYY
            End If
        End If
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function ConvertString
'! Description (��������)  :   [�������� � ������ ��������� ������� RegExp �� ��������� VB]
'! Parameters  (����������):   strStringText (String)
'!--------------------------------------------------------------------------------
Public Function ConvertString(ByVal strStringText As String) As String

    If InStr(strStringText, "\t") Then
        strStringText = Replace$(strStringText, "\t", vbTab)
    End If

    If InStr(strStringText, "\r\n") Then
        strStringText = Replace$(strStringText, "\r\n", vbNewLine)
    End If

    If InStr(strStringText, "\r") Then
        strStringText = Replace$(strStringText, "\r", vbCr)
    End If

    If InStr(strStringText, "\n") Then
        strStringText = Replace$(strStringText, "\n", vbLf)
    End If

    ConvertString = strStringText
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub ConvertVerByDate
'! Description (��������)  :   [Convert]
'! Parameters  (����������):   strVersion1 (String)
'!--------------------------------------------------------------------------------
Public Sub ConvertVerByDate(ByRef strVersion As String)

    Dim strVer     As String
    Dim strVer_x() As String

    If LenB(strVersion) Then
        If InStr(strVersion, strUnknownLCase) = 0 Then
            If InStr(strVersion, strComma) Then
                strVer_x = Split(strVersion, strComma)
                strVersion = strVer_x(0)
                strVer = strVer_x(1)
            End If

            ConvertDate2Rus strVersion
            strVersion = strVersion & strComma & strVer
        End If
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub DelSpaceAfterZPT
'! Description (��������)  :   [�������� �������� ����� ������� � ������ � ������� ��������]
'! Parameters  (����������):   strVersion (String)
'!--------------------------------------------------------------------------------
Public Sub DelSpaceAfterZPT(ByRef strVersion As String)

    If InStr(strVersion, ",   ") Then
        strVersion = Replace$(strVersion, ",   ", strComma)
    End If

    If InStr(strVersion, ",  ") Then
        strVersion = Replace$(strVersion, ",  ", strComma)
    End If

    If InStr(strVersion, ", ") Then
        strVersion = Replace$(strVersion, ", ", strComma)
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub RemoveUni
'! Description (��������)  :   [�������� Unicode ��������]
'! Parameters  (����������):   sStr (String)
'!--------------------------------------------------------------------------------
Public Sub RemoveUni(ByRef sStr As String)
    Dim i       As Long
    Dim bLen    As Long
    Dim Map()   As Byte
 
    If LenB(sStr) Then
        Map = sStr
        bLen = UBound(Map)
        For i = 1 To bLen Step 2
            'Is Unicode
            If Map(i) Then
                 'Clear upper byte
                Map(i) = 0
                 'Replace low byte
                Map(i - 1) = bVopros
            End If
        Next
        sStr = Map
    End If
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function ReplaceBadSymbol
'! Description (��������)  :   [������� ������ ������� �� ������]
'! Parameters  (����������):   strString (String)
'!--------------------------------------------------------------------------------
Public Sub ReplaceBadSymbol(ByRef strString As String)

    ' ������� ������ vbNullChar
    If InStr(strString, vbNullChar) Then
         strString = TrimNull(strString)
    End If
    
    ' ������� ������ ","
    If InStr(strString, strComma) Then
        strString = Replace$(strString, strComma, strSpace)
    End If

    ' ������� ������ "*"
    If InStr(strString, "*") Then
        strString = Replace$(strString, "*", vbNullString)
    End If

    ' ������� ������ "!"
    If InStr(strString, strVosklicanie) Then
        strString = Replace$(strString, strVosklicanie, vbNullString)
    End If

    ' ������� ������ "@"
    If InStr(strString, "@") Then
        strString = Replace$(strString, "@", vbNullString)
    End If

    ' ������� ������ "#"
    If InStr(strString, "#") Then
        strString = Replace$(strString, "#", vbNullString)
    End If

    ' ������� ������ "�"
    If InStr(strString, "�") Then
        strString = Replace$(strString, "�", vbNullString)
    End If

    ' ������� ������ "�"
    If InStr(strString, "�") Then
        strString = Replace$(strString, "�", vbNullString)
    End If

    ' ������� ������ "?"
    If InStr(strString, strVopros) Then
        strString = Replace$(strString, strVopros, vbNullString)
    End If

    ' ������� ������ ";"
    If InStr(strString, strSemiColon) Then
        strString = Replace$(strString, strSemiColon, vbNullString)
    End If

    ' ������� ������ ":"
    If InStr(strString, strColon) Then
        strString = Replace$(strString, strColon, vbNullString)
    End If

    ' ������� ������ "   "
    If InStr(strString, str3Space) Then
        strString = Replace$(strString, str3Space, strSpace)
    End If

    ' ������� ������ "  "
    If InStr(strString, str2Space) Then
        strString = Replace$(strString, str2Space, strSpace)
    End If

    strString = Trim$(strString)
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Str2ByteArray
'! Description (��������)  :   [����������� ������ � ���� ������]
'! Parameters  (����������):   StringIn (String)
'                              ByteArray() (Byte)
'!--------------------------------------------------------------------------------
Private Sub Str2ByteArray(sStringIn As String, ByteArray() As Byte)
    ByteArray = StrConv(sStringIn, vbFromUnicode)
End Sub

Private Function StrConvFromUTF8(ByVal Text As String) As String

    Dim lngLen As Long
    Dim lngPtr As Long
    
    ' get length
    lngLen = LenB(Text)
    ' has any?
    If lngLen Then
        ' create a BSTR over twice that length
        lngPtr = SysAllocStringLen(0, lngLen * 1.25)
        ' place it in output variable
        PutMem4 VarPtr(StrConvFromUTF8), lngPtr
        ' convert & get output length
        lngLen = MultiByteToWideChar(65001, 0, ByVal StrPtr(Text), lngLen, ByVal lngPtr, LenB(StrConvFromUTF8))
        ' resize the buffer
        StrConvFromUTF8 = Left$(StrConvFromUTF8, lngLen)
    End If
End Function

Private Function StrConvToUTF8(ByVal Text As String) As String

    Dim lngLen As Long
    Dim lngPtr As Long
    
    ' get length
    lngLen = LenB(Text)
    ' has any?
    If lngLen Then
        ' create a BSTR over twice that length
        lngPtr = SysAllocStringLen(0, lngLen * 1.25)
        ' place it in output variable
        PutMem4 VarPtr(StrConvToUTF8), lngPtr
        ' convert & get output length
        lngLen = WideCharToMultiByte(65001, 0, ByVal StrPtr(Text), Len(Text), ByVal lngPtr, LenB(StrConvToUTF8), ByVal 0&, ByVal 0&)
        ' resize the buffer
        StrConvToUTF8 = LeftB$(StrConvToUTF8, lngLen)
    End If
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function TrimNull
'! Description (��������)  :   [�������� �������� �� ������ ������]
'! Parameters  (����������):   startstr (String)
'!--------------------------------------------------------------------------------
Public Function TrimNull(ByVal startstr As String) As String
    Dim lngPtr As Long
    
    lngPtr = lstrlenW(StrPtr(startstr))
    TrimNull = Left$(startstr, lngPtr)
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function FillNullChar
'! Description (��������)  :   [�������� �������� �� ������ ������]
'! Parameters  (����������):   lLen (Long)
'!--------------------------------------------------------------------------------
Public Function FillNullChar(ByVal lLen As Long) As String
    FillNullChar = MemAPIs.AllocStr(vbNullString, lLen)
    MemAPIs.ZeroMemByV StrPtr(FillNullChar), lLen + lLen
End Function
