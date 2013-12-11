Attribute VB_Name = "mFindFile"
Option Explicit

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Copyright �1996-2009 VBnet, Randy Birch, All Rights Reserved.
' Some pages may also contain other copyrights by the author.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
' Distribution: You can freely use this code in your own
'               applications, but you may not reproduce
'               or publish this code on any web site,
'               online service, or distribute as source
'               on any media without express permission.
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
Private fp                              As FILE_PARAMS    'holds search parameters
Private fp2                             As FOLDER_PARAMS    'holds search parameters
Private sResultFileList()               As String
Private sResultFileListCount            As Long
Private sResultFolderList()             As String
Private sResultFolderListCount          As Long

Public Function FileSizeApi(sSource As String) As String

Dim wfd                                 As WIN32_FIND_DATA
Dim hFile                               As Long
Dim sSize                               As String

    If PathIsUNC(sSource) = 0 Then
        hFile = FindFirstFile(StrPtr("\\?\" & sSource & vbNullChar), wfd)
    Else
        '\\?\UNC\
        hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sSource, Len(sSource) - 2) & vbNullChar), wfd)
    End If


    If hFile <> INVALID_HANDLE_VALUE Then
        sSize = String$(30, vbNullChar)
        If InStr(1, sSource, TrimNull(wfd.cFileName), vbTextCompare) Then
            StrFormatByteSizeW wfd.nFileSizeLow, wfd.nFileSizeHigh, ByVal StrPtr(sSize), 30
            FileSizeApi = TrimNull(sSize)
        Else
            FileSizeApi = "0 byte"
        End If
    End If

    FindClose hFile

End Function

' �������� �� ������������ �������� ������
Public Function MatchSpec(sFile As String, sSpec As String) As Boolean

    If LenB(sSpec) > 0 Then
        MatchSpec = PathMatchSpec(StrPtr(sFile & vbNullChar), StrPtr(sSpec & vbNullChar))
    End If

End Function

Public Function rgbCopyFiles(ByVal sSourcePath As String, _
                             ByVal sDestination As String, _
                             ByVal sFiles As String) As Long

Dim wfd                                 As WIN32_FIND_DATA
Dim sA                                  As SECURITY_ATTRIBUTES
Dim hFile                               As Long
Dim bNext                               As Long
Dim copied                              As Long
Dim currFile                            As String
Dim currSourcePath                      As String
Dim lngNumFilesFromFolder               As Long

    sSourcePath = BackslashAdd2Path(sSourcePath)
    sDestination = BackslashAdd2Path(sDestination)

    'Create the target directory if it doesn't exist
    If PathFileExists(sDestination) = 0 Then
        Call CreateDirectory(sDestination, sA)

    End If

    'Start searching for files in the Target directory.
    'hFile = FindFirstFile(sSourcePath & sFiles, wfd)
    'hFile = FindFirstFile(StrPtr("\\?\" & sSourcePath & sFiles & vbNullChar), wfd)
    If PathIsUNC(sSourcePath) = 0 Then
        hFile = FindFirstFile(StrPtr("\\?\" & sSourcePath & sFiles & vbNullChar), wfd)
    Else
        '\\?\UNC\
        hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sSourcePath, Len(sSourcePath) - 2) & sFiles & vbNullChar), wfd)
    End If

    If (hFile = INVALID_HANDLE_VALUE) Then
        'nothing to do, so bail out
        DebugMode str2VbTab & "CopyAllFilesFromFolder: " & sSourcePath & " No " & sFiles & " files found."
        Exit Function

    End If

    'Copy each file to the new directory
    If hFile Then
        Do
            currFile = TrimNull(wfd.cFileName)

            If Asc(wfd.cFileName) <> vbDot Then
                currSourcePath = sSourcePath & currFile

                If Not IsPathAFolder(currSourcePath) Then
                    If MatchSpec(currFile, sFiles) Then
                        'copy the file to the destination directory & increment the count
                        Call CopyFileTo(currSourcePath, sDestination & currFile)
                        copied = copied + 1

                    End If

                Else
                    ' �������� ���������� ������
                    DebugMode str2VbTab & "CopyFiles from SubFolder: " & currFile
                    lngNumFilesFromFolder = rgbCopyFiles(currSourcePath, sDestination & currFile, ALL_FILES)
                    DebugMode str2VbTab & "CopyFiles SubFolder - count files: " & lngNumFilesFromFolder
                    copied = copied + lngNumFilesFromFolder

                End If

            End If

            'just to check what's happening
            'List1.AddItem sSourcePath & currFile
            'find the next file matching the initial file spec
            bNext = FindNextFile(hFile, wfd)
        Loop Until bNext = 0

    End If

    'Close the search handle
    Call FindClose(hFile)
    'and return the number of files copied
    rgbCopyFiles = copied

End Function

Public Function SearchFilesInRoot(strRootDir As String, _
                                  ByVal strSearchMask As String, _
                                  ByVal mbSearchRecursion As Boolean, _
                                  ByVal mbOnlyFirstFile As Boolean, _
                                  Optional mbDelete As Boolean = False, _
                                  Optional mbSort As Boolean = False)

    With fp
        .sFileRoot = BackslashAdd2Path(strRootDir)
        .sFileNameExt = strSearchMask
        .bRecurse = mbSearchRecursion

    End With

    SearchForFiles fp.sFileRoot, True, 100, mbDelete

    If Not mbDelete Then
        If mbOnlyFirstFile Then
            SearchFilesInRoot = sResultFileList(0, 0)
        Else

            If mbSort Then
                'StartSorting2 sResultFileList, UBound(sResultFileList, 2)
                QuickSortMDArray sResultFileList, 1, 0
            End If

            SearchFilesInRoot = sResultFileList

        End If

    End If

End Function

Public Function SearchFoldersInRoot(strRootDir As String, _
                                    ByVal strSearchMask As String, _
                                    ByVal mbSearchRecursion As Boolean, _
                                    ByVal mbOnlyFirstFile As Boolean)

    With fp2
        .sFileRoot = BackslashAdd2Path(strRootDir)
        .sFileNameExt = strSearchMask
        .bRecurse = mbSearchRecursion

    End With

    'FP
    SearchForFolders fp2.sFileRoot, True, 100

    If mbOnlyFirstFile Then
        SearchFoldersInRoot = sResultFolderList(0, 0)
    Else
        SearchFoldersInRoot = sResultFolderList

    End If

End Function

Private Sub SearchForFiles(sRoot As String, _
                           ByVal mbInitial As Boolean, _
                           miMaxCountArr As Long, _
                           Optional mbDelete As Boolean = False)

Dim wfd                                 As WIN32_FIND_DATA
Dim hFile                               As Long
Dim sSize                               As String
Dim strFileName                         As String

    'hFile = FindFirstFile(sRoot & ALL_FILES, wfd)

    'hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)
    If PathIsUNC(sRoot) = 0 Then
        hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)
    Else
        '\\?\UNC\
        hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sRoot, Len(sRoot) - 2) & ALL_FILES & vbNullChar), wfd)
    End If

    If Not mbDelete Then
        If mbInitial Then
            sResultFileListCount = 0
            ReDim sResultFileList(1, miMaxCountArr)
        Else
            ReDim Preserve sResultFileList(1, miMaxCountArr)

        End If

    End If

    If hFile <> INVALID_HANDLE_VALUE Then
        Do
            strFileName = TrimNull(wfd.cFileName)
            'if a folder, and recurse specified, call
            'method again
            If (wfd.dwFileAttributes And vbDirectory) Then
                If Asc(strFileName) <> vbDot Then
                    If fp.bRecurse Then
                        SearchForFiles sRoot & strFileName & vbBackslash, False, miMaxCountArr, mbDelete

                    End If

                End If

            Else

                'must be a file..
                If MatchSpec(strFileName, fp.sFileNameExt) Then
                    If mbDelete Then
                        DeleteFiles sRoot & strFileName
                    Else

                        ' ��������������� ������� ���� ��������� �������� �����������
                        If sResultFileListCount = miMaxCountArr Then
                            miMaxCountArr = 2 * miMaxCountArr
                            ReDim Preserve sResultFileList(1, miMaxCountArr)

                        End If

                        ' ������ ���� �����
                        sResultFileList(0, sResultFileListCount) = sRoot & strFileName
                        ' ������ �����
                        sSize = String$(30, vbNullChar)
                        StrFormatByteSizeW wfd.nFileSizeLow, wfd.nFileSizeHigh, ByVal StrPtr(sSize), 30
                        sResultFileList(1, sResultFileListCount) = TrimNull(sSize)
                        sResultFileListCount = sResultFileListCount + 1

                    End If

                End If

            End If

        Loop While FindNextFile(hFile, wfd)

0   End If

    FindClose hFile

    ' ��������������� ������� �� �������� ���-�� �������
    If Not mbDelete Then
        If mbInitial Then
            If sResultFileListCount > 0 Then
                ReDim Preserve sResultFileList(1, sResultFileListCount - 1)
            Else
                ReDim Preserve sResultFileList(1, sResultFileListCount)

            End If

        End If

    End If

End Sub

Private Sub SearchForFolders(sRoot As String, _
                             ByVal mbInitial As Boolean, _
                             miMaxCountArr As Long)

Dim wfd                                 As WIN32_FIND_DATA
Dim hFile                               As Long
Dim strFindData                         As String

    'hFile = FindFirstFile(sRoot & ALL_FILES, wfd)
    'hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)

    If PathIsUNC(sRoot) = 0 Then
        hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)
    Else
        '\\?\UNC\
        hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sRoot, Len(sRoot) - 2) & ALL_FILES & vbNullChar), wfd)
    End If

    If mbInitial Then
        sResultFolderListCount = 0
        ReDim sResultFolderList(1, miMaxCountArr)
    Else
        ReDim Preserve sResultFolderList(1, miMaxCountArr)

    End If

    If hFile <> INVALID_HANDLE_VALUE Then
        Do

            'if a folder, and recurse specified, call
            'method again
            strFindData = TrimNull(wfd.cFileName)
            If (wfd.dwFileAttributes And vbDirectory) Then
                If Asc(strFindData) <> vbDot Then
                    If MatchSpec(strFindData, fp2.sFileNameExt) Then

                        ' ��������������� ������� ���� ��������� �������� �����������
                        If sResultFolderListCount = miMaxCountArr Then
                            miMaxCountArr = 2 * miMaxCountArr
                            ReDim Preserve sResultFolderList(1, miMaxCountArr)

                        End If

                        ' ������ ���� �����
                        sResultFolderList(0, sResultFolderListCount) = sRoot & strFindData
                        sResultFolderList(1, sResultFolderListCount) = Left$(strFindData, InStrRev(strFindData, "_", , vbTextCompare) - 1)
                        sResultFolderListCount = sResultFolderListCount + 1

                    End If

                    If fp2.bRecurse Then
                        SearchForFolders sRoot & strFindData & vbBackslash, False, miMaxCountArr

                    End If

                End If

            End If

        Loop While FindNextFile(hFile, wfd)

    End If

    FindClose hFile

    ' ��������������� ������� �� �������� ���-�� �������
    If mbInitial Then
        If sResultFolderListCount > 0 Then
            ReDim Preserve sResultFolderList(1, sResultFolderListCount - 1)
        Else
            ReDim Preserve sResultFolderList(1, sResultFolderListCount)

        End If

    End If

End Sub

Public Function FolderContainsSubfolders(sRoot As String) As Boolean

Dim wfd                                 As WIN32_FIND_DATA
Dim hFile                               As Long

    If LenB(sRoot) > 0 Then
        sRoot = BackslashAdd2Path(sRoot)

        If PathIsUNC(sRoot) = 0 Then
            hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)
        Else
            '\\?\UNC\
            hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sRoot, Len(sRoot) - 2) & ALL_FILES & vbNullChar), wfd)
        End If

        If hFile <> INVALID_HANDLE_VALUE Then

            Do
                If (wfd.dwFileAttributes And vbDirectory) Then

                    'an item with the vbDirectory bit was found
                    'but is it a system folder?
                    If (Left$(wfd.cFileName, 1) <> ".") And _
                       (Left$(wfd.cFileName, 2) <> "..") Then

                        'nope, it's a user folder
                        FolderContainsSubfolders = True
                        Exit Do

                    End If
                End If

            Loop While FindNextFile(hFile, wfd)

        End If

        Call FindClose(hFile)
    End If

End Function

Public Function FolderContainsFiles(sRoot As String) As Boolean

Dim wfd                                 As WIN32_FIND_DATA
Dim hFile                               As Long

    If LenB(sRoot) > 0 Then
        sRoot = BackslashAdd2Path(sRoot)

        If PathIsUNC(sRoot) = 0 Then
            hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)
        Else
            '\\?\UNC\
            hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sRoot, Len(sRoot) - 2) & ALL_FILES & vbNullChar), wfd)
        End If

        If hFile <> INVALID_HANDLE_VALUE Then

            Do
                'if the vbDirectory bit's not set, it's a
                'file so we're done!
                If (Not (wfd.dwFileAttributes And vbDirectory) = vbDirectory) Then

                    FolderContainsFiles = True
                    Exit Do

                End If

            Loop While FindNextFile(hFile, wfd)

        End If

        Call FindClose(hFile)
    End If

End Function


Private Sub GetDirectorySize(sRoot As String, fp As FILE_PARAMS)

Dim wfd                                 As WIN32_FIND_DATA
Dim hFile                               As Long

    If PathIsUNC(sRoot) = 0 Then
        hFile = FindFirstFile(StrPtr("\\?\" & sRoot & ALL_FILES & vbNullChar), wfd)
    Else
        '\\?\UNC\
        hFile = FindFirstFile(StrPtr("\\?\UNC\" & Right$(sRoot, Len(sRoot) - 2) & ALL_FILES & vbNullChar), wfd)
    End If

    If hFile <> INVALID_HANDLE_VALUE Then

        Do

            If Asc(wfd.cFileName) <> vbDot Then
                If (wfd.dwFileAttributes And vbDirectory) Then

                    If fp.bRecurse Then
                        GetDirectorySize sRoot & TrimNull(wfd.cFileName) & "\", fp
                    End If
                Else
                    fp.nFileCount = fp.nFileCount + 1
                    fp.nFileSize = fp.nFileSize + ((wfd.nFileSizeHigh * (MAXDWORD + 1)) + wfd.nFileSizeLow)
                End If

            End If

            fp.nSearched = fp.nSearched + 1

        Loop While FindNextFile(hFile, wfd)

    End If
    'If hFile

    Call FindClose(hFile)

End Sub

Public Function FolderSizeApi(sSource As String, bRecursion As Boolean) As String

Dim fp                                  As FILE_PARAMS

    With fp
        .sFileRoot = BackslashAdd2Path(sSource)
        .sFileNameExt = ALL_FILES
        .bRecurse = bRecursion
    End With

    GetDirectorySize fp.sFileRoot, fp

    FolderSizeApi = FormatByteSize(CSng(fp.nFileSize))

End Function

Private Function FormatByteSize(dwBytes As Single) As String

Dim sBuff                               As String
Dim dwBuff                              As Long

    sBuff = String$(32, vbNullChar)
    dwBuff = Len(sBuff)

    If StrFormatByteSize(dwBytes, sBuff, dwBuff) <> 0 Then
        FormatByteSize = TrimNull(sBuff)
    End If


End Function
