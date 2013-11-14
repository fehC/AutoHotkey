/*
	============================= List View Messages =================================
	http://msdn.microsoft.com/en-us/library/windows/desktop/ff485961%28v=vs.85%29.aspx
	==================================================================================
*/

/*
	LVA_ALIGNLEFT :=	0x1
	LVA_ALIGNTOP :=	0x2
	LVA_DEFAULT :=	0x0
	LVA_SNAPTOGRID :=	0x5
	LVBKIF_SOURCE_HBITMAP :=	0x1
	LVBKIF_SOURCE_MASK :=	0x3
	LVBKIF_SOURCE_NONE :=	0x0
	LVBKIF_SOURCE_URL :=	0x2
	LVBKIF_STYLE_MASK :=	0x10
	LVBKIF_STYLE_NORMAL :=	0x0
	LVBKIF_STYLE_TILE :=	0x10
	LVCFMT_BITMAP_ON_RIGHT :=	0x1000
	LVCFMT_CENTER :=	0x2
	LVCFMT_COL_HAS_IMAGES :=	0x8000
	LVCFMT_IMAGE :=	0x800
	LVCFMT_JUSTIFYMASK :=	0x3
	LVCFMT_LEFT :=	0x0
	LVCFMT_RIGHT :=	0x1
	LVCF_FMT :=	0x1
	LVCF_IMAGE :=	0x10
	LVCF_ORDER :=	0x20
	LVCF_SUBITEM :=	0x8
	LVCF_TEXT :=	0x4
	LVCF_WIDTH :=	0x2
	LVFI_NEARESTXY :=	0x40
	LVFI_PARAM :=	0x1
	LVFI_PARTIAL :=	0x8
	LVFI_STRING :=	0x2
	LVFI_WRAP :=	0x20
	LVHT_ABOVE :=	0x8
	LVHT_BELOW :=	0x10
	LVHT_NOWHERE :=	0x1
	LVHT_ONITEMICON :=	0x2
	LVHT_ONITEMLABEL :=	0x4
	LVHT_ONITEMSTATEICON :=	0x8
	LVHT_TOLEFT :=	0x40
	LVHT_TORIGHT :=	0x20
	LVIF_DI_SETITEM :=	0x1000
	LVIF_IMAGE :=	0x2
	LVIF_INDENT :=	0x10
	LVIF_NORECOMPUTE :=	0x800
	LVIF_PARAM :=	0x4
	LVIF_STATE :=	0x8
	LVIF_TEXT :=	0x1
	LVIR_BOUNDS := 0x0
	LVIR_ICON :=	0x1
	LVIR_LABEL :=	0x2
	LVIR_SELECTBOUNDS :=	0x3
	LVIS_CUT :=	0x4
	LVIS_DROPHILITED :=	0x8
	LVIS_FOCUSED :=	0x1
	LVIS_OVERLAYMASK :=	0xF00
	LVIS_SELECTED :=	0x2
	LVIS_STATEIMAGEMASK :=	0xF000
	LVSCW_AUTOSIZE :=	-1
	LVSCW_AUTOSIZE_USEHEADER :=	-2
	LVSIL_NORMAL :=	0x0
	LVSIL_SMALL :=	0x1
	LVSIL_STATE :=	0x2
	LVS_ALIGNLEFT :=	0x800
	LVS_ALIGNMASK :=	0xC00
	LVS_ALIGNTOP :=	0x0
	LVS_AUTOARRANGE :=	0x100
	LVS_EDITLABELS :=	0x200
	LVS_EX_CHECKBOXES :=	0x4
	LVS_EX_FLATSB :=	0x100
	LVS_EX_FULLROWSELECT :=	0x20
	LVS_EX_GRIDLINES :=	0x1
	LVS_EX_HEADERDRAGDROP :=	0x10
	LVS_EX_INFOTIP :=	0x400
	LVS_EX_ONECLICKACTIVATE :=	0x40
	LVS_EX_REGIONAL :=	0x200
	LVS_EX_SUBITEMIMAGES :=	0x2
	LVS_EX_TRACKSELECT :=	0x8
	LVS_EX_TWOCLICKACTIVATE :=	0x80
	LVS_ICON :=	0x0
	LVS_LIST :=	0x3
	LVS_NOCOLUMNHEADER :=	0x4000
	LVS_NOLABELWRAP :=	0x80
	LVS_NOSCROLL :=	0x2000
	LVS_NOSORTHEADER :=	0x8000
	LVS_OWNERDATA :=	0x1000
	LVS_OWNERDRAWFIXED :=	0x400
	LVS_REPORT :=	0x1
	LVS_SHAREIMAGELISTS :=	0x40
	LVS_SHOWSELALWAYS :=	0x8
	LVS_SINGLESEL :=	0x4
	LVS_SMALLICON :=	0x2
	LVS_SORTASCENDING :=	0x10
	LVS_SORTDESCENDING :=	0x20
	LVS_TYPEMASK :=	0x3
	LVS_TYPESTYLEMASK :=	0xFC00
*/

/*
	ListView function library by Solar. Version 1.01

	Flag reference:
		flag  					constant  	description
		-
		LVIS_FOCUSED        	1       	The item has the focus, so it is surrounded by a standard focus rectangle. Although more than one item may be selected, only one item can have the focus.
		LVIS_SELECTED       	2       	The item is selected. The appearance of a selected item depends on whether it has the focus and also on the system colors used for selection.
		LVIS_CUT            	4       	The item is marked for a cut-and-paste operation.
		LVIS_DROPHILITED    	8       	The item is highlighted as a drag-and-drop target.
		LVIS_ACTIVATING     	0x20    	Not currently supported.
		LVIS_UNCHECKED      	0x1000  	Undocumented.
		LVIS_CHECKED        	0x2000  	Undocumented.
		LVIS_OVERLAYMASK    	0xF00   	Use this mask to retrieve the item's overlay image index.
		LVIS_STATEIMAGEMASK 	0xF000  	Use this mask to retrieve the item's state image index.
		-
		LVNI_ALL            	0      		Searches for a subsequent item by index, the default value.
		LVNI_FOCUSED        	1      		The item has the LVIS_FOCUSED state flag set.
		LVNI_SELECTED       	2      		The item has the LVIS_SELECTED state flag set.
		LVNI_CUT            	4      		The item has the LVIS_CUT state flag set.
		LVNI_DROPHILITED    	8      		The item has the LVIS_DROPHILITED state flag set
		LVNI_STATEMASK      	0xf    		Microsoft Windows Vista and later: A state flag mask with value as follows: LVNI_FOCUSED | LVNI_SELECTED | LVNI_CUT | LVNI_DROPHILITED.
		LVNI_VISIBLEORDER   	0x10   		Searches for a subsequent item by index, the default value.
		LVNI_PREVIOUS       	0x20   		Microsoft Windows Vista and later: Searches for an item that is ordered before the item specified in plvii. The LVNI_PREVIOUS flag is not directional (LVNI_ABOVE will find the item positioned above, while LVNI_PREVIOUS will find the item ordered before.) The LVNI_PREVIOUS flag basically reverses the logic of the search performed by the LVM_GETNEXTITEM or LVM_GETNEXTITEMINDEX messages.
		LVNI_VISIBLEONLY    	0x40   		Microsoft Windows Vista and later: Search the visible items.
		LVNI_SAMEGROUPONLY  	0x80   		Microsoft Windows Vista and later: Search the current group.
		LVNI_ABOVE          	0x100  		Searches for an item that is above the specified item.
		LVNI_BELOW          	0x200  		Searches for an item that is below the specified item.
		LVNI_TOLEFT         	0x400  		Searches for an item to the left of the specified item.
		LVNI_TORIGHT        	0x800  		Searches for an item to the right of the specified item.
		LVNI_DIRECTIONMASK  	0xf00  		Microsoft Windows Vista and later: A directional flag mask with value as follows: LVNI_ABOVE | LVNI_BELOW | LVNI_TOLEFT | LVNI_TORIGHT.
*/

LVM_APPROXIMATEVIEWRECT(h,ByRef i,ByRef l){
	/*
		lParam = LOWORD is the proposed x-dimension of the control, in pixels		HIWORD y-dimension
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1040","UInt",i,"UInt",l)
	}

LVM_ARRANGE(h,ByRef f){
	/*
		flag = LVA_ALIGNLEFT or LVA_ALIGNTOP or LVA_DEFAULT or LVA_SNAPTOGRID
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1016","UInt",f,"UInt",0)
	}

LVM_CANCELEDITLABEL(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10b3","UInt",0,"UInt",0)
	}

LVM_CREATEDRAGIMAGE(h,ByRef i,ByRef p){
	/*
		p = "ptr" {POINT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1021","UInt",i,"UInt",p)
	}

LVM_DELETEALLITEMS(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1009","UInt",0,"UInt",0)
	}

LVM_DELETECOLUMN(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x101c","UInt",i,"UInt",0)
	}

LVM_DELETEITEM(hLV, row=0){
	row ? DllCall("SendMessage", "uint", hLV, "uint", 4104, "uint", row-1, "uint", 0) : DllCall("SendMessage", "uint", hLV, "uint", 4105, "uint", 0, "uint", 0) ; LVM_DELETEITEM : LVM_DELETEALLITEMS
	}

LVM_EDITLABEL(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"),"Ptr",h,"UInt","0x1076","UInt",i,"UInt",0)
	}

LVM_ENABLEGROUPVIEW(h,ByRef B="1"){
	/*
		(hwnd_LV,"1"=Enable"0"=Disable)
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x109d","UInt",B,"UInt",0)
	}

LVM_ENSUREVISIBLE(hLV,Row,PartialOK=0){
	Return DllCall("SendMessage", "uint", hLV, "uint", 0x1013, "uint", row-1, "uint", PartialOK)
	}

LVM_FINDITEM(h,ByRef i,ByRef p){
	/*
		p = "ptr" {LVFINDINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1053","UInt",i,"UInt",p)
	}

LVM_GETBKCOLOR(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1000","UInt",0,"UInt",0)
	}

LVM_GETBKIMAGE(h,ByRef p){
	/*
		p = "ptr" {LVBKIMAGE	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x108b","UInt",0,"UInt",p)
	}

LVM_GETCALLBACKMASK(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x100a","UInt",0,"UInt",0)
	}

LVM_GETCOLUMN(h,ByRef i,ByRef p){
	/*
		Gets the attributes of a list-view control's column.
		p = "ptr"	{LVCOLUMN	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x105f","UInt",i,"UInt",p)
	}

LVM_GETCOLUMNORDERARRAY(hLV){
	hdrH := DllCall("SendMessage", "uint", hLV, "uint", 4127) ; LVM_GETHEADER
	hdrC := DllCall("SendMessage", "uint", hdrH, "uint", 4608) ; HDM_GETITEMCOUNT
	VarSetCapacity(o, hdrC * A_PtrSize)
	DllCall("SendMessage", "uint", hLV, "uint", 4155, "uint", hdrC, "ptr", &o)
	Loop, % hdrC
		result .= NumGet(&o, (A_Index - 1) * A_PtrSize) + 1 . ","
	StringTrimRight, result, result, 1
	Return result
	}

LVM_GETCOLUMNWIDTH(hLV, col){
	Return DllCall("SendMessage", "uint", hLV, "uint", 4125, "uint", col-1, "uint", 0)
	}

LVM_GETCOUNTPERPAGE(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1028","UInt",0,"UInt",0)
	}

LVM_GETEDITCONTROL(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1018","UInt",0,"UInt",0)
	}

LVM_GETEMPTYTEXT(h,ByRef w,ByRef p){
	/*
		p = "ptr"	{Unicode buffer	of size specified by wParam to receive the text	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10cc","UInt",w,"UInt",p)
	}

LVM_GETEXTENDEDLISTVIEWSTYLE(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1037","UInt",0,"UInt",0)
	}

LVM_GETFOCUSEDGROUP(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x105d","UInt",0,"UInt",0)
	}

LVM_GETFOOTERINFO(h,ByRef p){
	/*
		p = "ptr" {LVFOOTERINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10ce","UInt",0,"UInt",p)
	}

LVM_GETFOOTERITEM(h,ByRef i,ByRef p){
	/*
		p = "ptr" {LVFOOTERITEM	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10d0","UInt",i,"UInt",p)
	}

LVM_GETFOOTERITEMRECT(h,ByRef i,ByRef p){
	/*
		p = "ptr" {RECT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10cf","UInt",i,"UInt",p)
	}

LVM_GETFOOTERRECT(h,ByRef p){
	/*
		p = "ptr" {RECT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10cd","UInt",0,"UInt",p)
	}

LVM_GETGROUPCOUNT(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1098","UInt",0,"UInt",0)
	}

LVM_GETGROUPINFO(h,ByRef I,ByRef p){
	/*
		p = "ptr" {LVGROUP	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1095","UInt",I,"UInt",p)
	}

LVM_GETGROUPINFOBYINDEX(h,ByRef i,ByRef p){
	/*
		ptr = {LVGROUP	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1099","UInt",i,"UInt",p)
	}

LVM_GETGROUPMETRICS(h,ByRef p){
	/*
		p = "ptr" {LVGROUPMETRICS	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x109c","UInt",0,"UInt",p)
	}

LVM_GETGROUPRECT(h,ByRef I,ByRef p){
	/*
		p = "ptr" {RECT	}	 wParam Specifies the group by iGroupId (see LVGROUP structure)
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1062","UInt",I,"UInt",p)
	}

LVM_GETGROUPSTATE(h,ByRef I,ByRef f){
	/*
		flags = combination of ( LVGS_NORMAL	 LVGS_COLLAPSED	 LVGS_HIDDEN	 LVGS_NOHEADER
		LVGS_COLLAPSIBLE LVGS_FOCUSED LVGS_SELECTED LVGS_SUBSETED LVGS_SUBSETLINKFOCUSED )
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x105c","UInt",I,"UInt",f)
	}

LVM_GETHEADER(hLV){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",hLV,"UInt","0x101f","UInt",0,"UInt",0)
	}

LVM_GETHOTCURSOR(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x103f","UInt",0,"UInt",0)
	}

LVM_GETHOTITEM(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x103d","UInt",0,"UInt",0)
	}

LVM_GETHOVERTIME(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1048","UInt",0,"UInt",0)
	}

LVM_GETIMAGELIST(h,ByRef f){
	/*
		flag =	LVSIL_NORMAL		LVSIL_SMALL		LVSIL_STATE		LVSIL_GROUPHEADER
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1002","UInt",f,"UInt",0)
	}

LVM_GETINSERTMARK(h,ByRef p){
	/*
		p = "ptr" {LVINSERTMARK	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a7","UInt",0,"UInt",p)
	}

LVM_GETINSERTMARKCOLOR(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10ab","UInt",0,"UInt",0)
	}

LVM_GETINSERTMARKRECT(h,ByRef p){
	/*
		p = "ptr" {RECT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a9","UInt",0,"UInt",p)
	}

LVM_GETISEARCHSTRING(h,ByRef p){
	/*
		p = "ptr" {buffer that receives the incremental search string	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1075","UInt",0,"UInt",p)
	}

LVM_GETITEM(h,ByRef p){
	/*
		p = "ptr" {LVITEM	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x104b","UInt",0,"UInt",p)
	}

LVM_GETITEMCOUNT(hLV){
	Return DllCall("SendMessage", "uint", hLV, "uint", 4100, "uint", 0, "uint", 0)
	}

LVM_GETITEMINDEXRECT(h,ByRef w,ByRef l){
	/*
		p = "ptr" {LVITEMINDEX	}
		{RECT = Returns	 LVIR_BOUNDS		LVIR_ICON		LVIR_LABEL	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10d1","UInt",w,"UInt",l)
	}

LVM_GETITEMPOSITION(hLV, Index, ByRef P){
	/*
		Function:	LVM_GETITEMPOSITION

		P:
			"ptr" {POINT}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr", hLV, "UInt", 0x1010, "UInt", Index, "UInt", P)
	}

LVM_GETITEMRECT(h,ByRef i,ByRef p){
	/*
		p = "ptr" {RECT = Returns		LVIR_BOUNDS	 LVIR_ICON	 LVIR_LABEL	 LVIR_SELECTBOUNDS	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x100e","UInt",i,"UInt",p)
	}

LVM_GETITEMSPACING(h,ByRef B){
	/*
		BOOL = TRUE small icon view or FALSE icon view
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1033","UInt",B,"UInt",0)
	}

LVM_GETITEMSTATE(hlv, row){
	/*
		Right now its used to get checked items only, can be used to get more info
	*/
	Return DllCall("SendMessage", "uint", hLV, "uint", 0x102c, "uint", row-1, "uint", 0x2000)	; CCM_FIRST = 8192 (0x2000)
	}

LVM_GETITEMTEXT(hLV, row, col=1){
	row -= 1
	VarSetCapacity(t, 511*2, 1)
	; VarSetCapacity(t, 511, 1)
	; VarSetCapacity(t, 10000, 1)
	VarSetCapacity(lvItem, A_PtrSize * 7)
	NumPut(1    , lvItem, A_PtrSize * 0 "uint") ; mask
	NumPut(row  , lvItem, A_PtrSize * 1, "int") ; iItem
	NumPut(col-1, lvItem, A_PtrSize * 2, "int") ; iSubItem
	NumPut(&t   , lvItem, A_PtrSize * 5, "ptr") ; pszText
	NumPut(512  , lvItem, A_PtrSize * 6)        ; cchTextMax
	DllCall("SendMessage", "uint", hLV, "uint", A_IsUnicode ? 4211 : 4141, "uint", row, "ptr", &lvItem) ;LVM_GETITEMTEXTW : LVM_GETITEMTEXTA
	Return t
	}

LVM_GETNEXTITEM(hLV, row=0, options=0){
	/*
		options = Combination of one or more LVNI flags. See reference above.
	*/
	Return DllCall("SendMessage", "uint", hLV, "uint", 4108, "uint", row-1, "uint", options) + 1
	}

LVM_GETNEXTITEMINDEX(h,ByRef p,ByRef f){
	/*
		ptr = {LVITEMINDEX	}
		flag = LVNI_ALL	LVNI_ABOVE	LVNI_BELOW	LVNI_TOLEFT	LVNI_PREVIOUS	LVNI_TORIGHT
		LVNI_DIRECTIONMASK		LVNI_CUT	LVNI_DROPHILITED	 LVNI_FOCUSED	 LVNI_SELECTED	 LVNI_STATEMASK
		LVNI_VISIBLEORDER	 LVNI_VISIBLEONLY			 LVNI_SAMEGROUPONLY
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10d3","UInt",p,"UInt",f)
	}

LVM_GETNUMBEROFWORKAREAS(h,ByRef p){
	/*
		p = "ptr" {UINT value that receives the number of working areas	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1049","UInt",0,"UInt",p)
	}

LVM_GETORIGIN(h,ByRef p){
	/*
		p = "ptr" {POINT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1029","UInt",0,"UInt",p)
	}

LVM_GETOUTLINECOLOR(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10b0","UInt",0,"UInt",0)
	}

LVM_GETSELECTEDCOLUMN(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10ae","UInt",0,"UInt",0)
	}

LVM_GETSELECTEDCOUNT(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1032","UInt",0,"UInt",0)
	}

LVM_GETSELECTIONMARK(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1042","UInt",0,"UInt",0)
	}

LVM_GETSTRINGWIDTH(h,ByRef p){
	/*
		p = "ptr" {null-terminated string	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1057","UInt",0,"UInt",p)
	}

LVM_GETSUBITEMRECT(h,ByRef i,ByRef p){
	/*
		p = "ptr" {RECT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1038","UInt",i,"UInt",p)
	}

LVM_GETTEXTBKCOLOR(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1025","UInt",0,"UInt",0)
	}

LVM_GETTEXTCOLOR(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1023","UInt",0,"UInt",0)
	}

LVM_GETTILEINFO(h,ByRef p){
	/*
		p = "ptr" {LVTILEINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a5","UInt",0,"UInt",p)
	}

LVM_GETTILEVIEWINFO(h,ByRef p){
	/*
		p = "ptr" {LVTILEVIEWINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a3","UInt",0,"UInt",p)
	}

LVM_GETTOOLTIPS(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x104e","UInt",0,"UInt",0)
	}

LVM_GETTOPINDEX(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1027","UInt",0,"UInt",0)
	}

LVM_GETUNICODEFORMAT(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x2006","UInt",0,"UInt",0)
	}

LVM_GETVIEW(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x108f","UInt",0,"UInt",0)
	}

LVM_GETVIEWRECT(h,ByRef p){
	/*
		p = "ptr" {RECT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1022","UInt",0,"UInt",p)
	}

LVM_GETWORKAREAS(h,ByRef w,ByRef l){
	/*
		wParam = number of RECT structures		 lParam = Pointer to an array of RECT structures
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1046","UInt",w,"UInt",l)
	}

LVM_HASGROUP(h,ByRef I){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a1","UInt",I,"UInt",0)
	}

LVM_HITTEST(h,ByRef w,ByRef p){
	/*
		wParam = 0. Windows Vista.
		Should be -1 if the iGroup and iSubItem members of the lParam structure are to be retrieved	ptr = {LVHITTESTINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1012","UInt",w,"UInt",p)
	}

LVM_INSERTCOLUMN(h,ByRef i,ByRef p){
	/*
		p = "ptr" {LVCOLUMN	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1061","UInt",i,"UInt",p)
	}

LVM_INSERTGROUP(h,ByRef i,ByRef p){
	/*
		p = "ptr" {LVGROUP	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1091","UInt",i,"UInt",p)
	}

LVM_INSERTGROUPSORTED(h,ByRef p){
	/*
		p = "ptr" {LVINSERTGROUPSORTED	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x109f","UInt",p,"UInt",0)
	}

LVM_INSERTITEM(hLV, row=0, col=1, options=0, f*){
	/*
		options = Multiple of one or more of the LVIS flags listed above.
		f* = Fields to fill each column. Each field will be inserted in subsequent order starting with the c param. This param is variadic.

		http://www.autohotkey.net/~Lexikos/AutoHotkey_L/docs/Functions.htm#Variadic
	*/
	col := col ? col-1 : 0
	row := row ? row-1 : DllCall("SendMessage", "uint", hLV, "uint", 4100, "uint", 0, "uint", 0)
	VarSetCapacity(lvItem, A_PtrSize * 6, 0)
	NumPut(9      , lvItem, A_PtrSize * 0 "uint")   ; mask
	NumPut(row    , lvItem, A_PtrSize * 1, "int") 	; iItem
	NumPut(options, lvItem, A_PtrSize * 3, "uint")  ; state
	NumPut(1      , lvItem, A_PtrSize * 4, "uint")  ; stateMask
	Result:= DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "uint", hLV, "uint", A_IsUnicode ? 0x104D : 0x1007, "uint", 0, "uint", &lvItem)
	For index,field in f
		{
		NumPut(col + A_Index - 1, lvItem, A_PtrSize * 2, "int") ; iSubItem
		NumPut(&field, lvItem, A_PtrSize * 5, "ptr") ; pszText
		DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "uint", hLV, "uint", A_IsUnicode ? 0x104C : 0x1006, "uint", 0, "ptr", &lvItem)	;LVM_SETITEM
		}
	Return Result
	}

LVM_INSERTMARKHITTEST(h,ByRef w,ByRef l){
	/*
		w	= "ptr" {POINT	}
		l = "ptr" {LVINSERTMARK	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a8","UInt",w,"UInt",l)
	}

LVM_ISGROUPVIEWENABLED(ByRef h){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10af","UInt",0,"UInt",0)
	}

LVM_ISITEMVISIBLE(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10b6","UInt",i,"UInt",0)
	}

LVM_MAPIDTOINDEX(h,ByRef I){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10b5","UInt",I,"UInt",0)
	}

LVM_MAPINDEXTOID(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10b4","UInt",i,"UInt",0)
	}

LVM_MOVEGROUP(h,ByRef w,ByRef l){
	/*
		message is not implemented ???
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1097","UInt",w,"UInt",l)
	}

LVM_MOVEITEMTOGROUP(h,ByRef w,ByRef l){
	/*
		message is not implemented ???
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x109a","UInt",w,"UInt",l)
	}

LVM_REDRAWITEMS(h,ByRef i,ByRef n){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1015","UInt",i,"UInt",n)
	}

LVM_REMOVEALLGROUPS(ByRef h){
	/*
		(hwnd_LV,"1"=REMOVE)
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a0","UInt",0,"UInt",0)
	}

LVM_REMOVEGROUP(h,ByRef I="1"){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1096","UInt",I,"UInt",0)
	}

LVM_SCROLL(hLV, H, V){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",hLV,"UInt", 0x1014,"UInt",H,"UInt",V)
	}

LVM_SETBKCOLOR(h,ByRef l){
	/*
		lParam = Background_color or CLR_NONE
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1001","UInt",0,"UInt",l)
	}

LVM_SETBKIMAGE(URL, hlv){
   VarSetCapacity(bki, 24, 0)
   NumPut(0x2|0x10, bki, 0)  ; LVBKIF_SOURCE_URL | LVBKIF_STYLE_TILE
   NumPut(&URL, bki, 8)
   SendMessage, A_IsUnicode ? 0x108A : 0x1044, 0, &bki,, ahk_id %hlv%  ; LVM_SETBKIMAGEA : LVM_SETBKIMAGEW
   }

LVM_SETCALLBACKMASK(h,ByRef f){
	/*
		flag = LVIS_CUT LVIS_DROPHILITED LVIS_FOCUSED LVIS_SELECTED LVIS_OVERLAYMASK LVIS_STATEIMAGEMASK
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x100b","UInt",f,"UInt",0)
	}

LVM_SETCOLUMN(phLV,pCol,ByRef pOption){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",phLV,"UInt",(A_IsUnicode ? 0x1060 : 0x101A),"UInt",pCol-1,"UInt",&pOption)
	}

LVM_SETCOLUMNORDERARRAY(hLV, col){
	/*
		wParam = Size, in elements, of the buffer at lParam
		ptr = array that specifies the order in which columns should be displayed, from left to right. For example,
		if the contents of the array are {2,0,1	}, the control displays column 2, column 0, and column 1 in that order
	*/
	StringSplit, col, col, `,
	VarSetCapacity(col, c0 * A_PtrSize)
	Loop, % c0
		NumPut(col%A_Index% - 1, col, (A_Index - 1) * A_PtrSize)
	Return DllCall("SendMessage", "uint", hLV, "uint", 4154, "uint", c0, "ptr", &c)
	}

LVM_SETCOLUMNWIDTH(hLV, col, w=-1){
	/*
		w = New width of the column in pixels. Defaults to -1. The following values are supported in report-view mode:
			"-1" - Automatically sizes the column.
			"-2" - Automatically sizes the column to fit the header text. If you use this value with the last column, its width is set to fill the remaining width of the list-view control.
		flag = LVSCW_AUTOSIZE	or	LVSCW_AUTOSIZE_USEHEADER
	*/
	Return DllCall("SendMessage", "uint", hLV, "uint", 4126, "uint", col-1, "int", w)
	}

LVM_SETEXTENDEDLISTVIEWSTYLE(h,ByRef f,ByRef l){
	/*
		flag = combination of LVS_EX_AUTOAUTOARRANGE LVS_EX_AUTOCHECKSELECT LVS_EX_AUTOSIZECOLUMNS LVS_EX_BORDERSELECT LVS_EX_CHECKBOXES
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1036","UInt",f,"UInt",l)
	}

LVM_SETGROUPINFO(h,ByRef I,ByRef p){
	/*
		p = "ptr" {LVGROUP	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1093","UInt",I,"UInt",p)
	}

LVM_SETGROUPMETRICS(h,ByRef p){
	/*
		p = "ptr" {LVGROUPMETRICS	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x109b","UInt",0,"UInt",p)
	}

LVM_SETHOTCURSOR(h,ByRef c){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x103e","UInt",0,"UInt",c)
	}

LVM_SETHOTITEM(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x103c","UInt",i,"UInt",0)
	}

LVM_SETHOVERTIME(hlv, milliseconds){
	Return DllCall("SendMessage", "uint", hLV, "uint", 0x1047, "uint", 0, "uint", milliseconds)
	}

LVM_SETICONSPACING(h,ByRef x,ByRef y){
	/*
		xValue = Distance,between icons on the x-axis	 yValue = Distance,between icons on the y-axis
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1035","UInt",x,"UInt",y)
	}

LVM_SETIMAGELIST(hLV,Flag,hIL){
	/*
		Flag:
			LVSIL_GROUPHEADER       := 3
			LVSIL_NORMAL            := 0
			LVSIL_SMALL             := 1
			LVSIL_STATE             := 2

		Note:
			When using list mode Flag should be 1
			Example:
				LVM_SETIMAGELIST(hLV,1,%hLV%_IL)
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "UInt",hLV,"UInt","0x1003","UInt",Flag,"UInt",hIL)
	}

LVM_SETINFOTIP(h,ByRef p){
	/*
		p = "ptr" {LVSETINFOTIP	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10ad","UInt",0,"UInt",p)
	}

LVM_SETINSERTMARK(h,ByRef p){
	/*
		p = "ptr" {LVINSERTMARK	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a6","UInt",0,"UInt",p)
	}

LVM_SETINSERTMARKCOLOR(h,ByRef p){
	/*
		p = "ptr" {COLORREF	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10aa","UInt",0,"UInt",p)
	}

LVM_SETITEM(hLV, row, col=1, o=0, f*){
	/*
		LVM_SETITEM
			o = Combination of LVIS flags (see above).
			f* = Fields to modify each column. Each field will be modified in subsequent order starting with the c param. This param is variadic.

		http://www.autohotkey.net/~Lexikos/AutoHotkey_L/docs/Functions.htm#Variadic
	*/
	col -= 1
	VarSetCapacity(lvItem, A_PtrSize * 6, 0)
	NumPut(9, lvItem, "uint")   				; mask
	NumPut(row-1, lvItem, A_PtrSize, "int") 	; iItem
	NumPut(o, lvItem, A_PtrSize * 3, "uint") 	; state
	NumPut(1, lvItem, A_PtrSize * 4, "uint") 	; stateMask
	For index,field in f
		{
		NumPut(col + A_Index - 1, lvItem, A_PtrSize * 2, "int") ; iSubItem
		NumPut(&field, lvItem, A_PtrSize * 5, "ptr") ; pszText
		DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "uint", hLV, "uint", A_IsUnicode ? 0x104C : 0x1006, "uint", 0, "ptr", &lvItem)
		}
	}

LVM_SETITEMCOUNT(h,ByRef i,ByRef f){
	/*
		flag = LVSICF_NOINVALIDATEALL	 LVSICF_NOSCROLL
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x102f","UInt",i,"UInt",f)
	}

LVM_SETITEMINDEXSTATE(h,ByRef w,ByRef l){
	/*
		w = "ptr" {LVITEMINDEX	}
		l = "ptr" {LVITEM	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10d2","UInt",w,"UInt",l)
	}

LVM_SETITEMPOSITION(hLV, Index, l){
	/*
		Function:	LVM_SETITEMPOSITION

		lParam:
			The LOWORD specifies the new x-position of the item's upper-left corner, in view coordinates.
			The HIWORD specifies the new y-position of the item's upper-left corner, in view coordinates
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr", hLV, "UInt", 0x100F, "UInt", Index, "UInt", l)
	}

LVM_SETITEMPOSITION32(h,ByRef i,ByRef p){
	/*
		p = "ptr" {POINT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1031","UInt",i,"UInt",p)
	}

LVM_SETITEMSTATE(hLV,Row,Col,Mask,State,StateMask){
	/*
		LVM_SETITEMSTATE
			Mask:
				LVIF_STATE:= 0x8
			State flags:
				,LVIS_FOCUSED       :=0x1
				,LVIS_SELECTED      :=0x2
				,LVIS_CUT           :=0x4
				,LVIS_DROPHILITED   :=0x8
				,LVIS_OVERLAYMASK   :=0xF00
				,LVIS_UNCHECKED     :=0x1000
				,LVIS_CHECKED       :=0x2000
				,LVIS_STATEIMAGEMASK:=0xF000
	*/
	row -= 1
	VarSetCapacity(LVITEM, 20, 0)
	NumPut(Mask, LVITEM, 0 , "UInt") 				; Mask ;LVIF_STATE:= 0x8
	NumPut(Row, LVITEM, 4 , "Int")  				; iItem
	NumPut(Col-1, LVITEM, 8 , "Int")  				; SubItem
	NumPut(State, LVITEM, 12, "UInt") 				; state
	NumPut(StateMask, LVITEM,16,"UInt") 			; stateMask
	Return DllCall("SendMessage", "uint", hLV, "uint", 0x102B, "uint", row, "uint", &LVITEM)
	}

LVM_SETITEMTEXT(h,ByRef i,ByRef p){
	/*
		p = "ptr" {LVITEM	} The iSubItem member is the index of the subitem, or it can be zero to set the item label.
		The pszText member is the address of a null-terminated string containing the new text
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1074","UInt",i,"UInt",p)
	}

LVM_SETOUTLINECOLOR(h,ByRef p){
	/*
		p = "ptr" {COLORREF	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10b1","UInt",0,"UInt",p)
	}

LVM_SETSELECTEDCOLUMN(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x108c","UInt",i,"UInt",0)
	}

LVM_SETSELECTIONMARK(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1043","UInt",0,"UInt",i)
	}

LVM_SETTEXTBKCOLOR(h,ByRef l){
	/*
		lParam = Background_color or CLR_NONE
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1026","UInt",0,"UInt",l)
	}

LVM_SETTEXTCOLOR(h,ByRef p){
	/*
		p = "ptr" {COLORREF	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1024","UInt",0,"UInt",p)
	}

LVM_SETTILEINFO(h,ByRef p){
	/*
		p = "ptr" {LVTILEINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a4","UInt",0,"UInt",p)
	}

LVM_SETTILEVIEWINFO(h,ByRef p){
	/*
		p = "ptr" {LVTILEVIEWINFO	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x10a2","UInt",0,"UInt",p)
	}

LVM_SETTILEWIDTH(h,ByRef w,ByRef l){
	/*
		message is not supported ???
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x108d","UInt",w,"UInt",l)
	}

LVM_SETTOOLTIPS(h,ByRef w){
	/*
		wParam = Handle tooltip
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x104a","UInt",w,"UInt",0)
	}

LVM_SETUNICODEFORMAT(h,ByRef w){
	/*
		wParam = Determines the character set that is used by the control.
		If this value is nonzero, the control will use Unicode characters
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x2005","UInt",w,"UInt",0)
	}

LVM_SETVIEW(h,ByRef f){
	/*
		flag =	LV_VIEW_DETAILS	 LV_VIEW_ICON	 LV_VIEW_LIST	LV_VIEW_SMALLICON	LV_VIEW_TILE
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x108e","UInt",f,"UInt",0)
	}

LVM_SETWORKAREAS(h,ByRef w,ByRef p){
	/*
		wParam = The number of structures in the array at lprc. The maximum number of working areas allowed is
		defined by the LV_MAX_WORKAREAS value		ptr = {RECT	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1041","UInt",w,"UInt",p)
	}

LVM_SORTGROUPS(h,ByRef w,ByRef l){
	/*
		w = "ptr" {application-defined comparison function, LVGroupCompare	}
		l ptr = {Void pointer to the application-defined information	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x109e","UInt",w,"UInt",l)
	}

LVM_SORTITEMS(h,ByRef v,ByRef p){
	/*
		value = {Application-defined value that is passed to the comparison function	}
		ptr = {Pointer to the application-defined comparison function	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1030","UInt",v,"UInt",p)
	}

LVM_SORTITEMSEX(h,ByRef v,ByRef p){
	/*
		value = {Application-defined value that is passed to the comparison function	}
		ptr = {Pointer to the application-defined comparison function	}
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1051","UInt",v,"UInt",p)
	}

LVM_SUBITEMHITTEST(h,ByRef w,ByRef p){
	/*
		wParam = 0. Windows Vista. Should be -1 if the iGroup member of lParam is to be retrieved
		p = "ptr" {LVHITTESTINFO	} The {POINT	} structure within {LVHITTESTINFO	} should be set to the client coordinates to be hit-tested
	*/
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x1039","UInt",w,"UInt",p)
	}

LVM_UPDATE(h,ByRef i){
	Return DllCall("SendMessage" (A_IsUnicode ? "W" : "A"), "Ptr",h,"UInt","0x102a","UInt",i,"UInt",0)
	}
