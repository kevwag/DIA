VERSION 5.00
Begin VB.Form frmSilent 
   BorderStyle     =   3  'Fixed Dialog
   Caption         =   "������� ����� �����"
   ClientHeight    =   2400
   ClientLeft      =   45
   ClientTop       =   435
   ClientWidth     =   4680
   BeginProperty Font 
      Name            =   "Tahoma"
      Size            =   8.25
      Charset         =   204
      Weight          =   400
      Underline       =   0   'False
      Italic          =   0   'False
      Strikethrough   =   0   'False
   EndProperty
   Icon            =   "frmSilent.frx":0000
   KeyPreview      =   -1  'True
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   MinButton       =   0   'False
   ScaleHeight     =   2400
   ScaleWidth      =   4680
   ShowInTaskbar   =   0   'False
   StartUpPosition =   1  'CenterOwner
   Begin VB.Timer tmrSilent 
      Enabled         =   0   'False
      Left            =   4200
      Top             =   1080
   End
   Begin prjDIADBS.ctlJCbutton cmdOK 
      Height          =   750
      Left            =   2400
      TabIndex        =   0
      Top             =   1560
      Width           =   2205
      _ExtentX        =   3889
      _ExtentY        =   1323
      ButtonStyle     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   12244692
      Caption         =   "��������� ��������� � �����"
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      CaptionEffects  =   0
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjDIADBS.ctlJCbutton cmdExit 
      Height          =   735
      Left            =   60
      TabIndex        =   1
      Top             =   1560
      Width           =   2200
      _ExtentX        =   3889
      _ExtentY        =   1296
      ButtonStyle     =   13
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   8.25
         Charset         =   204
         Weight          =   400
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackColor       =   12244692
      Caption         =   "����� ��� ����������"
      PictureAlign    =   0
      PicturePushOnHover=   -1  'True
      PictureShadow   =   -1  'True
      CaptionEffects  =   0
      TooltipBackColor=   0
      ColorScheme     =   3
   End
   Begin prjDIADBS.LabelW lblTimeInSec 
      Height          =   255
      Left            =   3480
      TabIndex        =   2
      Top             =   1215
      Width           =   855
      _ExtentX        =   0
      _ExtentY        =   0
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
      Caption         =   "������"
   End
   Begin prjDIADBS.LabelW lblTimer 
      Height          =   375
      Left            =   3000
      TabIndex        =   3
      Top             =   1215
      Width           =   375
      _ExtentX        =   0
      _ExtentY        =   0
      BeginProperty Font {0BE35203-8F91-11CE-9DE3-00AA004BB851} 
         Name            =   "Tahoma"
         Size            =   9.75
         Charset         =   204
         Weight          =   700
         Underline       =   0   'False
         Italic          =   0   'False
         Strikethrough   =   0   'False
      EndProperty
      BackStyle       =   0
      Caption         =   "10"
   End
   Begin prjDIADBS.LabelW lblTimerText 
      Height          =   255
      Left            =   240
      TabIndex        =   4
      Top             =   1215
      Width           =   2655
      _ExtentX        =   0
      _ExtentY        =   0
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
      Caption         =   "�� ������� ��������� ��������: "
   End
   Begin prjDIADBS.LabelW lblInfo 
      Height          =   1000
      Left            =   120
      TabIndex        =   5
      Top             =   50
      Width           =   4455
      _ExtentX        =   7858
      _ExtentY        =   1773
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
      Caption         =   $"frmSilent.frx":000C
   End
End
Attribute VB_Name = "frmSilent"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Private miTimerSecond                   As Integer

Private strFormName                     As String

Private Sub FontCharsetChange()
' ���������� �����
    With Me.Font
        .Name = strOtherForm_FontName
        .Size = lngOtherForm_FontSize
        .Charset = lngDialog_Charset
    End With

End Sub

Private Sub cmdExit_Click()
    tmrSilent.Enabled = False
    ChangeStatusTextAndDebug strMessages(101), "Silent mode break by User"
    tmrSilent.Interval = 0
    mbSilentRun = False
    Unload Me

End Sub

Private Sub cmdOK_Click()
    tmrSilent.Enabled = False
    tmrSilent.Interval = 0
    ' �������� ����� �����
    mbSilentRun = True
    ' �������� �����
    Unload Me

End Sub

'! -----------------------------------------------------------
'!  �������     :  Form_KeyDown
'!  ����������  :  KeyCode As Integer, Shift As Integer
'!  ��������    :  ��������� ������� ������ ����������
'! -----------------------------------------------------------
Private Sub Form_KeyDown(KeyCode As Integer, Shift As Integer)

    If KeyCode = vbKeyEscape Then
        cmdExit_Click

    End If

End Sub

Private Sub Form_Load()

    SetupVisualStyles Me

    With Me
        strFormName = .Name
        SetIcon .hWnd, "frmSilent", False
        .Left = (lngRightWorkArea - lngLeftWorkArea) / 2 - .Width / 2
        .Top = (lngBottomWorkArea - lngTopWorkArea) / 2 - .Height / 2
    End With


    'Me
    LoadIconImage2BtnJC cmdOK, "BTN_SAVE", strPathImageMainWork
    LoadIconImage2BtnJC cmdExit, "BTN_EXIT", strPathImageMainWork

    ' ����������z ����������
    If mbMultiLanguage Then
        Localise strPCLangCurrentPath
    Else
        ' ���������� �����
        FontCharsetChange

    End If

    miTimerSecond = miSilentRunTimer
    lblTimer.Caption = miTimerSecond
    tmrSilent.Enabled = True
    tmrSilent.Interval = 1000

End Sub

'Private Sub Form_Terminate()
'
'    On Error Resume Next
'
'    If Forms.Count = 0 Then
'        UnloadApp
'
'    End If
'
'End Sub

Private Sub Localise(ByVal strPathFile As String)

' ���������� ����� ��������� (��������� ������ �� �� ��� ������� �� �������������� ������)
    FontCharsetChange
    ' �������� �����
    Me.Caption = LocaliseString(strPathFile, strFormName, strFormName, Me.Caption)
    ' ������
    lblTimerText.Caption = LocaliseString(strPathFile, strFormName, "lblTimerText", lblTimerText.Caption)
    lblTimeInSec.Caption = LocaliseString(strPathFile, strFormName, "lblTimeInSec", lblTimeInSec.Caption)
    lblInfo.Caption = LocaliseString(strPathFile, strFormName, "lblInfo", lblInfo.Caption)
    '������
    cmdOK.Caption = LocaliseString(strPathFile, strFormName, "cmdOK", cmdOK.Caption)
    cmdExit.Caption = LocaliseString(strPathFile, strFormName, "cmdExit", cmdExit.Caption)

End Sub

Private Sub tmrSilent_Timer()

    If miTimerSecond = 0 Then
        tmrSilent.Enabled = False
        tmrSilent.Interval = 0
        mbSilentRun = True
        Unload Me

    End If

    miTimerSecond = miTimerSecond - 1
    lblTimer.Caption = miTimerSecond

    'lblTimer.Refresh
End Sub