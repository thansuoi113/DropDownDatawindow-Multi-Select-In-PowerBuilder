$PBExportHeader$w_main.srw
forward
global type w_main from window
end type
type st_1 from statictext within w_main
end type
type cb_1 from commandbutton within w_main
end type
type dw_data from datawindow within w_main
end type
end forward

global type w_main from window
integer width = 3086
integer height = 956
boolean titlebar = true
string title = "DropDown Datawindow Multi Select"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_1 st_1
cb_1 cb_1
dw_data dw_data
end type
global w_main w_main

type variables
nvo_dddw_multiselect invo_dddw_multiselect
end variables

on w_main.create
this.st_1=create st_1
this.cb_1=create cb_1
this.dw_data=create dw_data
this.Control[]={this.st_1,&
this.cb_1,&
this.dw_data}
end on

on w_main.destroy
destroy(this.st_1)
destroy(this.cb_1)
destroy(this.dw_data)
end on

event open;dw_data.insertrow(0)
dw_data.insertrow(0)
dw_data.insertrow(0)

 
end event

type st_1 from statictext within w_main
integer x = 512
integer y = 736
integer width = 2290
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Note: Checked ~"Allways Show List~" Properties Of Column Dropdowndw On Datawindow"
boolean focusrectangle = false
end type

type cb_1 from commandbutton within w_main
integer x = 37
integer y = 704
integer width = 402
integer height = 112
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "Get Data"
end type

event clicked;Long ll_row, ll_count, ll_col
String ls_data[], ls_value, ls_cln

ll_col = dw_data.getcolumn()
ls_cln =  dw_data.Describe("#" + String(ll_col)  + ".name")

ll_count = invo_dddw_multiselect.of_getdata(ls_cln  , dw_data.GetRow(), ls_data)

ls_value = ""
For ll_row = 1 To ll_count
	ls_value += ls_data[ll_row] + "~r~n"
Next

MessageBox("Infor",ls_value )

end event

type dw_data from datawindow within w_main
event ue_command pbm_command
integer x = 41
integer y = 36
integer width = 2962
integer height = 640
integer taborder = 20
string title = "none"
string dataobject = "d_main"
boolean hscrollbar = true
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event ue_command;
Choose Case notificationcode
	Case 1281
		This.Post Event ItemChanged( This.GetRow(), This.Object, '')
End Choose




end event

event constructor;invo_dddw_multiselect = Create nvo_dddw_multiselect
invo_dddw_multiselect.of_ini( This, ",", True)
invo_dddw_multiselect.of_setcheckbox( This, "cln1", "chk")
invo_dddw_multiselect.of_setcheckbox( This, "cln2", "chk")
invo_dddw_multiselect.of_setcheckbox( This, "cln3", "chk")


end event

event itemchanged;int li_return
li_return = invo_dddw_multiselect.of_multiselect ( "cln1", "chk")
li_return = invo_dddw_multiselect.of_multiselect ( "cln2", "chk", "/")
li_return = invo_dddw_multiselect.of_multiselect (This,  "cln3", "chk", "-")
return 2
end event

event clicked;invo_dddw_multiselect.of_resetcheckbox( This, row,dwo.Name, "chk")
end event

