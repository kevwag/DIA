VERSION 5.00
Begin VB.Form frmListHwidAll 
   Caption         =   "������ ���� ��������� ������ ����������"
   ClientHeight    =   6300
   ClientLeft      =   120
   ClientTop       =   720
   ClientWidth     =   11760
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmListHwidAll.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MinButton       =   0   'False
   ScaleHeight     =   6300
   ScaleWidth      =   11760
   StartUpPosition =   1  'CenterOwner
   Begin prjDIADBS.ctlJCbutton cmdOK 
      Default         =   -1  'True
      Height          =   650
      Left            =   9120
      TabIndex        =   17
      Top             =   5595
      Width           =   2505
      _ExtentX        =   4419
      _ExtentY        =   1138
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ButtonStyle     =   8
      BackColor       =   12244692
      Caption         =   "�����"
      CaptionEffects  =   0
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      ColorScheme     =   3
   End
   Begin prjDIADBS.ctlJCbutton cmdReNewHW 
      Height          =   650
      Left            =   6480
      TabIndex        =   16
      Top             =   5595
      Width           =   2505
      _ExtentX        =   4419
      _ExtentY        =   1138
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ButtonStyle     =   8
      BackColor       =   12244692
      Caption         =   "�������� ������������ ������������"
      CaptionEffects  =   0
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      ColorScheme     =   3
   End
   Begin prjDIADBS.ctlJCbutton cmdBackUpDrivers 
      Height          =   650
      Left            =   3840
      TabIndex        =   15
      Top             =   5595
      Width           =   2500
      _ExtentX        =   4419
      _ExtentY        =   1138
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ButtonStyle     =   8
      BackColor       =   12244692
      Caption         =   "������� ��������� ����� ���������"
      CaptionEffects  =   0
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      ColorScheme     =   3
   End
   Begin prjDIADBS.ctlJCbutton cmdCheckAll 
      Height          =   300
      Left            =   60
      TabIndex        =   12
      TabStop         =   0   'False
      Top             =   5520
      Visible         =   0   'False
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   529
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ButtonStyle     =   8
      BackColor       =   12244692
      Caption         =   "�������� ��"
      CaptionEffects  =   0
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      ColorScheme     =   3
   End
   Begin prjDIADBS.ctlJCbutton cmdUnCheckAll 
      Height          =   300
      Left            =   60
      TabIndex        =   14
      TabStop         =   0   'False
      Top             =   5940
      Visible         =   0   'False
      Width           =   2055
      _ExtentX        =   3625
      _ExtentY        =   529
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ButtonStyle     =   8
      BackColor       =   12244692
      Caption         =   "����� ���������"
      CaptionEffects  =   0
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      ColorScheme     =   3
   End
   Begin prjDIADBS.ctlJCFrames frGroup 
      Height          =   1250
      Left            =   75
      Top             =   40
      Width           =   4080
      _ExtentX        =   7197
      _ExtentY        =   2196
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   15783104
      FillColor       =   15783104
      TextBoxColor    =   11595760
      Style           =   3
      RoundedCorner   =   0   'False
      Caption         =   "������ ���������:"
      Alignment       =   0
      HeaderStyle     =   1
      Begin prjDIADBS.OptionButtonW optGrp4 
         Height          =   405
         Left            =   1860
         TabIndex        =   3
         Top             =   780
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Value           =   0   'False
         Caption         =   "frmListHwidAll.frx":000C
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.OptionButtonW optGrp3 
         Height          =   405
         Left            =   1860
         TabIndex        =   1
         Top             =   360
         Width           =   2175
         _ExtentX        =   3836
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Caption         =   "frmListHwidAll.frx":0054
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.CheckBoxW optGrp1 
         Height          =   405
         Left            =   120
         TabIndex        =   0
         Top             =   360
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Caption         =   "frmListHwidAll.frx":007A
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.CheckBoxW optGrp2 
         Height          =   405
         Left            =   120
         TabIndex        =   2
         Top             =   780
         Width           =   1695
         _ExtentX        =   2990
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Caption         =   "frmListHwidAll.frx":00AC
         Transparent     =   -1  'True
      End
   End
   Begin prjDIADBS.ctlJCFrames frFindDrvInternet 
      Height          =   1250
      Left            =   4200
      Top             =   40
      Width           =   7500
      _ExtentX        =   13229
      _ExtentY        =   2196
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   15783104
      FillColor       =   15783104
      TextBoxColor    =   11595760
      Style           =   3
      RoundedCorner   =   0   'False
      Caption         =   "����� �������� � ���������:"
      Alignment       =   0
      HeaderStyle     =   1
      Begin prjDIADBS.TextBoxW txtFindText 
         Height          =   315
         Left            =   60
         TabIndex        =   4
         Top             =   360
         Width           =   5355
         _ExtentX        =   9446
         _ExtentY        =   556
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
      End
      Begin prjDIADBS.CheckBoxW chkParseHwid 
         Height          =   210
         Left            =   60
         TabIndex        =   9
         Top             =   960
         Width           =   5355
         _ExtentX        =   9446
         _ExtentY        =   370
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Caption         =   "frmListHwidAll.frx":00D2
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.OptionButtonW optDevID 
         Height          =   405
         Left            =   60
         TabIndex        =   5
         Top             =   600
         Width           =   1700
         _ExtentX        =   2990
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Value           =   0   'False
         Caption         =   "frmListHwidAll.frx":0144
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.OptionButtonW optMS 
         Height          =   405
         Left            =   1800
         TabIndex        =   6
         Top             =   600
         Width           =   1755
         _ExtentX        =   3096
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Value           =   0   'False
         Caption         =   "frmListHwidAll.frx":0178
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.OptionButtonW optGoogle 
         Height          =   405
         Left            =   3660
         TabIndex        =   7
         Top             =   600
         Width           =   1700
         _ExtentX        =   2990
         _ExtentY        =   714
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         BackColor       =   15783104
         Caption         =   "frmListHwidAll.frx":01B2
         Transparent     =   -1  'True
      End
      Begin prjDIADBS.ctlJCbutton cmdGoSite 
         Height          =   795
         Left            =   5520
         TabIndex        =   8
         Top             =   360
         Width           =   1905
         _ExtentX        =   5318
         _ExtentY        =   688
         BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
            Name            =   "Tahoma"
            Size            =   8.25
            Charset         =   204
            Weight          =   400
            Underline       =   0   'False
            Italic          =   0   'False
            Strikethrough   =   0   'False
         EndProperty
         ButtonStyle     =   8
         BackColor       =   12244692
         Caption         =   "��������"
         CaptionEffects  =   0
         PictureAlign    =   0
         PicturePushOnHover=   -1  'True
         PictureShadow   =   -1  'True
         ColorScheme     =   3
      End
   End
   Begin prjDIADBS.ListView lvDevices 
      Height          =   1455
      Left            =   60
      TabIndex        =   10
      Top             =   1320
      Width           =   11610
      _ExtentX        =   20479
      _ExtentY        =   2566
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      View            =   3
      Arrange         =   1
      AllowColumnReorder=   -1  'True
      FullRowSelect   =   -1  'True
      GridLines       =   -1  'True
      LabelEdit       =   2
      HideSelection   =   0   'False
      ShowLabelTips   =   -1  'True
      HoverSelection  =   -1  'True
      HotTracking     =   -1  'True
      HighlightHot    =   -1  'True
      TextBackground  =   1
   End
   Begin prjDIADBS.LabelW lblWait 
      Height          =   375
      Left            =   105
      TabIndex        =   11
      Top             =   2880
      Visible         =   0   'False
      Width           =   11640
      _ExtentX        =   17383
      _ExtentY        =   688
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   14.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Alignment       =   2
      BackStyle       =   0
      Caption         =   "���� ���������� ������������ ������������. ����������, ���������...."
   End
   Begin prjDIADBS.LabelW lblInformation 
      Height          =   795
      Left            =   2160
      TabIndex        =   13
      Top             =   5400
      Visible         =   0   'False
      Width           =   1635
      _ExtentX        =   2884
      _ExtentY        =   1402
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackStyle       =   0
      Caption         =   "�������� �������� ����������� ��� ������������� � ������� ������ 'BackUp''. "
   End
   Begin VB.Menu mnuContext 
      Caption         =   "����������� ����"
      Begin VB.Menu mnuContextProperties 
         Caption         =   "�������� �������� ��������"
      End
      Begin VB.Menu mnuContextDelete 
         Caption         =   "������� �������"
      End
   End
End
Attribute VB_Name = "frmListHwidAll"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

' ����������� ������� �����
Private lngFormWidthMin  As Long
Private lngFormHeightMin As Long

Private lngDeviceCount   As Long
Private strFormName      As String

Public Property Get CaptionW() As String
    Dim lngLenStr As Long
    
    lngLenStr = DefWindowProc(Me.hWnd, WM_GETTEXTLENGTH, 0, ByVal 0)
    CaptionW = Space$(lngLenStr)
    DefWindowProc Me.hWnd, WM_GETTEXT, Len(CaptionW) + 1, ByVal StrPtr(CaptionW)
End Property

Public Property Let CaptionW(ByVal NewValue As String)
    DefWindowProc Me.hWnd, WM_SETTEXT, 0, ByVal StrPtr(NewValue & vbNullChar)
End Property

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub BlockControl
'! Description (��������)  :   [����������(�������������) ��������� ��������� ����� ��� ������ ������� �������]
'! Parameters  (����������):   mbBlock (Boolean)
'!--------------------------------------------------------------------------------
Public Sub BlockControl(ByVal mbBlock As Boolean)
    optGrp1.Enabled = mbBlock
    optGrp2.Enabled = mbBlock
    optGrp3.Enabled = mbBlock
    optGrp4.Enabled = mbBlock
    cmdBackUpDrivers.Enabled = mbBlock
    cmdOK.Enabled = mbBlock
    cmdReNewHW.Enabled = mbBlock
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub FindCheckCountList
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub FindCheckCountList()

    Dim i       As Integer
    Dim miCount As Integer

    For i = 1 To lvDevices.ListItems.Count

        If lvDevices.ListItems.Item(i).Checked Then
            miCount = miCount + 1
        End If

    Next

    If miCount Then
        If Not cmdOK.Enabled Then
            cmdOK.Enabled = True
        End If
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub FontCharsetChange
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub FontCharsetChange()

    ' ���������� �����
    With Me.Font
        .Name = strFontOtherForm_Name
        .Size = lngFontOtherForm_Size
        .Charset = lngFont_Charset
    End With

    
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub FormLoadAction
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Public Sub FormLoadAction()

    ' ����������� ����������
    If mbMultiLanguage Then
        Localise strPCLangCurrentPath
    Else
        ' ���������� �����
        FontCharsetChange
    End If
    
    LoadListbyMode
    
    lngDeviceCount = UBound(arrHwidsLocal) + 1
    LoadFormCaption
    cmdGoSite.Enabled = LenB(txtFindText.Text)
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub FormLoadDefaultParam
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Public Sub FormLoadDefaultParam()

    If Not (lvDevices Is Nothing) Then
        lvDevices.ColumnHeaders.Clear
        lvDevices.ListItems.Clear
    End If

    optGrp1.Value = 0
    optGrp2.Value = 1
    optGrp3.Value = False
    optGrp4.Value = True
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub LoadFormCaption
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub LoadFormCaption()

    Dim MeCaptionView As String

    MeCaptionView = LocaliseString(strPCLangCurrentPath, strFormName, strFormName, Me.Caption)
    Me.CaptionW = MeCaptionView & " (" & lvDevices.ListItems.Count & strSpace & strMessages(124) & strSpace & lngDeviceCount & ")"
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub LoadListbyMode
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub LoadListbyMode()

    Dim lngModeList As Long
    Dim mbOpt1      As Boolean
    Dim mbOpt2      As Boolean
    Dim mbOpt3      As Boolean
    Dim mbOpt4      As Boolean

    mbOpt1 = CBool(optGrp1.Value)
    mbOpt2 = CBool(optGrp2.Value)
    mbOpt3 = optGrp3.Value
    mbOpt4 = optGrp4.Value

    ' Microsoft
    If mbOpt1 And Not mbOpt2 Then

        'All
        If mbOpt3 Then
            lngModeList = 1
            'NotInBase
        Else
            lngModeList = 5
        End If

        ' OEM
    ElseIf Not mbOpt1 And mbOpt2 Then

        'All
        If mbOpt3 Then
            lngModeList = 2
            'NotInBase
        Else
            lngModeList = 6
        End If

        ' ������
    ElseIf Not mbOpt1 And Not mbOpt2 Then
        lngModeList = 9999
        ' Microsoft+OEM
    Else

        'All
        If mbOpt3 Then
            lngModeList = 3
            'NotInBase
        Else
            lngModeList = 4
        End If
    End If

    If lngModeList <> 9999 Then
        LoadList_Device lngModeList
    Else
        If Not (lvDevices Is Nothing) Then
            lvDevices.ListItems.Clear
        End If
        With lvDevices.ColumnHeaders
            If .Count Then
                .Item(1).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(2).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(3).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(4).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(5).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(6).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(7).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(8).AutoSize LvwColumnHeaderAutoSizeToHeader
            End If
        End With
    End If

    LoadFormCaption
    FindCheckCountList
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Localise
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   StrPathFile (String)
'!--------------------------------------------------------------------------------
Private Sub Localise(ByVal strPathFile As String)
    ' ���������� ����� ��������� (��������� ������ �� �� ��� ������� �� �������������� ������)
    FontCharsetChange
    ' �������� �����
    Me.CaptionW = LocaliseString(strPathFile, strFormName, strFormName, Me.Caption)
    '������
    cmdOK.Caption = LocaliseString(strPathFile, strFormName, "cmdOK", cmdOK.Caption)
    frGroup.Caption = LocaliseString(strPathFile, strFormName, "frGroup", frGroup.Caption)
    frFindDrvInternet.Caption = LocaliseString(strPathFile, strFormName, "frFindDrvInternet", frFindDrvInternet.Caption)
    chkParseHwid.Caption = LocaliseString(strPathFile, strFormName, "chkParseHwid", chkParseHwid.Caption)
    cmdGoSite.Caption = LocaliseString(strPathFile, strFormName, "cmdGoSite", cmdGoSite.Caption)
    optGrp1.Caption = LocaliseString(strPathFile, strFormName, "optGrp1", optGrp1.Caption)
    optGrp2.Caption = LocaliseString(strPathFile, strFormName, "optGrp2", optGrp2.Caption)
    optGrp3.Caption = LocaliseString(strPathFile, strFormName, "optGrp3", optGrp3.Caption)
    optGrp4.Caption = LocaliseString(strPathFile, strFormName, "optGrp4", optGrp4.Caption)
    lblWait.Caption = LocaliseString(strPathFile, strFormName, "lblWait", lblWait.Caption)
    cmdReNewHW.Caption = LocaliseString(strPathFile, strFormName, "cmdReNewHW", cmdReNewHW.Caption)
    cmdBackUpDrivers.Caption = LocaliseString(strPathFile, strFormName, "cmdBackUpDrivers", cmdBackUpDrivers.Caption)
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub OpenDeviceProp
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   strHwid (String)
'!--------------------------------------------------------------------------------
Private Sub OpenDeviceProp(ByVal strHwid As String)

    Dim cmdString       As String
    Dim cmdStringParams As String
    Dim nRetShellEx     As Boolean

    cmdString = "rundll32.exe"
    cmdStringParams = "devmgr.dll,DeviceProperties_RunDLL /DeviceID " & strHwid
    If mbDebugStandart Then DebugMode "cmdString: " & cmdString
    If mbDebugStandart Then DebugMode "cmdStringParams: " & cmdStringParams
    nRetShellEx = ShellEx(cmdString, essSW_SHOWNORMAL, cmdStringParams)
    If mbDebugStandart Then DebugMode "cmdString: " & nRetShellEx
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Function ParseHwid
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   strValuer (String)
'!--------------------------------------------------------------------------------
Private Function ParseHwid(ByVal strValuer As String) As String

    Dim strValuer_x() As String
    Dim miSubSys      As Long
    Dim miREV         As Long
    Dim miMI          As Long
    Dim miCC          As Long

    ' �������� ����������
    If chkParseHwid.Value Then

        ' ��������� �� "\"
        If InStr(strValuer, vbBackslash) Then
            strValuer_x = Split(strValuer, vbBackslash)
            strValuer = strValuer_x(0) & vbBackslash & strValuer_x(1)
            miSubSys = InStr(strValuer, "&SUBSYS")

            If miSubSys Then
                strValuer = Left$(strValuer, miSubSys - 1)
            End If

            miREV = InStr(strValuer, "&REV_")

            If miREV Then
                strValuer = Left$(strValuer, miREV - 1)
            End If

            miMI = InStr(strValuer, "&MI_")

            If miMI Then
                strValuer = Left$(strValuer, miMI - 1)
            End If

            miCC = InStr(strValuer, "&CC_")

            If miCC Then
                strValuer = Left$(strValuer, miCC - 1)
            End If
        End If
    End If

    ParseHwid = strValuer
End Function

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdBackUpDrivers_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdBackUpDrivers_Click()

    If MsgBox(strMessages(123), vbYesNo + vbQuestion, strProductName) = vbYes Then
        RunUtilsShell strUrl_MainWWWSite, False
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdCheckAll_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdCheckAll_Click()

    Dim i As Integer

    With lvDevices.ListItems

        For i = 1 To .Count

            If Not .Item(i).Checked Then
                .Item(i).Checked = True
            End If

        Next

    End With

    FindCheckCountList
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdGoSite_Click
'! Description (��������)  :   [����� ������� ��� ����������� ����������]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdGoSite_Click()

    Dim strDevID    As String
    Dim cmdString   As String

    strDevID = txtFindText.Text
    strDevID = Replace$(strDevID, vbBackslash, "%5C", , , vbTextCompare)
    strDevID = Replace$(strDevID, "&", "%26", , , vbTextCompare)

    If optDevID.Value Then
        cmdString = "http://www.devid.info/search.php?text=" & strDevID & "&="
    ElseIf optGoogle.Value Then
        cmdString = "http://www.google.com/search?q=driver+" & strDevID & "&="
    Else
        cmdString = "http://catalog.update.microsoft.com/v7/site/Search.aspx?q=" & strDevID & "&="
    End If

    RunUtilsShell cmdString, False
    
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdOK_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdOK_Click()
    Me.Hide
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdReNewHW_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdReNewHW_Click()
    BlockControl False
    lvDevices.ListItems.Clear
    lvDevices.Visible = False
    lblWait.Visible = True
    ReCollectHWID
    ' �������� �������� ����� ��������� � �������, �.� �������� ������
    frmMain.UpdateStatusButtonAll
    ' �������� ������ ����������� ���� � �������� ��� ������
    frmMain.LoadCmdViewAllDeviceCaption
    SaveHWIDs2File
    '��������� ������ �� �����
    LoadListbyMode
    lblWait.Visible = False
    lvDevices.Visible = True
    BlockControl True
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdUnCheckAll_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdUnCheckAll_Click()

    Dim i As Integer

    With lvDevices.ListItems

        For i = 1 To .Count

            If .Item(i).Checked Then
                .Item(i).Checked = False
            End If

        Next

    End With

    FindCheckCountList
End Sub

Private Sub Form_Activate()
    
    'On Error Resume Next
    lvDevices.SetFocus
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Form_KeyDown
'! Description (��������)  :   [��������� ������� ������ ����������]
'! Parameters  (����������):   KeyCode (Integer)
'                              Shift (Integer)
'!--------------------------------------------------------------------------------
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyEscape Then
        Unload Me
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Form_Load
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub Form_Load()
    SetupVisualStyles Me

    With Me
        strFormName = .Name
        SetIcon .hWnd, "frmListHwidAll", False
        .Left = (lngRightWorkArea - lngLeftWorkArea) / 2 - .Width / 2
        .Top = (lngBottomWorkArea - lngTopWorkArea) / 2 - .Height / 2
        lngFormWidthMin = .Width
        lngFormHeightMin = .Height
    End With

    mnuContext.Visible = False
    LoadIconImage2Object cmdOK, "BTN_SAVE", strPathImageMainWork
    LoadIconImage2Object cmdCheckAll, "BTN_CHECKMARK", strPathImageMainWork
    LoadIconImage2Object cmdUnCheckAll, "BTN_UNCHECKMARK", strPathImageMainWork
    LoadIconImage2Object cmdGoSite, "BTN_VIEW_SEARCH", strPathImageMainWork
    LoadIconImage2Object cmdReNewHW, "BTN_RENEWHW", strPathImageMainWork
    LoadIconImage2Object cmdBackUpDrivers, "BTN_BACKUP", strPathImageMainWork
    ' ��� ��������� ���������
    FormLoadDefaultParam
    FormLoadAction
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Form_QueryUnload
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   Cancel (Integer)
'                              UnloadMode (Integer)
'!--------------------------------------------------------------------------------
Private Sub Form_QueryUnload(Cancel As Integer, UnloadMode As Integer)

    ' ��������� �� ������ ����� � ������ ����������
    If UnloadMode = vbFormControlMenu Then
        Cancel = 1
        Me.Hide
    Else
        Set frmListHwidAll = Nothing
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Form_Resize
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub Form_Resize()

    Dim lngLVHeight As Long
    Dim lngLVWidht  As Long
    Dim lngLVTop    As Long

    On Error Resume Next

    With Me

        If .WindowState <> vbMinimized Then

            Dim miDeltaFrm As Long

            If OSCurrVersionStruct.VerFull >= "6.0" Then
                miDeltaFrm = 125
            Else

                If mbAppThemed Then
                    miDeltaFrm = 0
                Else
                    miDeltaFrm = 0
                End If
            End If

            If .Width < lngFormWidthMin Then
                .Width = lngFormWidthMin
                .Enabled = False
                .Enabled = True

                Exit Sub

            End If

            If .Height < lngFormHeightMin Then
                .Height = lngFormHeightMin
                .Enabled = False
                .Enabled = True

                Exit Sub

            End If

            frFindDrvInternet.Width = .Width - frGroup.Left - frGroup.Width - 250 - miDeltaFrm

            With cmdGoSite
                .Left = frFindDrvInternet.Width - .Width - 125
                txtFindText.Width = .Left - 200
            End With

            cmdOK.Left = .Width - cmdOK.Width - 200 - miDeltaFrm
            cmdOK.Top = .Height - cmdOK.Height - 550 - miDeltaFrm
            cmdReNewHW.Top = cmdOK.Top
            cmdReNewHW.Left = .Width - cmdOK.Width - 250 - cmdReNewHW.Width - 150 - miDeltaFrm
            cmdBackUpDrivers.Top = cmdOK.Top
            cmdBackUpDrivers.Left = .Width - cmdOK.Width - 250 - cmdReNewHW.Width - 250 - cmdBackUpDrivers.Width - 100 - miDeltaFrm
            lngLVTop = (frGroup.Top + frGroup.Height) + 5 * Screen.TwipsPerPixelX
            lngLVHeight = cmdOK.Top - lngLVTop - 10 * Screen.TwipsPerPixelX
            lngLVWidht = (.Width - miDeltaFrm) - 18 * Screen.TwipsPerPixelX

            If Not (lvDevices Is Nothing) Then
                lvDevices.Move 5 * Screen.TwipsPerPixelX, lngLVTop, lngLVWidht, lngLVHeight
                lvDevices.Refresh
            End If

            lblWait.Left = 100
            lblWait.Width = .Width - 200
        End If

    End With

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub LoadList_Device
'! Description (��������)  :   [���������� ������� ���c�� ���������]
'! Parameters  (����������):   mbViewed (Boolean = True)
'                              lngMode (Long = 0)
'!--------------------------------------------------------------------------------
Private Sub LoadList_Device(Optional ByVal lngMode As Long = 0)

    Dim strDevHwid        As String
    Dim strDevDriverLocal As String
    Dim strDevStatus      As String
    Dim strDevName        As String
    Dim strProvider       As String
    Dim strCompatID       As String
    Dim strStrDescription As String
    Dim strOrigHwid       As String
    Dim ii                As Integer
    Dim strInDPacks       As String
    Dim lngNumRow         As Long

    With lvDevices
        .ListItems.Clear

        If .ColumnHeaders.Count = 0 Then
            .ColumnHeaders.Add 1, , strTableHwidHeader1
            .ColumnHeaders.Add 2, , strTableHwidHeader7
            .ColumnHeaders.Add 3, , strTableHwidHeader6
            .ColumnHeaders.Add 4, , strTableHwidHeader5
            .ColumnHeaders.Add 5, , strTableHwidHeader10
            .ColumnHeaders.Add 6, , strTableHwidHeader11
            .ColumnHeaders.Add 7, , strTableHwidHeader12
            .ColumnHeaders.Add 8, , strTableHwidHeader14
        End If

    End With

    For ii = 0 To UBound(arrHwidsLocal)
        strDevHwid = arrHwidsLocal(ii).HWID
        strDevName = arrHwidsLocal(ii).DevName
        strDevStatus = arrHwidsLocal(ii).Status
        strDevDriverLocal = arrHwidsLocal(ii).VerLocal
        strProvider = arrHwidsLocal(ii).Provider
        strCompatID = arrHwidsLocal(ii).HWIDCompat
        strStrDescription = arrHwidsLocal(ii).Description

        If StrComp(strDevName, strStrDescription, vbTextCompare) <> 0 Then
            If LenB(strStrDescription) Then
                If InStr(strStrDescription, strUnknownLCase) = 0 Then
                    strDevName = strStrDescription
                End If
            End If
        End If

        strInDPacks = arrHwidsLocal(ii).DPsList
        strOrigHwid = arrHwidsLocal(ii).HWIDOrig

        Select Case lngMode

            ' All - ALL
            Case 0, 3

                With lvDevices.ListItems.Add(, , strDevHwid)
                    .SubItems(1) = strDevName
                    .SubItems(2) = strDevStatus
                    .SubItems(3) = strDevDriverLocal
                    .SubItems(4) = strProvider
                    .SubItems(5) = strCompatID
                    .SubItems(6) = strOrigHwid
                    .SubItems(7) = strInDPacks
                End With

            ' Microsoft - All
            Case 1

                If InStr(1, strProvider, "microsoft", vbTextCompare) Or InStr(1, strProvider, "����������", vbTextCompare) Or InStr(1, strProvider, "standard", vbTextCompare) Then

                    With lvDevices.ListItems.Add(, , strDevHwid)
                        .SubItems(1) = strDevName
                        .SubItems(2) = strDevStatus
                        .SubItems(3) = strDevDriverLocal
                        .SubItems(4) = strProvider
                        .SubItems(5) = strCompatID
                        .SubItems(6) = strOrigHwid
                        .SubItems(7) = strInDPacks
                    End With

                    lngNumRow = lngNumRow + 1
                End If

            ' OEM - All
            Case 2

                If InStr(1, strProvider, "microsoft", vbTextCompare) = 0 Then
                    If InStr(1, strProvider, "����������", vbTextCompare) = 0 Then
                        If InStr(1, strProvider, "standard", vbTextCompare) = 0 Then

                            With lvDevices.ListItems.Add(, , strDevHwid)
                                .SubItems(1) = strDevName
                                .SubItems(2) = strDevStatus
                                .SubItems(3) = strDevDriverLocal
                                .SubItems(4) = strProvider
                                .SubItems(5) = strCompatID
                                .SubItems(6) = strOrigHwid
                                .SubItems(7) = strInDPacks
                            End With
        
                            lngNumRow = lngNumRow + 1
                        End If
                    End If
                End If
            ' All - not in base
            Case 4

                If LenB(strInDPacks) = 0 Then

                    With lvDevices.ListItems.Add(, , strDevHwid)
                        .SubItems(1) = strDevName
                        .SubItems(2) = strDevStatus
                        .SubItems(3) = strDevDriverLocal
                        .SubItems(4) = strProvider
                        .SubItems(5) = strCompatID
                        .SubItems(6) = strOrigHwid
                        .SubItems(7) = strInDPacks
                    End With

                    lngNumRow = lngNumRow + 1
                End If

            ' Microsoft - not in base
            Case 5

                If InStr(1, strProvider, "microsoft", vbTextCompare) Or InStr(1, strProvider, "����������", vbTextCompare) Or InStr(1, strProvider, "standard", vbTextCompare) Then
                    If LenB(strInDPacks) = 0 Then

                        With lvDevices.ListItems.Add(, , strDevHwid)
                            .SubItems(1) = strDevName
                            .SubItems(2) = strDevStatus
                            .SubItems(3) = strDevDriverLocal
                            .SubItems(4) = strProvider
                            .SubItems(5) = strCompatID
                            .SubItems(6) = strOrigHwid
                            .SubItems(7) = strInDPacks
                        End With

                        lngNumRow = lngNumRow + 1
                    End If
                End If

            ' OEM - not in base
            Case 6

                If InStr(1, strProvider, "microsoft", vbTextCompare) = 0 Then
                    If InStr(1, strProvider, "����������", vbTextCompare) = 0 Then
                        If InStr(1, strProvider, "standard", vbTextCompare) = 0 Then
                            If LenB(strInDPacks) = 0 Then
        
                                With lvDevices.ListItems.Add(, , strDevHwid)
                                    .SubItems(1) = strDevName
                                    .SubItems(2) = strDevStatus
                                    .SubItems(3) = strDevDriverLocal
                                    .SubItems(4) = strProvider
                                    .SubItems(5) = strCompatID
                                    .SubItems(6) = strOrigHwid
                                    .SubItems(7) = strInDPacks
                                End With
        
                                lngNumRow = lngNumRow + 1
                            End If
                        End If
                    End If
                End If

        End Select

    Next
    
    With lvDevices.ColumnHeaders
        If .Count Then
            If lvDevices.ListItems.Count Then
                .Item(1).AutoSize LvwColumnHeaderAutoSizeToItems
                .Item(2).AutoSize LvwColumnHeaderAutoSizeToItems
                If .Item(2).Width < lvDevices.ListItems.Item(1).Width Then
                    .Item(2).AutoSize LvwColumnHeaderAutoSizeToHeader
                End If
                .Item(3).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(4).AutoSize LvwColumnHeaderAutoSizeToItems
                .Item(5).AutoSize LvwColumnHeaderAutoSizeToItems
                .Item(6).AutoSize LvwColumnHeaderAutoSizeToItems
                .Item(7).AutoSize LvwColumnHeaderAutoSizeToItems
                .Item(8).AutoSize LvwColumnHeaderAutoSizeToHeader
            Else
                .Item(1).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(2).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(3).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(4).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(5).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(6).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(7).AutoSize LvwColumnHeaderAutoSizeToHeader
                .Item(8).AutoSize LvwColumnHeaderAutoSizeToHeader
            End If
        End If
    End With

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lvDevices_ColumnClick
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   ColumnHeader (LvwColumnHeader)
'!--------------------------------------------------------------------------------
Private Sub lvDevices_ColumnClick(ByVal ColumnHeader As LvwColumnHeader)

    Dim i As Long

    With lvDevices
        .Sorted = False
        .SortKey = ColumnHeader.Index - 1

        If ComCtlsSupportLevel() >= 1 Then

            For i = 1 To .ColumnHeaders.Count

                If i <> ColumnHeader.Index Then
                    .ColumnHeaders(i).SortArrow = LvwColumnHeaderSortArrowNone
                Else

                    If ColumnHeader.SortArrow = LvwColumnHeaderSortArrowNone Then
                        ColumnHeader.SortArrow = LvwColumnHeaderSortArrowDown
                    Else

                        If ColumnHeader.SortArrow = LvwColumnHeaderSortArrowDown Then
                            ColumnHeader.SortArrow = LvwColumnHeaderSortArrowUp
                        ElseIf ColumnHeader.SortArrow = LvwColumnHeaderSortArrowUp Then
                            ColumnHeader.SortArrow = LvwColumnHeaderSortArrowDown
                        End If
                    End If
                End If

            Next i

            Select Case ColumnHeader.SortArrow

                Case LvwColumnHeaderSortArrowDown, LvwColumnHeaderSortArrowNone
                    .SortOrder = LvwSortOrderAscending

                Case LvwColumnHeaderSortArrowUp
                    .SortOrder = LvwSortOrderDescending
            End Select

            .SelectedColumn = ColumnHeader
        Else

            For i = 1 To .ColumnHeaders.Count

                If i <> ColumnHeader.Index Then
                    .ColumnHeaders(i).Icon = 0
                Else

                    If ColumnHeader.Icon = 0 Then
                        ColumnHeader.Icon = 1
                    Else

                        If ColumnHeader.Icon = 2 Then
                            ColumnHeader.Icon = 1
                        ElseIf ColumnHeader.Icon = 1 Then
                            ColumnHeader.Icon = 2
                        End If
                    End If
                End If

            Next i

            Select Case ColumnHeader.Icon

                Case 1, 0
                    .SortOrder = LvwSortOrderAscending

                Case 2
                    .SortOrder = LvwSortOrderDescending
            End Select

        End If

        .Sorted = True

        If Not .SelectedItem Is Nothing Then .SelectedItem.EnsureVisible
    End With

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lvDevices_ItemClick
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   Item (LvwListItem)
'                              Button (Integer)
'!--------------------------------------------------------------------------------
Private Sub lvDevices_ItemClick(ByVal Item As LvwListItem, ByVal Button As Integer)
    txtFindText.Text = ParseHwid(Item.Text)
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lvDevices_ItemDblClick
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   Item (LvwListItem)
'                              Button (Integer)
'!--------------------------------------------------------------------------------
Private Sub lvDevices_ItemDblClick(ByVal Item As LvwListItem, ByVal Button As Integer)

    Dim strOrigHwid As String

    If Button = vbLeftButton Then
        txtFindText.Text = ParseHwid(Item.Text)
        strOrigHwid = Item.SubItems(6)
        OpenDeviceProp strOrigHwid
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lvDevices_MouseDown
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   Button (Integer)
'                              Shift (Integer)
'                              X (Single)
'                              Y (Single)
'!--------------------------------------------------------------------------------
Private Sub lvDevices_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

    If Button = vbRightButton Then
        OpenContextMenu Me, Me.mnuContext
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub mnuContextDelete_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub mnuContextDelete_Click()

    Dim strOrigHwid              As String
    Dim mbDeleteDriverByHwidTemp As Boolean

    strOrigHwid = lvDevices.SelectedItem
    mbDeleteDriverByHwidTemp = DeleteDriverbyHwid(strOrigHwid)

    If mbDeleteDriverByHwidTemp Then
        If Not mbDeleteDriverByHwid Then
            mbDeleteDriverByHwid = True
        End If
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub mnuContextProperties_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub mnuContextProperties_Click()

    Dim strOrigHwid As String

    strOrigHwid = lvDevices.ListItems(lvDevices.SelectedItem.Index).SubItems(6)
    OpenDeviceProp strOrigHwid
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub optGrp1_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub optGrp1_Click()
    LoadListbyMode
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub optGrp2_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub optGrp2_Click()
    LoadListbyMode
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub optGrp3_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub optGrp3_Click()
    LoadListbyMode
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub optGrp4_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Public Sub optGrp4_Click()
    LoadListbyMode
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub txtFindText_Change
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub txtFindText_Change()
    cmdGoSite.Enabled = LenB(txtFindText.Text)
End Sub

