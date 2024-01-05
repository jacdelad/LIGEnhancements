;Compile with modern theme enabled!
Procedure ListIconGadget_(ID,x,y,dx,dy,spalte.s,sbreite,flags=0)
  Protected retval
  retval=ListIconGadget(ID,x,y,dx,dy,spalte.s,sbreite,flags)
  If ID=#PB_Any
    ID=retval
  EndIf
  If flags&#PB_ListIcon_GridLines
    SendMessage_(GadgetID(ID),#LVM_SETEXTENDEDLISTVIEWSTYLE,#LVS_EX_GRIDLINES,#LVS_EX_GRIDLINES)
  EndIf
  SendMessage_(GadgetID(ID),#LVM_SETEXTENDEDLISTVIEWSTYLE,#LVS_EX_DOUBLEBUFFER,#LVS_EX_DOUBLEBUFFER)
  ProcedureReturn retval
EndProcedure
Macro ListIconGadget(ID,x,y,dx,dy,spalte,sbreite,flags=0)
  ListIconGadget_(ID,x,y,dx,dy,spalte,sbreite,flags)
EndMacro
DeclareModule LIGEnhancements
  #ILC_PERITEMMIRROR    =  $8000
  #ILC_ORIGINALSIZE     = $10000
  #ILC_HIGHQUALITYSCALE = $20000
  
  #LVBKIF_FLAG_ALPHABLEND = $20000000
  #LVBKIF_FLAG_TILEOFFSET =      $100
  #LVBKIF_SOURCE_HBITMAP  =        $1
  #LVBKIF_SOURCE_MASK     =        $3
  #LVBKIF_SOURCE_NONE     =        $0
  #LVBKIF_SOURCE_URL      =        $2
  #LVBKIF_STYLE_NORMAL    =        $0
  #LVBKIF_STYLE_TILE      =       $10
  #LVBKIF_TYPE_WATERMARK  = $10000000
  
  #LVCF_DEFAULTWIDTH =  $80
  #LVCF_IDEALWIDTH   = $100
  #LVCF_MINWIDTH     =  $40
  
  #LVCFMT_FILL               =  $200000
  #LVCFMT_FIXED_WIDTH        =     $100
  #LVCFMT_FIXED_RATIO        =   $80000
  #LVCFMT_LINE_BREAK         =  $100000
  #LVCFMT_NO_DPI_SCALE       =   $40000
  #LVCFMT_NO_TITLE           =  $800000
  #LVCFMT_SPLITBUTTON        = $1000000
  #LVCFMT_TILE_PLACEMENTMASK =  $300000
  #LVCFMT_WRAP               =  $400000
  
  #LVFI_SUBSTRING = $4
  
  #LVFIF_STATE = $2
  #LVFIF_TEXT  = $1
  
  #LVFIS_FOCUSED = $1
  
  #LVGF_DESCRIPTIONBOTTOM =   $800
  #LVGF_DESCRIPTIONTOP    =   $400
  #LVGF_EXTENDEDIMAGE     =  $2000
  #LVGF_ITEMS             =  $4000
  #LVGF_SUBSET            =  $8000
  #LVGF_SUBSETITEMS       = $10000
  #LVGF_SUBTITLE          =   $100
  #LVGF_TASK              =   $200
  #LVGF_TITLEIMAGE        =  $1000
  
  #LVGS_FOCUSED           = $10
  #LVGS_NOHEADER          =  $4
  #LVGS_NORMAL            =  $0
  #LVGS_SELECTED          = $20
  #LVGS_SUBSETED          = $40
  #LVGS_SUBSETLINKFOCUSED = $80
  
  #LVHT_EX_FOOTER           =        $0
  #LVHT_EX_GROUP            = $FF000000
  #LVHT_EX_GROUP_BACKGROUND = $80000000
  #LVHT_EX_GROUP_COLLAPSE   = $40000000
  #LVHT_EX_GROUP_FOOTER     = $20000000
  #LVHT_EX_GROUP_HEADER     = $10000000
  #LVHT_EX_GROUP_STATEICON  =  $1000000
  #LVHT_EX_GROUP_SUBSETLINK =  $2000000
  #LVHT_EX_ONCONTENTS       =  $4000000
  
  #LVIF_COLFMT = $10000
  
  #LVIS_ACTIVATING = $20
  
  #LVS_EX_COLUMNOVERFLOW = $80000000
  
  #LVTVIF_AUTOSIZE    = $0
  #LVTVIF_EXTENDED    = $4
  #LVTVIF_FIXEDHEIGHT = $2
  #LVTVIF_FIXEDSIZE   = $3
  #LVTVIF_FIXEDWIDTH  = $1
  
  #LVTVIM_COLUMNS     = $2
  #LVTVIM_LABELMARGIN = $4
  #LVTVIM_TILESIZE    = $1
  
  Enumeration
    #PB_ListIcon_JustifyColumnLeft
    #PB_ListIcon_JustifyColumnCenter
    #PB_ListIcon_JustifyColumnRight
  EndEnumeration
  
  Enumeration
    #LIG_Title
    #LIG_SubTitle
    #LIG_Footer
  EndEnumeration
  Declare AddGroup(ListIconID.i,GroupID.i,Align.i,GroupText.s,GroupSubText.s,Footer.s,State.i)
  Declare EnableGroups(ListIconID.i,switch.b)
  Declare SetGroupText(ListIconID.i,GroupiID.i,GroupText.s,TextMode.a)
  Declare SetGroup(ListIconID.i,Item.i,GroupID.i)
  Declare GetGroup(ListIconID,Item)
  Declare AddGroupedItem(ListIconID.i,GroupID.i,ItemText.S)
  Declare SetHeaderFont(ListIconID.i,Font.i)
  Declare RemoveGroup(ListIconID.i,GroupID.i)
  Declare RemoveAllGroups(ListIconID.i)
  Declare FindItem(Gadget.i,item.s,flags);Flags:0=nichts,1=anwählen,2=sichtbar machen,3=beides
  Declare SetHeaderAlignment(Gadget.i,item.i,align);#LVCFMT_LEFT/#LVCFMT_CENTER/#LVCFMT_RIGHT
  Declare EnableTileView(Gadget.i,Columns.l,ColumnDefinition.s)
  Declare SetTile(Gadget.i,item.i)
  Declare DisableTileView(Gadget.i)
  Declare SetTileDefinition(Gadget.i,Columns.l,ColumnDefinition.s)
  Declare CreateImageList(Gadget.i,SizeX.l,SizeY.l)
  Declare SetImage(Gadget.i,Item.i,Column.i,ID.l)
  Declare ImageList_AddImage(Gadget.i,Image.i,ImageType.a=#False)
  Declare ImageList_DeleteImage(Gadget.i,ID.l)
  Declare SetListIconColumnJustification(ListIconID.i, Column.i, Alignment.i)
  Declare.s GetHeaderOrder(ListIconID.i)
  Declare SetHeaderOrder(ListIconID.i,Header.s)
  ;Declare ImageList_Destroy(Gadget.i);not needed due to not using the #LVS_SHAREIMAGELISTS-style!
EndDeclareModule

Module LIGEnhancements
  EnableExplicit
  Structure LVGROUPA Align #PB_Structure_AlignC
    cbSize.l
    mask.l
    *pszHeader
    cchHeader.l
    *pszFooter
    cchFooter.l
    iGroupId.l
    stateMask.l
    state.l
    uAlign.l
    *pszSubtitle
    cchSubtitle.l
    *pszTask
    cchTask.l
    *pszDescriptionTop
    cchDescriptionTop.l
    *pszDescriptionBottom
    cchDescriptionBottom.l
    iTitleImag.l
    iExtendedImage.l
    iFirstItem.l
    cItems.l
    *pszSubsetTitle
    cchSubsetTitle.l
  EndStructure
  Structure LVTILEVIEWINFO
    cbSize.l
    dwMask.l
    dwFlags.l
    sizeTile.SIZE
    cLines.l
    rcLabelMargins.RECT
  EndStructure
  Structure LVTILEINFO
    cbSize.l
    iItem.l
    cColumns.i
    puColumns.i
    piColFmt.i
  EndStructure
  Structure TileView
    Gadget.i
    lvti.LVTILEINFO
    lvtvi.LVTILEVIEWINFO
    Tiles.i
  EndStructure
  Structure ImageList
    Handle.i
    X.l
    Y.l
    Size.l
  EndStructure
  Global NewMap TileViewMap.TileView(),NewMap ImageListMap.ImageList()
  Procedure.s GetHeaderOrder(ListIconID.i)
    Protected Counter.l,Col.l=GetGadgetAttribute(ListIconID.i,#PB_ListIcon_ColumnCount),*Header,Result.s
    If Col>0
      *Header=AllocateMemory(Col*4)
      SendMessage_(GadgetID(ListIconID),#LVM_GETCOLUMNORDERARRAY,Col,*Header)
      For Counter=0 To Col-1
        Result+Str(PeekL(*Header+Counter*4))+"|"
      Next
      FreeMemory(*Header)
      Result=Left(Result,Len(Result)-1)
    EndIf
    ProcedureReturn Result
  EndProcedure
  Procedure SetHeaderOrder(ListIconID.i,Header.s)
    Protected Counter.l,Col.l=GetGadgetAttribute(ListIconID.i,#PB_ListIcon_ColumnCount),*Header,Result.l
    If Col>0 And Col=CountString(Header,"|")+1
      *Header=AllocateMemory(Col*4)
      For Counter=0 To Col-1
        PokeL(*Header+Counter*4,Val(StringField(Header,Counter+1,"|")))
      Next
      Result=SendMessage_(GadgetID(ListIconID),#LVM_SETCOLUMNORDERARRAY,Col,*Header)
      FreeMemory(*Header)
    EndIf
    ProcedureReturn Result
  EndProcedure
  Procedure SetHeaderFont(ListIconID.i,Font.i);Font, not FontID!
    ProcedureReturn SendMessage_(SendMessage_(GadgetID(ListIconID),#LVM_GETHEADER,0,0),#WM_SETFONT,FontID(Font),0)
  EndProcedure
  Procedure SetListIconColumnJustification(ListIconID.I, Column.I, Alignment.I)
    CompilerSelect #PB_Compiler_OS
      CompilerCase #PB_OS_Linux
        Protected AlignmentFactor.F
        Protected *CellRenderers
        Protected *Column
        Protected Count.I
        Protected i.I
        
        Select Alignment
          Case #PB_ListIcon_JustifyColumnLeft
            AlignmentFactor = 0.0
          Case #PB_ListIcon_JustifyColumnCenter
            AlignmentFactor = 0.5
          Case #PB_ListIcon_JustifyColumnRight
            AlignmentFactor = 1.0
        EndSelect
        
        *Column = gtk_tree_view_get_column_(GadgetID(ListIconID), Column)
        
        If *Column
          gtk_tree_view_column_set_alignment(*Column, AlignmentFactor)
          *CellRenderers = gtk_cell_layout_get_cells(*Column)
          
          If *CellRenderers
            Count = g_list_length_(*CellRenderers)
            
            For i = 0 To Count - 1
              g_object_set_double(g_list_nth_data_(*CellRenderers, i), "xalign",
                                  AlignmentFactor, #Null)
            Next i         
            
            g_list_free_(*CellRenderers)
          EndIf
        EndIf
      CompilerCase #PB_OS_MacOS
        Protected ColumnHeaderCell.I
        Protected ColumnObject.I
        Protected ColumnObjectArray.I
        
        Select Alignment
          Case #PB_ListIcon_JustifyColumnLeft
            Alignment = #NSLeftTextAlignment
          Case #PB_ListIcon_JustifyColumnCenter
            Alignment = #NSCenterTextAlignment
          Case #PB_ListIcon_JustifyColumnRight
            Alignment = #NSRightTextAlignment
        EndSelect
        
        ; ----- Justify text of column cells
        CocoaMessage(@ColumnObjectArray, GadgetID(ListIconID), "tableColumns")
        CocoaMessage(@ColumnObject, ColumnObjectArray, "objectAtIndex:", Column)
        CocoaMessage(0, CocoaMessage(0, ColumnObject, "dataCell"), "setAlignment:", Alignment)
        
        ; ----- Justify text of column header
        CocoaMessage(@ColumnHeaderCell, ColumnObject, "headerCell")
        CocoaMessage(0, ColumnHeaderCell, "setAlignment:", Alignment)
        
        ; ----- Redraw ListIcon contents to see change
        CocoaMessage(0, GadgetID(ListIconID), "reloadData")
      CompilerCase #PB_OS_Windows
        Protected ListIconColumn.LV_COLUMN
        
        ListIconColumn\mask = #LVCF_FMT
        
        Select Alignment
          Case #PB_ListIcon_JustifyColumnLeft
            ListIconColumn\fmt = #LVCFMT_LEFT
          Case #PB_ListIcon_JustifyColumnCenter
            ListIconColumn\fmt = #LVCFMT_CENTER
          Case #PB_ListIcon_JustifyColumnRight
            ListIconColumn\fmt = #LVCFMT_RIGHT
        EndSelect
        
        SendMessage_(GadgetID(ListIconID), #LVM_SETCOLUMN, Column, @ListIconColumn)
    CompilerEndSelect
  EndProcedure
  Procedure EnableGroups(ListIconID.i,switch.b)
    If switch
      ProcedureReturn SendMessage_(GadgetID(ListIconID),#LVM_ENABLEGROUPVIEW,#True,0)
    Else
      ProcedureReturn SendMessage_(GadgetID(ListIconID),#LVM_ENABLEGROUPVIEW,#False,0)
    EndIf
  EndProcedure
  Procedure AddGroup(ListIconID.i,GroupID.i,Align.i,GroupText.s,GroupSubText.s,Footer.s,State.i)
    Protected Group.LVGROUPA,UnicodeText.S,UnicodeSubtext.S,UnicodeFooter.S,Flags.i
    Group\cbSize = SizeOf(LVGROUPA)
    Flags=#LVGF_GROUPID | #LVGF_ALIGN
    If GroupText
      flags=flags|#LVGF_HEADER
      UnicodeText = Space(255)
      PokeS(@UnicodeText,GroupText,-1,#PB_Unicode)
      Group\pszHeader = @UnicodeText
    EndIf
    If GroupSubText
      flags=flags|#LVGF_SUBTITLE
      UnicodeSubtext = Space(255)
      PokeS(@UnicodesubText,GroupSubText,-1,#PB_Unicode)
      Group\pszSubtitle = @UnicodeSubtext
    EndIf
    If Footer
      flags=flags|#LVGF_FOOTER
      UnicodeFooter = Space(255)
      PokeS(@UnicodeFooter,Footer,-1,#PB_Unicode)
      Group\pszFooter = @UnicodeFooter
    EndIf
    If align
      Group\uAlign = Align;#LVGA_HEADER_CENTER,#LVGA_HEADER_LEFT,#LVGA_HEADER_RIGHT
    Else
      Group\uAlign = #LVGA_HEADER_CENTER
    EndIf
    Group\iGroupId = GroupID
    If state
      Group\stateMask = State
      Group\state = State
      flags=flags | #LVGF_STATE
    EndIf
    Group\mask = Flags
    ProcedureReturn SendMessage_(GadgetID(ListIconID),#LVM_INSERTGROUP,-1,@Group)
  EndProcedure
  Procedure SetGroupText(ListIconID.i,GroupID.i,GroupText.s,TextMode.a);Textmode -> #LIG_Title, #LIG_SubTitle or #LIG_Footer
    Protected Group.LVGROUPA,unicode.s=Space(255)
    Group\cbSize=SizeOf(LVGROUPA)
    Group\iGroupId=groupid
    PokeS(@unicode,grouptext,-1,#PB_Unicode)
    Select TextMode
      Case #LIG_Title
        group\mask=#LVGF_HEADER
        Group\pszHeader = @Unicode
      Case #LIG_SubTitle
        group\mask=#LVGF_SUBTITLE
        Group\pszSubtitle = @Unicode
      Case #LIG_Footer
        group\mask=#LVGF_FOOTER
        Group\pszFooter = @Unicode
    EndSelect
    ProcedureReturn SendMessage_(GadgetID(ListIconID),#LVM_SETGROUPINFO,groupid,@Group)
  EndProcedure
  Procedure SetGroup(ListIconID.i,Item.i,GroupID.i)
    Protected MyItem.LVITEM
    MyItem\iItem=Item
    MyItem\iGroupId=GroupID
    MyItem\mask=#LVIF_GROUPID
    ProcedureReturn SendMessage_(GadgetID(ListIconID),#LVM_SETITEM,0,@MyItem)
  EndProcedure
  Procedure GetGroup(ListIconID,Item.i)
    Protected MyItem.LVITEM
    MyItem\iItem=Item
    MyItem\mask=#LVIF_GROUPID
    SendMessage_(GadgetID(ListIconID),#LVM_GETITEM,0,@MyItem)
    ProcedureReturn MyItem\iGroupId
  EndProcedure
  Procedure AddGroupedItem(ListIconID.i,GroupID.i,ItemText.S)
    Protected Item.LVITEM
    Item\mask = #LVIF_TEXT | #LVIF_GROUPID
    Item\pszText = @ItemText
    Item\iGroupId = GroupID
    SendMessage_(GadgetID(ListIconID),#LVM_INSERTITEM,0,@Item)
  EndProcedure
  Procedure RemoveGroup(ListIconID.i,GroupID.i)
    SendMessage_(GadgetID(ListIconID),#LVM_REMOVEGROUP,GroupID,0)
  EndProcedure
  Procedure RemoveAllGroups(ListIconID.i)
    SendMessage_(GadgetID(ListIconID),#LVM_REMOVEALLGROUPS,0,0)
  EndProcedure
  Procedure FindItem(Gadget.i,item.s,flags);Flags:0=nothing,1=select,2=make visible,3=both
    Protected LIFI.LVFINDINFO,index
    LIFI\flags=#LVFI_STRING
    LIFI\psz=@item
    Index=SendMessage_(GadgetID(Gadget),#LVM_FINDITEM,-1,@LIFI)
    Select flags
      Case 1
        SetGadgetState(Gadget,index)
      Case 2
        SendMessage_(GadgetID(Gadget),#LVM_ENSUREVISIBLE,index,0)
      Case 3
        SetGadgetState(Gadget,index)
        SendMessage_(GadgetID(Gadget),#LVM_ENSUREVISIBLE,index,0)
    EndSelect
  EndProcedure
  Procedure SetHeaderAlignment(Gadget.i,item.i,align)
    Protected ListViewSpalte.LV_COLUMN
    ListViewSpalte\mask = #LVCF_FMT
    ListViewSpalte\fmt = align;#LVCFMT_RIGHT
    SendMessage_(GadgetID(Gadget),#LVM_SETCOLUMN,item,@ListViewSpalte)
  EndProcedure
  Procedure EnableTileView(Gadget.i,Columns.l,ColumnDefinition.s);Columns=visible Extra Columns, ColumnDefinition=Definition for extra columns separated by "," (e.g. "1,3,2")
    If SendMessage_(GadgetID(Gadget),#LVM_SETVIEW,#LV_VIEW_TILE,0)>0
      Protected handle.s=Str(Gadget),count.b
      TileViewMap(handle)\lvtvi\cbSize=SizeOf(LVTILEVIEWINFO)
      TileViewMap(handle)\lvtvi\cLines=Columns;Anzahl Extra-Zeilen
      TileViewMap(handle)\lvtvi\dwMask=#LVTVIM_COLUMNS
      SendMessage_(GadgetID(Gadget),#LVM_SETTILEVIEWINFO,0,@TileViewMap(handle)\lvtvi)
      SendMessage_(GadgetID(Gadget),#LVM_ARRANGE,0,0)
      TileViewMap(handle)\Gadget=Gadget
      TileViewMap(handle)\lvti\cbSize=SizeOf(LVTILEINFO)
      TileViewMap(handle)\Tiles=AllocateMemory(Columns*4,#PB_Memory_NoClear)
      For count=0 To Columns-1
        PokeL(TileViewMap(handle)\Tiles+count*4,Val(StringField(ColumnDefinition,count+1,",")))
      Next
      TileViewMap(handle)\lvti\cColumns=Columns
      TileViewMap(handle)\lvti\puColumns=TileViewMap(handle)\Tiles
      ProcedureReturn 1
    Else
      ProcedureReturn 0
    EndIf
  EndProcedure
  Procedure SetTileDefinition(Gadget.i,Columns.l,ColumnDefinition.s);Columns=visible Extra Columns, ColumnDefinition=Definition for extra columns separated by "," (e.g. "1,3,2")
    Protected handle.s=Str(Gadget),count.b
    TileViewMap(handle)\lvtvi\cLines=Columns;Anzahl Extra-Zeilen
    SendMessage_(GadgetID(Gadget),#LVM_SETTILEVIEWINFO,0,@TileViewMap(handle)\lvtvi)
    SendMessage_(GadgetID(Gadget),#LVM_ARRANGE,0,0)
    FreeMemory(TileViewMap(handle)\Tiles)
    TileViewMap(handle)\Tiles=AllocateMemory(Columns*4,#PB_Memory_NoClear)
    For count=0 To Columns-1
      PokeL(TileViewMap(handle)\Tiles+count*4,Val(StringField(ColumnDefinition,count+1,",")))
    Next
    TileViewMap(handle)\lvti\cColumns=Columns
    TileViewMap(handle)\lvti\puColumns=TileViewMap(handle)\Tiles
  EndProcedure
  Procedure SetTile(Gadget.i,item.i);Apply defined scheme to tile
    Protected handle.s=Str(Gadget)
    TileViewMap(handle)\lvti\iItem=item
    ProcedureReturn SendMessage_(GadgetID(TileViewMap(handle)\Gadget),#LVM_SETTILEINFO,0,@TileViewMap(handle)\lvti)
  EndProcedure
  Procedure DisableTileView(Gadget.i);Call AFTER destroying ListIconGadget or setting other view
    Protected handle.s=Str(Gadget)
    If FindMapElement(TileViewMap(),handle)
      FreeMemory(TileViewMap(handle)\Tiles)
      DeleteMapElement(TileViewMap(),handle)
    EndIf
  EndProcedure
  Procedure CreateImageList(Gadget.i,SizeX.l,SizeY.l)
    Protected handle.s=Str(Gadget)
    ImageListMap(handle)\Handle=ImageList_Create_(SizeX,SizeY,#ILC_COLOR32,0,0)
    ProcedureReturn SendMessage_(GadgetID(Gadget),#LVM_SETIMAGELIST,0,ImageListMap(handle)\Handle)
  EndProcedure
  Procedure ImageList_AddImage(Gadget.i,Image.i,ImageType.a=#False)
    Protected *IL.ImageList=@ImageListMap(Str(Gadget))
    If ImageType
      ProcedureReturn ImageList_Add_(*IL\Handle,Image,0)
    Else
      If ImageWidth(Image)=*IL\X And ImageHeight(Image)=*IL\Y
        ProcedureReturn ImageList_Add_(*IL\Handle,ImageID(Image),0)
      Else
        Protected TempImage.i=CopyImage(Image,#PB_Any),Result.l
        ResizeImage(TempImage,*IL\X,*IL\Y,#PB_Image_Smooth)
        Result=ImageList_Add_(*IL\Handle,ImageID(TempImage),0)
        FreeImage(TempImage)
        ProcedureReturn Result
      EndIf
    EndIf
  EndProcedure
  Procedure ImageList_DeleteImage(Gadget.i,ID.l)
    ProcedureReturn ImageList_Remove_(ImageListMap(Str(Gadget))\Handle,ID)
  EndProcedure
  Procedure ImageList_Destroy(Gadget.i)
    SendMessage_(GadgetID(Gadget),#LVM_SETIMAGELIST,0,0)
    ProcedureReturn ImageList_Destroy_(ImageListMap(Str(Gadget))\Handle)
  EndProcedure
  Procedure SetImage(Gadget.i,Item.i,Column.i,ID.l)
    Protected LVI.LVITEM
    LVI\iItem=Item
    LVI\iSubItem=Column
    LVI\iImage=ID
    LVI\mask=#LVIF_IMAGE
    ProcedureReturn SendMessage_(GadgetID(Gadget),#LVM_SETITEM,0,LVI)
  EndProcedure
EndModule

CompilerIf #PB_Compiler_IsMainFile
  DisableExplicit
  Define tempcounter,icon
  
  ;Window with Grouped items:
  OpenWindow(0,0,200,600,400,"LIGEnhancements",#PB_Window_SystemMenu)
  id=ListIconGadget(#PB_Any,0,0,600,400,"First Column",200,#PB_ListIcon_FullRowSelect)
  AddGadgetColumn(id,1,"Second column",200)
  LIGEnhancements::EnableGroups(id,1)
  For tempcounter=1 To 10
    LIGEnhancements::AddGroup(id,tempcounter,#LVGA_HEADER_CENTER,"Group No. "+Str(tempcounter),"Cool subtext","Footer text",#LVGS_COLLAPSIBLE)
  Next
  For tempcounter=1 To 100
    AddGadgetItem(id,-1,"Item No. "+Chr(10)+Str(tempcounter))
    LIGEnhancements::SetGroup(id,tempcounter-1,1+tempcounter/10)
  Next
  
  ;Window with TileView-ListIconGadget:
  OpenWindow(1,605,200,640,400,"LIGEnhancements",#PB_Window_SystemMenu)
  id=ListIconGadget(#PB_Any,0,0,640,400,"First Column",200,#PB_ListIcon_FullRowSelect)
  AddGadgetColumn(id,1,"Second column",200)
  LIGEnhancements::EnableTileView(id,1,"1")
  LIGEnhancements::CreateImageList(id,25,50)
  icon=LoadIcon_(0,32518)
  LIGEnhancements::ImageList_AddImage(id,icon,#True)
  For tempcounter=1 To 100
    AddGadgetItem(id,-1,"Item No. "+Chr(10)+Str(tempcounter),icon)
    LIGEnhancements::SetImage(id,tempcounter-1,0,0)
    LIGEnhancements::SetTile(id,tempcounter-1)
  Next
  
  Repeat
    Select WaitWindowEvent()
      Case #PB_Event_CloseWindow
        Break
    EndSelect
  ForEver
  FreeGadget(id)
  LIGEnhancements::DisableTileView(0)
CompilerEndIf

; IDE Options = PureBasic 6.04 LTS (Windows - x64)
; CursorPosition = 6
; Folding = hAFAAAEA5
; Optimizer
; EnableAsm
; EnableThread
; EnableXP
; DPIAware
; EnableOnError
; CPU = 1
; CompileSourceDirectory
; EnablePurifier
; EnableCompileCount = 49
; EnableBuildCount = 0
; EnableExeConstant