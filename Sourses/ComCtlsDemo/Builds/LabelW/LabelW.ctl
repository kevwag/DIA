VERSION 5.00
Begin VB.UserControl LabelW 
   CanGetFocus     =   0   'False
   ClientHeight    =   1800
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2400
   ClipBehavior    =   0  'None
   ClipControls    =   0   'False
   DataBindingBehavior=   1  'vbSimpleBound
   ForwardFocus    =   -1  'True
   HasDC           =   0   'False
   PropertyPages   =   "LabelW.ctx":0000
   ScaleHeight     =   120
   ScaleMode       =   3  'Pixel
   ScaleWidth      =   160
   ToolboxBitmap   =   "LabelW.ctx":0023
   Windowless      =   -1  'True
End
Attribute VB_Name = "LabelW"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit
Private Type RECT
Left As Long
Top As Long
Right As Long
Bottom As Long
End Type
Public Event Click()
Attribute Click.VB_Description = "Occurs when the user presses and then releases a mouse button over an object."
Attribute Click.VB_UserMemId = -600
Public Event DblClick()
Attribute DblClick.VB_Description = "Occurs when the user presses and releases a mouse button and then presses and releases it again over an object."
Attribute DblClick.VB_UserMemId = -601
Public Event Change()
Attribute Change.VB_Description = "Occurs when the contents of a control have changed."
Public Event MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseDown.VB_Description = "Occurs when the user presses the mouse button while an object has the focus."
Attribute MouseDown.VB_UserMemId = -605
Public Event MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseMove.VB_Description = "Occurs when the user moves the mouse."
Attribute MouseMove.VB_UserMemId = -606
Public Event MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute MouseUp.VB_Description = "Occurs when the user releases the mouse button while an object has the focus."
Attribute MouseUp.VB_UserMemId = -607
Public Event OLECompleteDrag(Effect As Long)
Attribute OLECompleteDrag.VB_Description = "Occurs at the OLE drag/drop source control after a manual or automatic drag/drop has been completed or canceled."
Public Event OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
Attribute OLEDragDrop.VB_Description = "Occurs when data is dropped onto the control via an OLE drag/drop operation, and OLEDropMode is set to manual."
Public Event OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
Attribute OLEDragOver.VB_Description = "Occurs when the mouse is moved over the control during an OLE drag/drop operation, if its OLEDropMode property is set to manual."
Public Event OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
Attribute OLEGiveFeedback.VB_Description = "Occurs at the source control of an OLE drag/drop operation when the mouse cursor needs to be changed."
Public Event OLESetData(Data As DataObject, DataFormat As Integer)
Attribute OLESetData.VB_Description = "Occurs at the OLE drag/drop source control when the drop target requests data that was not provided to the DataObject during the OLEDragStart event."
Public Event OLEStartDrag(Data As DataObject, AllowedEffects As Long)
Attribute OLEStartDrag.VB_Description = "Occurs when an OLE drag/drop operation is initiated either manually or automatically."
Private Declare Function DrawText Lib "user32" Alias "DrawTextW" (ByVal hDC As Long, ByVal lpchText As Long, ByVal nCount As Long, ByRef lpRect As RECT, ByVal uFormat As Long) As Long
Private Declare Function SetRect Lib "user32" (ByRef lpRect As RECT, ByVal X1 As Long, ByVal Y1 As Long, ByVal X2 As Long, ByVal Y2 As Long) As Long
Private Declare Function LoadCursor Lib "user32" Alias "LoadCursorW" (ByVal hInstance As Long, ByVal lpCursorName As Any) As Long
Private Declare Function SetTextColor Lib "gdi32" (ByVal hDC As Long, ByVal crColor As Long) As Long
Private Declare Function GetSystemMetrics Lib "user32" (ByVal nIndex As Long) As Long
Private Declare Function DrawEdge Lib "user32" (ByVal hDC As Long, ByRef qRC As RECT, ByVal Edge As Long, ByVal grfFlags As Long) As Long
Private Const DT_BOTTOM As Long = &H8
Private Const DT_CALCRECT As Long = &H400
Private Const DT_CENTER As Long = &H1
Private Const DT_EDITCONTROL As Long = &H2000
Private Const DT_END_ELLIPSIS As Long = &H8000&
Private Const DT_EXPANDTABS As Long = &H40
Private Const DT_EXTERNALLEADING As Long = &H200
Private Const DT_HIDEPREFIX As Long = &H100000
Private Const DT_INTERNAL As Long = &H1000
Private Const DT_LEFT As Long = &H0
Private Const DT_MODIFYSTRING As Long = &H10000
Private Const DT_NOCLIP As Long = &H100
Private Const DT_NOFULLWIDTHCHARBREAK As Long = &H80000
Private Const DT_NOPREFIX As Long = &H800
Private Const DT_PATH_ELLIPSIS As Long = &H4000
Private Const DT_PREFIXONLY As Long = &H200000
Private Const DT_RIGHT As Long = &H2
Private Const DT_RTLREADING As Long = &H20000
Private Const DT_SINGLELINE As Long = &H20
Private Const DT_TABSTOP As Long = &H80
Private Const DT_TOP As Long = &H0
Private Const DT_VCENTER As Long = &H4
Private Const DT_WORDBREAK As Long = &H10
Private Const DT_WORD_ELLIPSIS As Long = &H40000
Private Const SM_CXBORDER As Long = 5
Private Const SM_CYBORDER As Long = 6
Private Const SM_CXEDGE As Long = 45
Private Const SM_CYEDGE As Long = 46
Private Const SM_CXDLGFRAME As Long = 7
Private Const SM_CYDLGFRAME As Long = 8
Private Const BDR_RAISED As Long = &H5
Private Const BDR_RAISEDINNER As Long = &H4
Private Const BDR_RAISEDOUTER As Long = &H1
Private Const BDR_SUNKEN As Long = &HA
Private Const BDR_SUNKENINNER As Long = &H8
Private Const BDR_SUNKENOUTER As Long = &H2
Private Const BF_LEFT As Long = &H1
Private Const BF_RIGHT As Long = &H4
Private Const BF_TOP As Long = &H2
Private Const BF_BOTTOM As Long = &H8
Private Const BF_RECT As Long = (BF_LEFT Or BF_TOP Or BF_RIGHT Or BF_BOTTOM)
Implements OLEGuids.IPerPropertyBrowsingVB
Private LabelAutoSizeFlag As Boolean
Private DispIDMousePointer As Long
Private WithEvents PropFont As StdFont
Attribute PropFont.VB_VarHelpID = -1
Private PropMousePointer As Integer, PropMouseIcon As IPictureDisp
Private PropAlignment As VBRUN.AlignmentConstants
Private PropBorderStyle As CCBorderStyleConstants
Private PropBackStyle As CCBackStyleConstants
Private PropCaption As String
Private PropUseMnemonic As Boolean
Private PropAutoSize As Boolean
Private PropWordWrap As Boolean
Private PropAppearance As CCAppearanceConstants

Private Sub IPerPropertyBrowsingVB_GetDisplayString(ByRef Handled As Boolean, ByVal DispID As Long, ByRef DisplayName As String)
If DispID = DispIDMousePointer Then
    Call ComCtlsIPPBSetDisplayStringMousePointer(PropMousePointer, DisplayName)
    Handled = True
End If
End Sub

Private Sub IPerPropertyBrowsingVB_GetPredefinedStrings(ByRef Handled As Boolean, ByVal DispID As Long, ByRef StringsOut() As String, ByRef CookiesOut() As Long)
If DispID = DispIDMousePointer Then
    Call ComCtlsIPPBSetPredefinedStringsMousePointer(StringsOut(), CookiesOut())
    Handled = True
End If
End Sub

Private Sub IPerPropertyBrowsingVB_GetPredefinedValue(ByRef Handled As Boolean, ByVal DispID As Long, ByVal Cookie As Long, ByRef Value As Variant)
If DispID = DispIDMousePointer Then
    Value = Cookie
    Handled = True
End If
End Sub

Private Sub UserControl_Initialize()
DispIDMousePointer = GetDispID(Me, "MousePointer")
Call SetVTableSubclass(Me, VTableInterfacePerPropertyBrowsing)
End Sub

Private Sub UserControl_InitProperties()
Set PropFont = Ambient.Font
Set UserControl.Font = PropFont
PropMousePointer = 0: Set PropMouseIcon = Nothing
PropAlignment = vbLeftJustify
PropBorderStyle = CCBorderStyleNone
PropCaption = Ambient.DisplayName
PropUseMnemonic = True
PropAutoSize = False
PropWordWrap = True
PropAppearance = UserControl.Appearance
End Sub

Private Sub UserControl_ReadProperties(PropBag As PropertyBag)
With PropBag
Set PropFont = .ReadProperty("Font", Ambient.Font)
Set UserControl.Font = PropFont
Me.BackColor = .ReadProperty("BackColor", vbButtonFace)
Me.ForeColor = .ReadProperty("ForeColor", vbButtonText)
Me.Enabled = .ReadProperty("Enabled", True)
Me.OLEDropMode = .ReadProperty("OLEDropMode", vbOLEDropNone)
PropMousePointer = .ReadProperty("MousePointer", 0)
Set PropMouseIcon = .ReadProperty("MouseIcon", Nothing)
Me.MousePointer = PropMousePointer
PropAlignment = .ReadProperty("Alignment", vbLeftJustify)
PropBorderStyle = .ReadProperty("BorderStyle", CCBorderStyleNone)
Me.BackStyle = .ReadProperty("BackStyle", CCBackStyleOpaque)
PropCaption = .ReadProperty("Caption", vbNullString)
PropUseMnemonic = .ReadProperty("UseMnemonic", True)
PropAutoSize = .ReadProperty("AutoSize", False)
PropWordWrap = .ReadProperty("WordWrap", True)
PropAppearance = .ReadProperty("Appearance", CCAppearance3D)
End With
If PropUseMnemonic = True Then
    UserControl.AccessKeys = ChrW(AccelCharCode(PropCaption))
Else
    UserControl.AccessKeys = vbNullString
End If
End Sub

Private Sub UserControl_WriteProperties(PropBag As PropertyBag)
With PropBag
.WriteProperty "Font", PropFont, Ambient.Font
.WriteProperty "BackColor", Me.BackColor, vbButtonFace
.WriteProperty "ForeColor", Me.ForeColor, vbButtonText
.WriteProperty "Enabled", Me.Enabled, True
.WriteProperty "OLEDropMode", Me.OLEDropMode, vbOLEDropNone
.WriteProperty "MousePointer", PropMousePointer, 0
.WriteProperty "MouseIcon", PropMouseIcon, Nothing
.WriteProperty "Alignment", PropAlignment, vbLeftJustify
.WriteProperty "BorderStyle", PropBorderStyle, CCBorderStyleNone
.WriteProperty "BackStyle", Me.BackStyle, CCBackStyleOpaque
.WriteProperty "Caption", PropCaption, vbNullString
.WriteProperty "UseMnemonic", PropUseMnemonic, True
.WriteProperty "AutoSize", PropAutoSize, False
.WriteProperty "WordWrap", PropWordWrap, True
.WriteProperty "Appearance", PropAppearance, CCAppearance3D
End With
End Sub

Private Sub UserControl_Paint()
Dim RC As RECT, Format As Long
Dim BorderWidth As Long, BorderHeight As Long
With UserControl
SetRect RC, 0, 0, .ScaleWidth, .ScaleHeight
Select Case PropBorderStyle
    Case CCBorderStyleSingle
        BorderWidth = GetSystemMetrics(SM_CXBORDER)
        BorderHeight = GetSystemMetrics(SM_CYBORDER)
        UserControl.Line (0, 0)-(.ScaleWidth - BorderWidth, .ScaleHeight - BorderHeight), RGB(100, 100, 100), B
    Case CCBorderStyleThin
        BorderWidth = GetSystemMetrics(SM_CXBORDER)
        BorderHeight = GetSystemMetrics(SM_CYBORDER)
        DrawEdge .hDC, RC, BDR_SUNKENOUTER, BF_RECT
    Case CCBorderStyleSunken
        BorderWidth = GetSystemMetrics(SM_CXEDGE)
        BorderHeight = GetSystemMetrics(SM_CYEDGE)
        DrawEdge .hDC, RC, BDR_SUNKEN, BF_RECT
    Case CCBorderStyleRaised
        BorderWidth = GetSystemMetrics(SM_CXDLGFRAME)
        BorderHeight = GetSystemMetrics(SM_CYDLGFRAME)
        DrawEdge .hDC, RC, BDR_RAISED, BF_RECT
End Select
If .Enabled = False Then SetTextColor .hDC, WinColor(vbGrayText)
Format = DT_NOCLIP
Select Case PropAlignment
    Case vbLeftJustify
        Format = Format Or DT_LEFT
    Case vbCenter
        Format = Format Or DT_CENTER
    Case vbRightJustify
        Format = Format Or DT_RIGHT
End Select
If Ambient.RightToLeft = True Then Format = Format Or DT_RTLREADING
If PropUseMnemonic = False Then Format = Format Or DT_NOPREFIX
If PropWordWrap = True Then Format = Format Or DT_WORDBREAK
If PropAutoSize = True And LabelAutoSizeFlag = True Then
    Dim Buffer As String, CalcRect As RECT
    Buffer = PropCaption
    If Buffer = vbNullString Then Buffer = " "
    LSet CalcRect = RC
    DrawText .hDC, StrPtr(Buffer), -1, CalcRect, Format Or DT_CALCRECT
    Dim OldRight As Single, OldCenter As Single, OldWidth As Single
    OldRight = .Extender.Left + .Extender.Width
    OldCenter = .Extender.Left + (.Extender.Width / 2)
    OldWidth = .Extender.Width
    .Size .ScaleX((CalcRect.Right - CalcRect.Left) + (BorderWidth * 2), vbPixels, vbTwips), .ScaleY((CalcRect.Bottom - CalcRect.Top) + (BorderHeight * 2), vbPixels, vbTwips)
    LabelAutoSizeFlag = False
    Select Case PropAlignment
        Case vbCenter
            If .Extender.Left <> (OldCenter - (.Extender.Width / 2)) Then
                .Extender.Left = (OldCenter - (.Extender.Width / 2))
                .Refresh
                Exit Sub
            End If
        Case vbRightJustify
            If .Extender.Left <> (OldRight - .Extender.Width) Then
                .Extender.Left = (OldRight - .Extender.Width)
                .Refresh
                Exit Sub
            End If
    End Select
End If
SetRect RC, RC.Left + BorderWidth, RC.Top + BorderHeight, RC.Right - (BorderWidth * 2), RC.Bottom - (BorderHeight * 2)
If Not PropCaption = vbNullString Then DrawText .hDC, StrPtr(PropCaption), -1, RC, Format
End With
End Sub

Private Sub UserControl_Click()
RaiseEvent Click
End Sub

Private Sub UserControl_DblClick()
RaiseEvent DblClick
End Sub

Private Sub UserControl_MouseDown(Button As Integer, Shift As Integer, X As Single, Y As Single)
RaiseEvent MouseDown(Button, Shift, UserControl.ScaleX(X, vbPixels, vbTwips), UserControl.ScaleY(Y, vbPixels, vbTwips))
End Sub

Private Sub UserControl_MouseMove(Button As Integer, Shift As Integer, X As Single, Y As Single)
RaiseEvent MouseMove(Button, Shift, UserControl.ScaleX(X, vbPixels, vbTwips), UserControl.ScaleY(Y, vbPixels, vbTwips))
End Sub

Private Sub UserControl_MouseUp(Button As Integer, Shift As Integer, X As Single, Y As Single)
RaiseEvent MouseUp(Button, Shift, UserControl.ScaleX(X, vbPixels, vbTwips), UserControl.ScaleY(Y, vbPixels, vbTwips))
End Sub

Private Sub UserControl_OLECompleteDrag(Effect As Long)
RaiseEvent OLECompleteDrag(Effect)
End Sub

Private Sub UserControl_OLEDragDrop(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single)
RaiseEvent OLEDragDrop(Data, Effect, Button, Shift, UserControl.ScaleX(X, vbPixels, vbContainerPosition), UserControl.ScaleY(Y, vbPixels, vbContainerPosition))
End Sub

Private Sub UserControl_OLEDragOver(Data As DataObject, Effect As Long, Button As Integer, Shift As Integer, X As Single, Y As Single, State As Integer)
RaiseEvent OLEDragOver(Data, Effect, Button, Shift, UserControl.ScaleX(X, vbPixels, vbContainerPosition), UserControl.ScaleY(Y, vbPixels, vbContainerPosition), State)
End Sub

Private Sub UserControl_OLEGiveFeedback(Effect As Long, DefaultCursors As Boolean)
RaiseEvent OLEGiveFeedback(Effect, DefaultCursors)
End Sub

Private Sub UserControl_OLESetData(Data As DataObject, DataFormat As Integer)
RaiseEvent OLESetData(Data, DataFormat)
End Sub

Private Sub UserControl_OLEStartDrag(Data As DataObject, AllowedEffects As Long)
RaiseEvent OLEStartDrag(Data, AllowedEffects)
End Sub

Public Sub OLEDrag()
Attribute OLEDrag.VB_Description = "Starts an OLE drag/drop event with the given control as the source."
UserControl.OLEDrag
End Sub

Private Sub UserControl_Resize()
Me.Refresh
End Sub

Private Sub UserControl_HitTest(X As Single, Y As Single, HitResult As Integer)
If HitResult = vbHitResultOutside Then HitResult = vbHitResultHit
End Sub

Private Sub UserControl_Terminate()
Call RemoveVTableSubclass(Me, VTableInterfacePerPropertyBrowsing)
End Sub

Public Property Get Name() As String
Attribute Name.VB_Description = "Returns the name used in code to identify an object."
Name = Ambient.DisplayName
End Property

Public Property Get Tag() As String
Attribute Tag.VB_Description = "Stores any extra data needed for your program."
Tag = Extender.Tag
End Property

Public Property Let Tag(ByVal Value As String)
Extender.Tag = Value
End Property

Public Property Get Parent() As Object
Attribute Parent.VB_Description = "Returns the object on which this object is located."
Set Parent = UserControl.Parent
End Property

Public Property Get Container() As Object
Attribute Container.VB_Description = "Returns the container of an object."
Set Container = Extender.Container
End Property

Public Property Get Left() As Single
Attribute Left.VB_Description = "Returns/sets the distance between the internal left edge of an object and the left edge of its container."
Left = Extender.Left
End Property

Public Property Let Left(ByVal Value As Single)
Extender.Left = Value
End Property

Public Property Get Top() As Single
Attribute Top.VB_Description = "Returns/sets the distance between the internal top edge of an object and the top edge of its container."
Top = Extender.Top
End Property

Public Property Let Top(ByVal Value As Single)
Extender.Top = Value
End Property

Public Property Get Width() As Single
Attribute Width.VB_Description = "Returns/sets the width of an object."
Width = Extender.Width
End Property

Public Property Let Width(ByVal Value As Single)
Extender.Width = Value
End Property

Public Property Get Height() As Single
Attribute Height.VB_Description = "Returns/sets the height of an object."
Height = Extender.Height
End Property

Public Property Let Height(ByVal Value As Single)
Extender.Height = Value
End Property

Public Property Get Visible() As Boolean
Attribute Visible.VB_Description = "Returns/sets a value that determines whether an object is visible or hidden."
Visible = Extender.Visible
End Property

Public Property Let Visible(ByVal Value As Boolean)
Extender.Visible = Value
End Property

Public Property Get Font() As StdFont
Attribute Font.VB_Description = "Returns a Font object."
Attribute Font.VB_UserMemId = -512
Set Font = PropFont
End Property

Public Property Let Font(ByVal NewFont As StdFont)
Set Me.Font = NewFont
End Property

Public Property Set Font(ByVal NewFont As StdFont)
Set PropFont = NewFont
Set UserControl.Font = PropFont
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "Font"
End Property

Private Sub PropFont_FontChanged(ByVal PropertyName As String)
Set UserControl.Font = PropFont
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "Font"
End Sub

Public Property Get BackColor() As OLE_COLOR
Attribute BackColor.VB_Description = "Returns/sets the background color used to display text and graphics in an object."
Attribute BackColor.VB_UserMemId = -501
BackColor = UserControl.BackColor
End Property

Public Property Let BackColor(ByVal Value As OLE_COLOR)
UserControl.BackColor = Value
Me.Refresh
UserControl.PropertyChanged "BackColor"
End Property

Public Property Get ForeColor() As OLE_COLOR
Attribute ForeColor.VB_Description = "Returns/sets the foreground color used to display text and graphics in an object."
Attribute ForeColor.VB_UserMemId = -513
ForeColor = UserControl.ForeColor
End Property

Public Property Let ForeColor(ByVal Value As OLE_COLOR)
UserControl.ForeColor = Value
Me.Refresh
UserControl.PropertyChanged "ForeColor"
End Property

Public Property Get Enabled() As Boolean
Attribute Enabled.VB_Description = "Returns/sets a value that determines whether an object can respond to user-generated events."
Attribute Enabled.VB_UserMemId = -514
Enabled = UserControl.Enabled
End Property

Public Property Let Enabled(ByVal Value As Boolean)
UserControl.Enabled = Value
UserControl.PropertyChanged "Enabled"
End Property

Public Property Get OLEDropMode() As OLEDropModeConstants
Attribute OLEDropMode.VB_Description = "Returns/Sets whether this object can act as an OLE drop target."
OLEDropMode = UserControl.OLEDropMode
End Property

Public Property Let OLEDropMode(ByVal Value As OLEDropModeConstants)
Select Case Value
    Case OLEDropModeNone, OLEDropModeManual
        UserControl.OLEDropMode = Value
    Case Else
        Err.Raise 380
End Select
UserControl.PropertyChanged "OLEDropMode"
End Property

Public Property Get MousePointer() As Integer
Attribute MousePointer.VB_Description = "Returns/sets the type of mouse pointer displayed when over part of an object."
MousePointer = PropMousePointer
End Property

Public Property Let MousePointer(ByVal Value As Integer)
Select Case Value
    Case 0 To 16, 99
        PropMousePointer = Value
    Case Else
        Err.Raise 380
End Select
If Ambient.UserMode = True Then
    Select Case PropMousePointer
        Case vbIconPointer, 16, vbCustom
            If PropMousePointer = vbCustom Then
                Set UserControl.MouseIcon = PropMouseIcon
            Else
                Set UserControl.MouseIcon = PictureFromHandle(LoadCursor(0, MousePointerID(PropMousePointer)), vbPicTypeIcon)
            End If
            UserControl.MousePointer = vbCustom
        Case Else
            UserControl.MousePointer = PropMousePointer
    End Select
End If
UserControl.PropertyChanged "MousePointer"
End Property

Public Property Get MouseIcon() As IPictureDisp
Attribute MouseIcon.VB_Description = "Returns/sets a custom mouse icon."
Set MouseIcon = PropMouseIcon
End Property

Public Property Let MouseIcon(ByVal Value As IPictureDisp)
Set Me.MouseIcon = Value
End Property

Public Property Set MouseIcon(ByVal Value As IPictureDisp)
If Value Is Nothing Then
    Set PropMouseIcon = Nothing
Else
    If Value.Type = vbPicTypeIcon Or Value.Handle = 0 Then
        Set PropMouseIcon = Value
    Else
        If Ambient.UserMode = False Then
            MsgBox "Invalid property value", vbCritical + vbOKOnly
            Exit Property
        Else
            Err.Raise 380
        End If
    End If
End If
Me.MousePointer = PropMousePointer
UserControl.PropertyChanged "MouseIcon"
End Property

Public Property Get Alignment() As VBRUN.AlignmentConstants
Attribute Alignment.VB_Description = "Returns/sets the alignment."
Alignment = PropAlignment
End Property

Public Property Let Alignment(ByVal Value As VBRUN.AlignmentConstants)
Select Case Value
    Case vbLeftJustify, vbCenter, vbRightJustify
        PropAlignment = Value
    Case Else
        Err.Raise 380
End Select
Me.Refresh
UserControl.PropertyChanged "TextAlignment"
End Property

Public Property Get Appearance() As CCAppearanceConstants
Attribute Appearance.VB_Description = "Returns/sets a value that determines whether an object is painted two-dimensional or with 3-D effects."
Attribute Appearance.VB_UserMemId = -520
Appearance = PropAppearance
End Property

Public Property Let Appearance(ByVal Value As CCAppearanceConstants)
Select Case Value
    Case CCAppearanceFlat, CCAppearance3D
        PropAppearance = Value
    Case Else
        Err.Raise 380
End Select
UserControl.Appearance = PropAppearance
UserControl.ForeColor = IIf(PropAppearance = CCAppearanceFlat, vbWindowText, vbButtonText)
If PropAppearance = CCAppearanceFlat Then
    If Not PropBorderStyle = CCBorderStyleNone Then PropBorderStyle = CCBorderStyleSingle
Else
    If Not PropBorderStyle = CCBorderStyleNone Then PropBorderStyle = CCBorderStyleSunken
End If
Me.Refresh
UserControl.PropertyChanged "Appearance"
End Property

Public Property Get BorderStyle() As CCBorderStyleConstants
Attribute BorderStyle.VB_Description = "Returns/sets the border style."
Attribute BorderStyle.VB_UserMemId = -504
BorderStyle = PropBorderStyle
End Property

Public Property Let BorderStyle(ByVal Value As CCBorderStyleConstants)
Select Case Value
    Case CCBorderStyleNone, CCBorderStyleSingle, CCBorderStyleThin, CCBorderStyleSunken, CCBorderStyleRaised
        PropBorderStyle = Value
    Case Else
        Err.Raise 380
End Select
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "BorderStyle"
End Property

Public Property Get BackStyle() As CCBackStyleConstants
Attribute BackStyle.VB_Description = "Returns/sets the background style."
Attribute BackStyle.VB_UserMemId = -502
BackStyle = UserControl.BackStyle
End Property

Public Property Let BackStyle(ByVal Value As CCBackStyleConstants)
Select Case Value
    Case CCBackStyleTransparent, CCBackStyleOpaque
        UserControl.BackStyle = Value
    Case Else
        Err.Raise 380
End Select
Me.Refresh
UserControl.PropertyChanged "BackStyle"
End Property

Public Property Get Caption() As String
Attribute Caption.VB_Description = "Returns/sets the text displayed in an object's title bar or below an object's icon."
Attribute Caption.VB_UserMemId = -518
Attribute Caption.VB_MemberFlags = "122c"
Caption = PropCaption
End Property

Public Property Let Caption(ByVal Value As String)
If PropCaption = Value Then Exit Property
PropCaption = Value
If PropUseMnemonic = True Then
    UserControl.AccessKeys = ChrW(AccelCharCode(PropCaption))
Else
    UserControl.AccessKeys = vbNullString
End If
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "Caption"
RaiseEvent Change
End Property

Public Property Get Default() As String
Attribute Default.VB_UserMemId = 0
Attribute Default.VB_MemberFlags = "40"
Default = Me.Caption
End Property

Public Property Let Default(ByVal Value As String)
Me.Caption = Value
End Property

Public Property Get UseMnemonic() As Boolean
Attribute UseMnemonic.VB_Description = "Returns/sets a value that specifies whether an & in the caption property defines an access key."
UseMnemonic = PropUseMnemonic
End Property

Public Property Let UseMnemonic(ByVal Value As Boolean)
PropUseMnemonic = Value
If PropUseMnemonic = True Then
    UserControl.AccessKeys = ChrW(AccelCharCode(PropCaption))
Else
    UserControl.AccessKeys = vbNullString
End If
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "UseMnemonic"
End Property

Public Property Get AutoSize() As Boolean
Attribute AutoSize.VB_Description = "Determines whether a control is automatically resized to display its entire contents."
Attribute AutoSize.VB_UserMemId = -500
AutoSize = PropAutoSize
End Property

Public Property Let AutoSize(ByVal Value As Boolean)
PropAutoSize = Value
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "AutoSize"
End Property

Public Property Get WordWrap() As Boolean
Attribute WordWrap.VB_Description = "Returns/sets a value that determines whether a control may break lines within the text in order to prevent overflow."
WordWrap = PropWordWrap
End Property

Public Property Let WordWrap(ByVal Value As Boolean)
PropWordWrap = Value
LabelAutoSizeFlag = PropAutoSize
Me.Refresh
UserControl.PropertyChanged "WordWrap"
End Property

Public Sub Refresh()
Attribute Refresh.VB_Description = "Forces a complete repaint of a object."
Attribute Refresh.VB_UserMemId = -550
UserControl.Refresh
End Sub
