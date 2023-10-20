/*****************************************************************************

		Copyright (c) My Company

 Project:  ИС 2
 FileName: ИС 2.PRO
 Purpose: No description
 Written by: Visual Prolog
 Comments:
******************************************************************************/

include "ис 2.inc"
include "ис 2.con"
include "hlptopic.con"

%BEGIN_WIN Task Window
/***************************************************************************
		Event handling for Task Window
***************************************************************************/

predicates

  task_win_eh : EHANDLER

constants

%BEGIN Task Window, CreateParms, 20:59:19-15.3.2023, Code automatically updated!
  task_win_Flags = [wsf_SizeBorder,wsf_TitleBar,wsf_Close,wsf_Maximize,wsf_Minimize,wsf_ClipSiblings]
  task_win_Menu  = res_menu(idr_task_menu)
  task_win_Title = "ИС 2"
  task_win_Help  = idh_contents
%END Task Window, CreateParms

clauses

%BEGIN Task Window, e_Create
  task_win_eh(_Win,e_Create(_),0):-!,
%BEGIN Task Window, InitControls, 20:59:19-15.3.2023, Code automatically updated!
%END Task Window, InitControls
%BEGIN Task Window, ToolbarCreate, 20:59:19-15.3.2023, Code automatically updated!
	tb_project_toolbar_Create(_Win),
	tb_help_line_Create(_Win),
%END Task Window, ToolbarCreate
ifdef use_message
	msg_Create(100),
enddef
	!.
%END Task Window, e_Create

%MARK Task Window, new events

%BEGIN Task Window, id_nullvalue
  task_win_eh(_Win,e_Menu(id_nullvalue,_ShiftCtlAlt),0):-!,
	win_nullvalue_Create(_Win),!.
%END Task Window, id_nullvalue

%BEGIN Task Window, id_help_contents
  task_win_eh(_Win,e_Menu(id_help_contents,_ShiftCtlAlt),0):-!,
  	vpi_ShowHelp("ис 2.hlp"),
	win_nullvalue_Create(_Win),!.
%END Task Window, id_help_contents

%BEGIN Task Window, id_help_about
  task_win_eh(Win,e_Menu(id_help_about,_ShiftCtlAlt),0):-!,
	dlg_about_dialog_Create(Win),
	!.
%END Task Window, id_help_about

%BEGIN Task Window, id_file_exit
  task_win_eh(Win,e_Menu(id_file_exit,_ShiftCtlAlt),0):-!,
  	win_Destroy(Win),
	!.
%END Task Window, id_file_exit

%BEGIN Task Window, e_Size
  task_win_eh(_Win,e_Size(_Width,_Height),0):-!,
ifdef use_tbar
	toolbar_Resize(_Win),
enddef
ifdef use_message
	msg_Resize(_Win),
enddef
	!.
%END Task Window, e_Size

%END_WIN Task Window

/***************************************************************************
		Invoking on-line Help
***************************************************************************/

  project_ShowHelpContext(HelpTopic):-
  	vpi_ShowHelpContext("ис 2.hlp",HelpTopic).

/***************************************************************************
			Main Goal
***************************************************************************/

goal

ifdef use_mdi
  vpi_SetAttrVal(attr_win_mdi,b_true),
enddef
ifdef ws_win
  ifdef use_3dctrl
    vpi_SetAttrVal(attr_win_3dcontrols,b_true),
  enddef
enddef  
  vpi_Init(task_win_Flags,task_win_eh,task_win_Menu,"ис 2",task_win_Title).

%BEGIN_TLB Project toolbar, 20:59:19-15.3.2023, Code automatically updated!
/**************************************************************************
	Creation of toolbar: Project toolbar
**************************************************************************/

clauses

  tb_project_toolbar_Create(_Parent):-
ifdef use_tbar
	toolbar_create(tb_top,0xC0C0C0,_Parent,
		[tb_ctrl(id_file_new,pushb,idb_new_up,idb_new_dn,idb_new_up,"New;New file",1,1),
		 tb_ctrl(id_file_open,pushb,idb_open_up,idb_open_dn,idb_open_up,"Open;Open file",1,1),
		 tb_ctrl(id_file_save,pushb,idb_save_up,idb_save_dn,idb_save_up,"Save;File save",1,1),
		 separator,
		 tb_ctrl(id_edit_undo,pushb,idb_undo_up,idb_undo_dn,idb_undo_up,"Undo;Undo",1,1),
		 tb_ctrl(id_edit_redo,pushb,idb_redo_up,idb_redo_dn,idb_redo_up,"Redo;Redo",1,1),
		 separator,
		 tb_ctrl(id_edit_cut,pushb,idb_cut_up,idb_cut_dn,idb_cut_up,"Cut;Cut to clipboard",1,1),
		 tb_ctrl(id_edit_copy,pushb,idb_copy_up,idb_copy_dn,idb_copy_up,"Copy;Copy to clipboard",1,1),
		 tb_ctrl(id_edit_paste,pushb,idb_paste_up,idb_paste_dn,idb_paste_up,"Paste;Paste from clipboard",1,1),
		 separator,
		 separator,
		 tb_ctrl(id_help_contents,pushb,idb_help_up,idb_help_down,idb_help_up,"Help;Help",1,1)]),
enddef
	true.
%END_TLB Project toolbar

%BEGIN_TLB Help line, 20:59:19-15.3.2023, Code automatically updated!
/**************************************************************************
	Creation of toolbar: Help line
**************************************************************************/

clauses

  tb_help_line_Create(_Parent):-
ifdef use_tbar
	toolbar_create(tb_bottom,0xC0C0C0,_Parent,
		[tb_text(idt_help_line,tb_context,452,0,4,10,0x0,"")]),
enddef
	true.
%END_TLB Help line

%BEGIN_DLG About dialog
/**************************************************************************
	Creation and event handling for dialog: About dialog
**************************************************************************/

constants

%BEGIN About dialog, CreateParms, 20:59:19-15.3.2023, Code automatically updated!
  dlg_about_dialog_ResID = idd_dlg_about
  dlg_about_dialog_DlgType = wd_Modal
  dlg_about_dialog_Help = idh_contents
%END About dialog, CreateParms

predicates

  dlg_about_dialog_eh : EHANDLER

clauses

  dlg_about_dialog_Create(Parent):-
	win_CreateResDialog(Parent,dlg_about_dialog_DlgType,dlg_about_dialog_ResID,dlg_about_dialog_eh,0).

%BEGIN About dialog, idc_ok _CtlInfo
  dlg_about_dialog_eh(_Win,e_Control(idc_ok,_CtrlType,_CtrlWin,_CtrlInfo),0):-!,
	win_Destroy(_Win),
	!.
%END About dialog, idc_ok _CtlInfo
%MARK About dialog, new events

  dlg_about_dialog_eh(_,_,_):-!,fail.

%END_DLG About dialog

%BEGIN_WIN nullValue
/**************************************************************************
        Creation and event handling for window: nullValue
**************************************************************************/

constants
%BEGIN nullValue, CreateParms, 21:03:51-15.3.2023, Code automatically updated!
  win_nullvalue_WinType = w_TopLevel
  win_nullvalue_Flags = [wsf_SizeBorder,wsf_TitleBar,wsf_Maximize,wsf_Minimize,wsf_Close,wsf_ClipSiblings,wsf_ClipChildren]
  win_nullvalue_RCT = rct(100,80,440,240)
  win_nullvalue_Menu = no_menu
  win_nullvalue_Title = "nullValue"
  win_nullvalue_Help = idh_contents
%END nullValue, CreateParms

predicates

  win_nullvalue_eh : EHANDLER
  nullCounterA(integer, integer).
  nullCounterB(integer, integer).
  nullCounterC(integer, integer).
  nullCounterD(integer, integer).
  summator(integer, integer, integer, integer, integer).

clauses

  nullCounterA (A,SUM1):-A=0, SUM1=A+1.
  nullCounterA (A,SUM1):-A<>0, SUM1=0.
  nullCounterB (B,SUM2):-B=0, SUM2=B+1.
  nullCounterB (B,SUM2):-B<>0, SUM2=0.
  nullCounterC (C,SUM3):-C=0, SUM3=C+1.
  nullCounterC (C,SUM3):-C<>0, SUM3=0.
  nullCounterD (D,SUM4):-D=0, SUM4=D+1.
  nullCounterD (D,SUM4):-D<>0, SUM4=0.
  summator (SUM1,SUM2,SUM3,SUM4,SUM):-SUM=SUM1+SUM2+SUM3+SUM4.

  win_nullvalue_Create(_Parent):-
	win_Create(win_nullvalue_WinType,win_nullvalue_RCT,win_nullvalue_Title,
		   win_nullvalue_Menu,_Parent,win_nullvalue_Flags,win_nullvalue_eh,0).

%BEGIN nullValue, e_Create
  win_nullvalue_eh(_Win,e_Create(_),0):-!,
%BEGIN nullValue, InitControls, 21:03:51-15.3.2023, Code automatically updated!
	win_CreateControl(wc_PushButton,rct(30,130,126,154),"Result",_Win,[wsf_Group,wsf_TabStop],idc_result),
	win_CreateControl(wc_Text,rct(30,90,126,110),"Input D",_Win,[wsf_AlignLeft],idct_input_d),
	win_CreateControl(wc_Text,rct(30,70,126,90),"Input C",_Win,[wsf_AlignLeft],idct_input_c),
	win_CreateControl(wc_Text,rct(30,50,126,70),"Input B",_Win,[wsf_AlignLeft],idct_input_b),
	win_CreateControl(wc_Text,rct(30,30,126,50),"Input A",_Win,[wsf_AlignLeft],idct_input_a),
	win_CreateControl(wc_Edit,rct(150,30,246,50),"",_Win,[wsf_Group,wsf_TabStop,wsf_AutoHScroll,wsf_AlignLeft],idc_nullvalue_1),
	win_CreateControl(wc_Edit,rct(150,50,246,70),"",_Win,[wsf_Group,wsf_TabStop,wsf_AutoHScroll,wsf_AlignLeft],idc_nullvalue_2),
	win_CreateControl(wc_Edit,rct(150,70,246,90),"",_Win,[wsf_Group,wsf_TabStop,wsf_AutoHScroll,wsf_AlignLeft],idc_nullvalue_3),
	win_CreateControl(wc_Edit,rct(150,90,246,110),"",_Win,[wsf_Group,wsf_TabStop,wsf_AutoHScroll,wsf_AlignLeft],idc_nullvalue_4),
	win_CreateControl(wc_Text,rct(150,130,246,150),"",_Win,[wsf_AlignLeft],idct_output),
%END nullValue, InitControls
%BEGIN nullValue, ToolbarCreate, 21:03:51-15.3.2023, Code automatically updated!
%END nullValue, ToolbarCreate
	!.
%END nullValue, e_Create
%MARK nullValue, new events

%BEGIN nullValue, idc_result _CtlInfo
win_nullvalue_eh(_Win,e_Control(idc_result,_CtrlType,_CtrlWin,_CtlInfo),0):-!,

EDIT_WIN1=win_GetCtlHandle(_Win,idc_nullvalue_1),
Text1=win_GetText (EDIT_WIN1),
str_int (Text1,A),

EDIT_WIN2=win_GetCtlHandle(_Win,idc_nullvalue_2),
Text2=win_GetText (EDIT_WIN2),
str_int (Text2,B),

EDIT_WIN3=win_GetCtlHandle(_Win,idc_nullvalue_3),
Text3=win_GetText (EDIT_WIN3),
str_int (Text3,C),

EDIT_WIN4=win_GetCtlHandle(_Win,idc_nullvalue_4),
Text4=win_GetText (EDIT_WIN4),
str_int (Text4,D),

nullCounterA (A,SUM1),
nullCounterB (B,SUM2),
nullCounterC (C,SUM3),
nullCounterD (D,SUM4),

summator(SUM1,SUM2,SUM3,SUM4,SUM),

str_int (StrSUM, SUM),
EDWIN=win_GetCtlHandle(_Win,idct_output),
win_SetText (EDWIN, StrSUM),
!.
%END nullValue, idc_result _CtlInfo

%BEGIN nullValue, e_Size
  win_nullvalue_eh(_Win,e_Size(_Width,_Height),0):-!,
ifdef use_tbar
	toolbar_Resize(_Win),
enddef
	!.
%END nullValue, e_Size

%BEGIN nullValue, e_Menu, Parent window 
  win_nullvalue_eh(Win,e_Menu(ID,CAS),0):-!,
	PARENT = win_GetParent(Win),
	win_SendEvent(PARENT,e_Menu(ID,CAS)),
	!.
%END nullValue, e_Menu, Parent window

%END_WIN nullValue

