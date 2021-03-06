$PBExportHeader$nvo_dddw_multiselect.sru
forward
global type nvo_dddw_multiselect from nonvisualobject
end type
type str_data from structure within nvo_dddw_multiselect
end type
end forward

type str_data from structure
	string		column
	long		row
	string		data[]
	string		display[]
	long		dwcrow[]
end type

global type nvo_dddw_multiselect from nonvisualobject
end type
global nvo_dddw_multiselect nvo_dddw_multiselect

type variables
Private str_data istr_data[]
datawindow idw
String is_separator
Boolean ib_dwcreset

end variables

forward prototypes
public function string of_value (datawindowchild adwc, string as_cln, long al_row)
public function integer of_multiselect (datawindow adw, string as_cln, string as_chkcln)
public function integer of_multiselect (string as_cln, string as_chkcln)
public function integer of_multiselect (string as_cln, string as_chkcln, string as_separator)
public subroutine of_setcheckbox (datawindow adw, string as_cln, string as_chkcln)
public subroutine of_setcheckbox (string as_cln, string as_chkcln)
public function integer of_str_data (string as_cln, long al_row)
public function integer of_multiselect (datawindow adw, string as_cln, string as_chkcln, string as_separator)
public function integer of_getdata (string as_cln, long al_row, ref string as_data[])
public function integer of_getdisplay (string as_cln, long al_row, ref string as_display[])
public function integer of_resetcheckbox (datawindow adw, long al_row, string as_cln, string as_chkcln, boolean ab_dwcreset)
public function integer of_resetcheckbox (long al_row, string as_cln, string as_chkcln, boolean ab_dwcreset)
public function integer of_resetcheckbox (long al_row, string as_cln, string as_chkcln)
public function integer of_resetcheckbox (datawindow adw, long al_row, string as_cln, string as_chkcln)
public subroutine of_ini (datawindow adw, string as_separator, boolean ab_dwcreset)
end prototypes

public function string of_value (datawindowchild adwc, string as_cln, long al_row);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindowchild	adwc  	
// 	string         	as_cln	
// 	long           	al_row	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

String ls_value , ls_col_type

ls_value = ""
ls_col_type = Lower(Left(adwc.Describe(as_cln + ".coltype"), 5))
Choose Case ls_col_type
	Case "numbe", "long", "ulong", "real", "int", "decim"
		ls_value = String(adwc.GetItemNumber(al_row, as_cln))
	Case "char(", "char"
		ls_value = adwc.GetItemString(al_row, as_cln)
	Case "datet", "times"
		ls_value = String(adwc.GetItemDateTime(al_row, as_cln))
	Case "date"
		ls_value = String(adwc.GetItemDate(al_row, as_cln))
	Case "time"
		ls_value = String(adwc.GetItemTime(al_row, as_cln))
End Choose

Return ls_value

end function

public function integer of_multiselect (datawindow adw, string as_cln, string as_chkcln);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindow	adw      	
// 	string    	as_cln   	
// 	string    	as_chkcln	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_Return

If IsNull(is_separator) Or Len(Trim(is_separator)) = 0 Then is_separator = ""
li_Return = of_multiselect(adw, as_cln, as_chkcln, is_separator)
Return li_Return

end function

public function integer of_multiselect (string as_cln, string as_chkcln);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	string	as_cln   	
// 	string	as_chkcln	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_Return
li_Return = of_multiselect(idw, as_cln, as_chkcln)
Return li_Return

end function

public function integer of_multiselect (string as_cln, string as_chkcln, string as_separator);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	string	as_cln      	
// 	string	as_chkcln   	
// 	string	as_separator	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_Return

li_Return = of_multiselect(idw, as_cln, as_chkcln, as_separator)
Return li_Return

end function

public subroutine of_setcheckbox (datawindow adw, string as_cln, string as_chkcln);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindow	adw      	
// 	string    	as_cln   	
// 	string    	as_chkcln	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

datawindowchild ldwc
adw.GetChild(as_cln, ldwc)
ldwc.Modify(  as_chkcln +".tabsequence =10")

end subroutine

public subroutine of_setcheckbox (string as_cln, string as_chkcln);of_setcheckbox(idw, as_cln , as_chkcln)
end subroutine

public function integer of_str_data (string as_cln, long al_row);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	string	as_cln	
// 	long  	al_row	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_r, li_return
long ll_row
String ls_cln

For li_r = 1 To UpperBound(istr_data)
	ls_cln = istr_data[li_r].column
	ll_row = istr_data[li_r].row
	If Lower(Trim(ls_cln)) = Lower(Trim(as_cln)) And ll_row = al_row Then
		li_return = li_r
		Exit
	End If
Next

If li_return < 1 Then
	istr_data[UpperBound(istr_data)+1].column = as_cln
	istr_data[UpperBound(istr_data)+1].row = al_row
	li_return = UpperBound(istr_data)
End If

Return li_return
end function

public function integer of_multiselect (datawindow adw, string as_cln, string as_chkcln, string as_separator);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindow	adw         	
// 	string    	as_cln      	
// 	string    	as_chkcln   	
// 	string    	as_separator	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_return, li_cln, li_str
Long ll_dwcrowcount, ll_dwcrow , ll_adwrow, ll_valuerow
String ls_adwcln, ls_chkcln, ls_value,  ls_display_value, ls_data_value, ls_temp_display
String ls_editstyle, ls_check_on, ls_check_off, ls_display_cln, ls_data_cln
String ls_search_expr
datawindowchild ldwc
str_data lstr_data

//check mail infor
If Not IsValid(adw) Then Return -1
If adw.RowCount() = 0  Then Return 0
ll_adwrow = adw.GetRow()
If ll_adwrow < 1 Then Return 0
li_cln = adw.GetColumn()
ls_adwcln = adw.Describe("#" + String(li_cln)  + ".name")
If IsNull(ls_adwcln) Or Len(Trim(ls_adwcln)) = 0 Then ls_adwcln = ""
If Upper(Trim(ls_adwcln)) <> Upper(Trim(as_cln)) Then Return 0
ls_editstyle = Lower(Trim(adw.Describe(as_cln + ".Edit.Style")))
If ls_editstyle <> "dddw" Then Return 0
ls_display_cln  = adw.Describe( as_cln + ".dddw.DisplayColumn")
ls_data_cln = adw.Describe( as_cln + ".dddw.DataColumn")

//check datachild infor
adw.GetChild(as_cln, ldwc)
If Not IsValid(ldwc) Then Return -1
li_cln = ldwc.GetColumn()
ls_chkcln = ldwc.Describe("#" + String(li_cln)  + ".name")
If Upper(Trim(ls_chkcln)) <> Upper(Trim(as_chkcln)) Then Return 0
ls_editstyle = Lower(Trim(ldwc.Describe(as_chkcln + '.Edit.Style')))
If ls_editstyle <> "checkbox" Then Return 0
ls_check_on = ldwc.Describe (as_chkcln + ".CheckBox.On")
ls_check_off = ldwc.Describe (as_chkcln + ".CheckBox.Off")


//get value
li_str = of_str_data(as_cln, ll_adwrow)
lstr_data.column =  as_cln
lstr_data.row =  ll_adwrow
istr_data[li_str] = lstr_data

ldwc.AcceptText()
ls_value = ""
ll_dwcrow = 0
ll_dwcrowcount = ldwc.RowCount()
ls_search_expr = as_chkcln +  "='" + ls_check_on + "'"
Do While True
	ll_dwcrow = ldwc.Find(ls_search_expr, ll_dwcrow + 1, ll_dwcrowcount)
	If ll_dwcrow = 0 Then Exit
	ll_valuerow ++
	If Len(ls_value) > 0 Then
		ls_value += as_separator
	End If
	
	ls_display_value = of_value(ldwc, ls_display_cln , ll_dwcrow)
	ls_data_value = of_value(ldwc, ls_data_cln , ll_dwcrow)
	
	lstr_data.display[UpperBound(lstr_data.display) + 1] = ls_display_value
	lstr_data.Data[UpperBound(lstr_data.Data) + 1] = ls_data_value
	lstr_data.dwcrow[UpperBound(lstr_data.dwcrow) + 1] = ll_dwcrow
	
	ls_temp_display = ls_display_value
	If Len(ls_display_value ) > 6 Then
		ls_display_value = Left(ls_display_value, 6) + '..'
	End If
	ls_value = ls_value + ls_display_value
	
	If ll_dwcrow >= ll_dwcrowcount Then Exit
Loop

If ll_valuerow = 1 Then
	ls_value = ls_temp_display
End If

istr_data[li_str] = lstr_data
adw.SetItem(ll_adwrow,as_cln, ls_value)
Return li_return

end function

public function integer of_getdata (string as_cln, long al_row, ref string as_data[]);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	      	string	as_cln	
// 	      	long  	al_row	
// 	ref   	string	as_data[]	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_return, li_str

li_str = of_str_data(as_cln, al_row )
as_data = istr_data[li_str].Data
li_return = UpperBound(as_data)

Return li_return

end function

public function integer of_getdisplay (string as_cln, long al_row, ref string as_display[]);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	      	string	as_cln	
// 	      	long  	al_row	
// 	ref   	string	as_display[]	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_return, li_str

li_str = of_str_data(as_cln, al_row )
as_display = istr_data[li_str].display
li_return = UpperBound(as_display)

Return li_return
end function

public function integer of_resetcheckbox (datawindow adw, long al_row, string as_cln, string as_chkcln, boolean ab_dwcreset);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindow	adw        	
// 	long      	al_row     	
// 	string    	as_cln     	
// 	string    	as_chkcln  	
// 	boolean   	ab_dwcreset	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

If Not ab_dwcreset Then Return 1

Int li_return, li_cln, li_str
Long ll_dwcrowcount, ll_dwcrow , ll_adwrow, ll_dwcrow1
String ls_adwcln, ls_chkcln, ls_display_value, ls_data_value
String ls_editstyle, ls_check_on, ls_check_off, ls_display_cln, ls_data_cln
String ls_search_expr
datawindowchild ldwc
str_data lstr_data

//check mail infor
If Not IsValid(adw) Then Return -1
If adw.RowCount() = 0  Then Return 0
ll_adwrow = adw.GetRow()
If ll_adwrow < 1 Then Return 0
li_cln = adw.GetClickedColumn()
ls_adwcln = adw.Describe("#" + String(li_cln)  + ".name")
If IsNull(ls_adwcln) Or Len(Trim(ls_adwcln)) = 0 Then ls_adwcln = ""
If Upper(Trim(ls_adwcln)) <> Upper(Trim(as_cln)) Then Return 0
ls_editstyle = Lower(Trim(adw.Describe(as_cln + ".Edit.Style")))
If ls_editstyle <> "dddw" Then Return 0
ls_display_cln  = adw.Describe( as_cln + ".dddw.DisplayColumn")
ls_data_cln = adw.Describe( as_cln + ".dddw.DataColumn")

//check datachild infor
adw.GetChild(as_cln, ldwc)
If Not IsValid(ldwc) Then Return -1
ls_editstyle = Lower(Trim(ldwc.Describe(as_chkcln + '.Edit.Style')))
If ls_editstyle <> "checkbox" Then Return 0
ls_check_on = ldwc.Describe (as_chkcln + ".CheckBox.On")
ls_check_off = ldwc.Describe (as_chkcln + ".CheckBox.Off")

//reset dddw
ll_dwcrow = 0
ll_dwcrowcount = ldwc.RowCount()
ls_search_expr = as_chkcln +  "='" + ls_check_on + "'"
Do While True
	ll_dwcrow = ldwc.Find(ls_search_expr, ll_dwcrow + 1, ll_dwcrowcount)
	If ll_dwcrow = 0 Then Exit
	ldwc.SetItem(ll_dwcrow,as_chkcln, ls_check_off)
	If ll_dwcrow >= ll_dwcrowcount Then Exit
Loop

//get value
li_str = of_str_data(as_cln, al_row)
lstr_data = istr_data[li_str]
For ll_dwcrow = 1 To UpperBound(lstr_data.dwcrow)
	ls_data_value = lstr_data.Data[ll_dwcrow]
	ll_dwcrow1 = lstr_data.dwcrow[ll_dwcrow]
	If ll_dwcrow1 > ll_dwcrowcount Then Continue
	If ls_data_value <>  of_value( ldwc, ls_data_cln , ll_dwcrow1) Then Continue
	ldwc.SetItem(ll_dwcrow1, as_chkcln, ls_check_on)
Next

Return 1

end function

public function integer of_resetcheckbox (long al_row, string as_cln, string as_chkcln, boolean ab_dwcreset);Int li_return
li_return = of_resetcheckbox(idw,al_row,  as_cln, as_chkcln, ab_dwcreset)
Return li_return

end function

public function integer of_resetcheckbox (long al_row, string as_cln, string as_chkcln);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	long  	al_row   	
// 	string	as_cln   	
// 	string	as_chkcln	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_return
li_return = of_resetcheckbox(al_row,  as_cln, as_chkcln, ib_dwcreset)
Return li_return

end function

public function integer of_resetcheckbox (datawindow adw, long al_row, string as_cln, string as_chkcln);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindow	adw      	
// 	long      	al_row   	
// 	string    	as_cln   	
// 	string    	as_chkcln	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

Int li_return
li_return = of_resetcheckbox(idw,al_row,  as_cln, as_chkcln, ib_dwcreset)
Return li_return

end function

public subroutine of_ini (datawindow adw, string as_separator, boolean ab_dwcreset);//====================================================================
// Function: nvo_dddw_multiselect.()
//--------------------------------------------------------------------
// Description:
//--------------------------------------------------------------------
// Arguments:
// 	datawindow	adw         	
// 	string    	as_separator	
// 	boolean   	ab_dwcreset 	
//--------------------------------------------------------------------
// Returns:  (none)
//--------------------------------------------------------------------
// Author:	PB.BaoGa		Date: 2021/03/22
//--------------------------------------------------------------------
// Usage: nvo_dddw_multiselect.
//--------------------------------------------------------------------
//	Copyright (c) PB.BaoGa(TM), All rights reserved.
//--------------------------------------------------------------------
// Modify History:
//
//====================================================================

idw = adw
ib_dwcreset = ab_dwcreset
If IsNull(as_separator) Or Len(Trim(as_separator)) = 0 Then as_separator = ","
is_separator = as_separator

end subroutine

on nvo_dddw_multiselect.create
call super::create
TriggerEvent( this, "constructor" )
end on

on nvo_dddw_multiselect.destroy
TriggerEvent( this, "destructor" )
call super::destroy
end on

