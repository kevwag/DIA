VERSION 5.00
Begin VB.Form frmAbout 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "� ���������..."
   ClientHeight    =   7215
   ClientLeft      =   45
   ClientTop       =   540
   ClientWidth     =   9630
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmAbout.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   7215
   ScaleWidth      =   9630
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin prjDIADBS.ctlXpButton cmdHomePage 
      Height          =   735
      Left            =   7560
      TabIndex        =   2
      Top             =   5505
      Width           =   1950
      _ExtentX        =   3440
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "HomePage"
      ButtonStyle     =   3
      PictureWidth    =   48
      PictureHeight   =   48
      ShowFocusRect   =   0   'False
      XPColor_Pressed =   15116940
      XPColor_Hover   =   4692449
      TextColor       =   0
      MenuCaption0    =   "#"
      MenuExist       =   -1  'True
   End
   Begin prjDIADBS.ctlXpButton cmdOsZoneNet 
      Height          =   735
      Left            =   5520
      TabIndex        =   3
      Top             =   5505
      Width           =   1950
      _ExtentX        =   3440
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "���������� �� OsZone.Net"
      ButtonStyle     =   3
      XPColor_Pressed =   15116940
      XPColor_Hover   =   4692449
   End
   Begin prjDIADBS.ctlXpButton cmdCheckUpd 
      Height          =   735
      Left            =   1140
      TabIndex        =   4
      Top             =   6345
      Width           =   1950
      _ExtentX        =   3440
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "��������� ����������..."
      ButtonStyle     =   3
      PictureWidth    =   48
      PictureHeight   =   48
      ShowFocusRect   =   0   'False
      XPColor_Pressed =   15116940
      XPColor_Hover   =   4692449
      TextColor       =   0
      MenuCaption0    =   "#"
   End
   Begin prjDIADBS.ctlXpButton cmdLicence 
      Height          =   735
      Left            =   2070
      TabIndex        =   12
      Top             =   5505
      Width           =   1950
      _ExtentX        =   3440
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "������������ ����������"
      ButtonStyle     =   3
      PictureWidth    =   48
      PictureHeight   =   48
      ShowFocusRect   =   0   'False
      XPColor_Pressed =   15116940
      XPColor_Hover   =   4692449
      TextColor       =   0
      MenuCaption0    =   "#"
   End
   Begin prjDIADBS.ctlXpButton cmdDonate 
      Height          =   735
      Left            =   60
      TabIndex        =   5
      Top             =   5505
      Width           =   1950
      _ExtentX        =   3440
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "���������� ������"
      ButtonStyle     =   3
      PictureWidth    =   51
      PictureHeight   =   28
      ShowFocusRect   =   0   'False
      XPColor_Pressed =   15116940
      XPColor_Hover   =   4692449
      TextColor       =   0
      MenuCaption0    =   "#"
   End
   Begin prjDIADBS.ctlXpButton cmdExit 
      Height          =   735
      Left            =   6540
      TabIndex        =   1
      Top             =   6345
      Width           =   1950
      _ExtentX        =   3440
      _ExtentY        =   1296
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Caption         =   "�������"
      ButtonStyle     =   3
      PictureWidth    =   0
      PictureHeight   =   0
      ShowFocusRect   =   0   'False
      XPColor_Pressed =   15116940
      XPColor_Hover   =   4692449
   End
   Begin prjDIADBS.ctlJCbutton ctlAquaButton 
      Height          =   1995
      Left            =   75
      TabIndex        =   0
      Top             =   120
      Width           =   2100
      _ExtentX        =   3704
      _ExtentY        =   3519
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ButtonStyle     =   10
      BackColor       =   16765357
      Caption         =   ""
      PictureNormal   =   "frmAbout.frx":000C
      PictureShadow   =   -1  'True
      CaptionEffects  =   0
      TooltipBackColor=   0
   End
   Begin prjDIADBS.LabelW lblTranslator 
      Height          =   315
      Left            =   105
      TabIndex        =   6
      Top             =   2820
      Width           =   9435
      _ExtentX        =   16642
      _ExtentY        =   556
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   4
      BackStyle       =   0
      Caption         =   "������� ���������: �������� �����"
   End
   Begin prjDIADBS.LabelW lblThanks 
      Height          =   195
      Index           =   0
      Left            =   120
      TabIndex        =   11
      Top             =   3180
      Width           =   2505
      _ExtentX        =   4419
      _ExtentY        =   344
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      MousePointer    =   4
      BackStyle       =   0
      Caption         =   "�������������:"
      AutoSize        =   -1  'True
      WordWrap        =   0   'False
   End
   Begin prjDIADBS.LabelW lblAuthor 
      Height          =   375
      Left            =   105
      TabIndex        =   7
      Top             =   2520
      Width           =   9435
      _ExtentX        =   16642
      _ExtentY        =   661
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   400
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackStyle       =   0
      Caption         =   "����� ���������: �������� �����"
   End
   Begin prjDIADBS.LabelW lblInfo 
      Height          =   1095
      Left            =   2280
      TabIndex        =   8
      Top             =   1440
      Width           =   7275
      _ExtentX        =   12832
      _ExtentY        =   1931
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Alignment       =   2
      BackStyle       =   0
      Caption         =   "�������� ���������"
   End
   Begin prjDIADBS.LabelW lblNameProg 
      Height          =   1305
      Left            =   2280
      TabIndex        =   9
      Top             =   45
      Width           =   7260
      _ExtentX        =   12806
      _ExtentY        =   2302
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   15.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      Alignment       =   2
      BackStyle       =   0
      Caption         =   "Label1"
   End
   Begin prjDIADBS.LabelW lblMailTo 
      Height          =   240
      Left            =   105
      TabIndex        =   10
      Top             =   5160
      Width           =   3525
      _ExtentX        =   6218
      _ExtentY        =   423
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   -1  'True
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      ForeColor       =   12582912
      MousePointer    =   4
      BackStyle       =   0
      Caption         =   "�������� E-mail ������ ���������"
   End
End
Attribute VB_Name = "frmAbout"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private strTranslatorName As String
Private strTranslatorUrl  As String
Private strFormName       As String
Private strCreditList()   As String
Private lngCurCredit      As Long

Private Const strUrlOsZoneNetThread As String = "http://forum.oszone.net/thread-139908.html"

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

    SetBtnFontProperties cmdDonate
    SetBtnFontProperties cmdLicence
    SetBtnFontProperties cmdOsZoneNet
    SetBtnFontProperties cmdHomePage
    SetBtnFontProperties cmdExit
End Sub

Private Sub cmdCheckUpd_Click()

    CheckUpd False
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdDonate_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdDonate_Click()
    frmDonate.Show vbModal, Me
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdExit_Click
'! Description (��������)  :   [����� �� �����]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdExit_Click()
    Unload Me
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdLicence_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdLicence_Click()
    frmLicence.Show vbModal, Me
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdOsZoneNet_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdOsZoneNet_Click()
    RunUtilsShell Kavichki & strUrlOsZoneNetThread & Kavichki, False
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdSoftGetNet_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub cmdHomePage_Click()
    RunUtilsShell Kavichki & strUrl_MainWWWSite & Kavichki, False
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub cmdSoftGetNet_ClickMenu
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   mnuIndex (Integer)
'!--------------------------------------------------------------------------------
Private Sub cmdHomePage_ClickMenu(mnuIndex As Integer)

    Dim cmdString   As String

    Select Case mnuIndex

        Case 0
            cmdString = Kavichki & strUrl_MainWWWSite & Kavichki

        Case 2
            cmdString = Kavichki & strUrl_MainWWWForum & Kavichki
    End Select

    RunUtilsShell cmdString, False
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub ctlAquaButton1_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub ctlAquaButton_Click()
    RunUtilsShell Kavichki & strUrl_MainWWWSite & Kavichki, False
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
'! Description (��������)  :   [������� ���  �������� �����]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub Form_Load()
    SetupVisualStyles Me

    With Me
        strFormName = .Name
        SetIcon .hWnd, "FRMABOUT", False
        .Left = (lngRightWorkArea - lngLeftWorkArea) / 2 - .Width / 2
        .Top = (lngBottomWorkArea - lngTopWorkArea) / 2 - .Height / 2
    End With

    lblNameProg.Caption = strFrmMainCaptionTemp & vbNewLine & " v." & strProductVersion & vbNewLine & strFrmMainCaptionTempDate & strDateProgram & ")"

    LoadIconImage2Btn cmdExit, "BTN_EXIT", strPathImageMainWork
    LoadIconImage2Btn cmdDonate, "BTN_DONATE", strPathImageMainWork
    LoadIconImage2Btn cmdCheckUpd, "BTN_UPDATE", strPathImageMainWork
    LoadIconImage2Btn cmdHomePage, "BTN_HOME", strPathImageMainWork
    LoadIconImage2Btn cmdLicence, "BTN_LICENCE", strPathImageMainWork

    Select Case strPCLangCurrentID

        Case "0419"
            lblAuthor.Caption = "����� ���������: �������� ����� aka Romeo91"
            lblThanks(0).Caption = "��� �������������:"
        Case Else
            lblAuthor.Caption = "Author of the program: Goloveev Roman (Romeo91)"
            lblThanks(0).Caption = "My thanks:"
    End Select

    With cmdHomePage
        If .MenuExist Then
            If .MenuCount = 0 Then
                .AddMenu "Site"
                .AddMenu "-"
                .AddMenu "Forum"
            End If
        End If
    End With

    ' ����������z ����������
    If mbMultiLanguage Then
        Localise strPCLangCurrentPath
    Else
        ' ���������� �����
        FontCharsetChange
    End If

    LoadThankYou
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub ctlAquaButton1_Click
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub lblAuthor_Click()
    RunUtilsShell Kavichki & strUrl_MainWWWSite & Kavichki, False
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lblMailTo_MouseDown
'! Description (��������)  :   [������� ������ �� "��������� � �������������"]
'! Parameters  (����������):   Button (Integer)
'                              Shift (Integer)
'                              X (Single)
'                              Y (Single)
'!--------------------------------------------------------------------------------
Private Sub lblMailTo_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
    
    Dim strSubject As String
    
    If Button = vbLeftButton Then
        strSubject = "My wishes for the program (" & App.ProductName & ")"
        ShellExecute Me.hWnd, vbNullString, "mailto:Romeo91<roman-novosib@ngs.ru>?Subject=" & Replace$(strSubject, " ", "%20"), vbNullString, "c:\", 1
    End If
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lblTranslator_MouseDown
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   Button (Integer)
'                              Shift (Integer)
'                              X (Single)
'                              Y (Single)
'!--------------------------------------------------------------------------------
Private Sub lblTranslator_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)

    Dim cmdString   As String
    Dim nRetShellEx As Boolean

    If LenB(strTranslatorUrl) Then
        If Button = vbLeftButton Then
            RunUtilsShell Kavichki & strTranslatorUrl & Kavichki, False
        End If
    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub LoadTranslator
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub LoadTranslator()

    Select Case strPCLangCurrentID

        Case "0419"
            lblTranslator.Caption = "������� ���������: " & strTranslatorName

        Case Else
            lblTranslator.Caption = "Translation of the program: " & strTranslatorName
    End Select

    If LenB(strTranslatorUrl) Then

        With lblTranslator
            .MouseIcon = lblMailTo.MouseIcon
            .MousePointer = lblMailTo.MousePointer
            .ForeColor = lblMailTo.ForeColor
        End With

    End If

End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub Localise
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):   StrPathFile (String)
'!--------------------------------------------------------------------------------
Private Sub Localise(ByVal StrPathFile As String)
    ' ���������� ����� ��������� (��������� ������ �� �� ��� ������� �� �������������� ������)
    FontCharsetChange
    ' �������� �����
    Me.Caption = LocaliseString(StrPathFile, strFormName, strFormName, Me.Caption)
    '������
    cmdDonate.Caption = LocaliseString(StrPathFile, strFormName, "cmdDonate", cmdDonate.Caption)
    cmdCheckUpd.Caption = LocaliseString(StrPathFile, strFormName, "cmdCheckUpd", cmdCheckUpd.Caption)
    cmdLicence.Caption = LocaliseString(StrPathFile, strFormName, "cmdLicence", cmdLicence.Caption)
    cmdHomePage.Caption = LocaliseString(StrPathFile, strFormName, "cmdHomePage", cmdHomePage.Caption)
    cmdOsZoneNet.Caption = LocaliseString(StrPathFile, strFormName, "cmdOsZoneNet", cmdOsZoneNet.Caption)
    cmdExit.Caption = LocaliseString(StrPathFile, strFormName, "cmdExit", cmdExit.Caption)
    ' ������
    lblMailTo.Caption = LocaliseString(StrPathFile, strFormName, "lblMailTo", lblMailTo.Caption)
    lblInfo.Caption = LocaliseString(StrPathFile, strFormName, "lblInfo", lblInfo.Caption)
    ' ������� ���������
    strTranslatorName = LocaliseString(StrPathFile, "Lang", "TranslatorName", lblTranslator.Caption)
    strTranslatorUrl = LocaliseString(StrPathFile, "Lang", "TranslatorUrl", vbNullString)
    LoadTranslator
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub LoadThankYou
'! Description (��������)  :   [type_description_here]
'! Parameters  (����������):
'!--------------------------------------------------------------------------------
Private Sub LoadThankYou()
    lngCurCredit = 1
    GenerateThankyou "SamLab", "http://driveroff.net/"
    GenerateThankyou "OSzone.net forum's users", "http://forum.oszone.net/forum-62.html"
    GenerateThankyou "Krool", "http://www.vbforums.com/showthread.php?698563-CommonControls-(Replacement-of-the-MS-common-controls)"
    GenerateThankyou "Juned Chhipa", "http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=71482&lngWId=1"
    GenerateThankyou "Leandro Ascierto", "http://leandroascierto.com/blog/clsmenuimage/"
    GenerateThankyou "VBnet and Randy Birch", "http://vbnet.mvps.org/"
    'cmdparsing
    GenerateThankyou "EliteXP Software Solutions", "http://www.planet-source-code.com/vb/scripts/ShowCode.asp?txtCodeId=72018&lngWId=1"
    'ucPickBox' ucStatusBar
    GenerateThankyou "Paul R.Territos", "http://planetsourcecode.com/vb/scripts/ShowCode.asp?txtCodeId=63905&lngWId=1"
    '[VB6] Function Wait (non-freezing & non-CPU-intensive)
    GenerateThankyou "Bonnie West", "http://www.vbforums.com/showthread.php?700373-VB6-Shell-amp-Wait"
    'Team HomeWork
    ' Timed MessageBox
    GenerateThankyou "Anirudha Vengurlekar"
    ' SortDMArray
    GenerateThankyou "Ellis Dee"
    GenerateThankyou "Zhu JinYong"
    'AnimateForm - Jim Jose
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub GenerateThankyou
'! Description (��������)  :   [��������� ������ ������������� �� ������� �� ��������]
'!                              Idea from
'!                              Copyright �2001-2013 by Tanner Helland
'!                              http://www.tannerhelland.com/photodemon
'! Parameters  (����������):   thxText (String)
'                              creditURL (String = vbNullString)
'!--------------------------------------------------------------------------------
Private Sub GenerateThankyou(ByVal thxText As String, Optional ByVal creditURL As String = vbNullString)
    'Generate a new label
    Load lblThanks(lngCurCredit)

    'Because I now have too many people to thank, it's necessary to split the list into multiple columns
    Dim columnLimit As Long

    columnLimit = 5

    Dim thxOffset As Long

    thxOffset = 750

    With lblThanks(lngCurCredit)

        If lngCurCredit = 1 Then
            .Top = lblThanks(lngCurCredit - 1).Top + lblThanks(lngCurCredit - 1).Height + 300
            .Left = lblThanks(0).Left + 30 + thxOffset
        ElseIf lngCurCredit < columnLimit Then
            .Top = lblThanks(lngCurCredit - 1).Top + lblThanks(lngCurCredit - 1).Height + 60
            .Left = lblThanks(0).Left + 30 + thxOffset
        ElseIf lngCurCredit = columnLimit Then
            .Top = lblThanks(lngCurCredit - 1).Top + lblThanks(lngCurCredit - 1).Height + 300 - (lblThanks(columnLimit - 1).Top - lblThanks(0).Top)
            .Left = lblThanks(0).Left + 2700 + thxOffset
        ElseIf lngCurCredit < columnLimit * 2 - 1 Then
            .Top = lblThanks(lngCurCredit - 1).Top + lblThanks(lngCurCredit - 1).Height + 60
            .Left = lblThanks(0).Left + 2700 + thxOffset
        ElseIf lngCurCredit = columnLimit * 2 - 1 Then
            .Top = lblThanks(lngCurCredit - 1).Top + lblThanks(lngCurCredit - 1).Height + 300 - (lblThanks(columnLimit * 2 - 2).Top - lblThanks(0).Top)
            .Left = lblThanks(0).Left + 5400 + thxOffset
        Else
            .Top = lblThanks(lngCurCredit - 1).Top + lblThanks(lngCurCredit - 1).Height + 60
            .Left = lblThanks(0).Left + 5400 + thxOffset
        End If

        .Caption = thxText

        If LenB(creditURL) = 0 Then
            .MousePointer = vbDefault
        Else
            .Font.Underline = True
            .MouseIcon = lblMailTo.MouseIcon
            .MousePointer = lblMailTo.MousePointer
            .ForeColor = lblMailTo.ForeColor
            .ToolTipText = creditURL
        End If

        .Visible = True
    End With

    ReDim Preserve strCreditList(0 To lngCurCredit) As String

    strCreditList(lngCurCredit) = creditURL
    lngCurCredit = lngCurCredit + 1
End Sub

'!--------------------------------------------------------------------------------
'! Procedure   (�������)   :   Sub lblThanks_Click
'! Description (��������)  :   [When a thank-you credit is clicked, launch the corresponding website]
'! Parameters  (����������):   Index (Integer)
'!--------------------------------------------------------------------------------
Private Sub lblThanks_Click(Index As Integer)

    If LenB(strCreditList(Index)) Then
        RunUtilsShell Kavichki & strCreditList(Index) & Kavichki, False
    End If

End Sub
