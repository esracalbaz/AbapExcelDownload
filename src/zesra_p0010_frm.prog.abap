*&---------------------------------------------------------------------*
*&  Include           ZESRA_P0010_FRM
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Form  GET_DATA
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM get_data .
  SELECT * FROM zesra_t1 AS a
    INNER JOIN zesra_t2 AS b ON b~vbeln EQ a~vbeln
    INNER JOIN zesra_t3 AS c ON c~vbeln EQ a~vbeln
    INTO CORRESPONDING FIELDS OF TABLE gt_ty
    WHERE b~vbeln EQ p_param1
    AND c~erdat EQ p_param2.
ENDFORM.                    " GET_DATA
*&---------------------------------------------------------------------*
*&      Form  SET_FC
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM set_fc .
  CLEAR: gs_fc.
  gs_fc-fieldname = 'VBELN'.
  gs_fc-scrtext_s = 'Sales D'.
  gs_fc-scrtext_m = 'Sales Doc'.
  gs_fc-scrtext_l = 'Sales Document'.
  APPEND gs_fc TO gt_fc.

  CLEAR: gs_fc.
  gs_fc-fieldname = 'FKART'.
  gs_fc-scrtext_s = 'Billing T'.
  gs_fc-scrtext_m = 'Billing Ty'.
  gs_fc-scrtext_l = 'Billing Type'.
  APPEND gs_fc TO gt_fc.

  CLEAR: gs_fc.
  gs_fc-fieldname = 'POSNR'.
  gs_fc-scrtext_s = 'Item'.
  gs_fc-scrtext_m = 'Item'.
  gs_fc-scrtext_l = 'Item'.
  APPEND gs_fc TO gt_fc.

  CLEAR: gs_fc.
  gs_fc-fieldname = 'ERDAT'.
  gs_fc-scrtext_s = 'Date'.
  gs_fc-scrtext_m = 'Date'.
  gs_fc-scrtext_l = 'Date'.
  APPEND gs_fc TO gt_fc.

  CLEAR: gs_fc.
  gs_fc-fieldname = 'ERZET'.
  gs_fc-scrtext_s = 'Time'.
  gs_fc-scrtext_m = 'Time'.
  gs_fc-scrtext_l = 'Time'.
  APPEND gs_fc TO gt_fc.

  CLEAR: gs_fc.
  gs_fc-fieldname = 'ERNAM'.
  gs_fc-scrtext_s = 'Created by'.
  gs_fc-scrtext_m = 'Created by'.
  gs_fc-scrtext_l = 'Created by'.
  APPEND gs_fc TO gt_fc.
ENDFORM.                    " SET_FC
*&---------------------------------------------------------------------*
*&      Form  DISPLAY_ALV
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM display_alv .
  CREATE OBJECT go_container
    EXPORTING
*     parent         =     " Parent container
      container_name = 'CC_ALV'    " Name of the Screen CustCtrl Name to Link Container To
*     style          =     " Windows Style Attributes Applied to this Container
*     lifetime       = LIFETIME_DEFAULT    " Lifetime
*     repid          =     " Screen to Which this Container is Linked
*     dynnr          =     " Report To Which this Container is Linked
*     no_autodef_progid_dynnr     =     " Don't Autodefined Progid and Dynnr?
*  EXCEPTIONS
*     cntl_error     = 1
*     cntl_system_error           = 2
*     create_error   = 3
*     lifetime_error = 4
*     lifetime_dynpro_dynpro_link = 5
*     others         = 6
    .
  IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
  .
  IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  CREATE OBJECT go_alv
    EXPORTING
*     i_shellstyle      = 0    " Control Style
*     i_lifetime        =     " Lifetime
      i_parent = go_container    " Parent Container
*     i_appl_events     = SPACE    " Register Events as Application Events
*     i_parentdbg       =     " Internal, Do not Use
*     i_applogparent    =     " Container for Application Log
*     i_graphicsparent  =     " Container for Graphics
*     i_name   =     " Name
*     i_fcat_complete   = SPACE    " Boolean Variable (X=True, Space=False)
*  EXCEPTIONS
*     error_cntl_create = 1
*     error_cntl_init   = 2
*     error_cntl_link   = 3
*     error_dp_create   = 4
*     others   = 5
    .
  IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
  .
  CALL METHOD go_alv->set_table_for_first_display
*  EXPORTING
*    i_buffer_active               =     " Buffering Active
*    i_bypassing_buffer            =     " Switch Off Buffer
*    i_consistency_check           =     " Starting Consistency Check for Interface Error Recognition
*    i_structure_name              =     " Internal Output Table Structure Name
*    is_variant                    =     " Layout
*    i_save                        =     " Save Layout
*    i_default                     = 'X'    " Default Display Variant
*    is_layout                     =     " Layout
*    is_print                      =     " Print Control
*    it_special_groups             =     " Field Groups
*    it_toolbar_excluding          =     " Excluded Toolbar Standard Functions
*    it_hyperlink                  =     " Hyperlinks
*    it_alv_graphics               =     " Table of Structure DTC_S_TC
*    it_except_qinfo               =     " Table for Exception Quickinfo
*    ir_salv_adapter               =     " Interface ALV Adapter
    CHANGING
      it_outtab       = gt_ty    " Output Table
      it_fieldcatalog = gt_fc    " Field Catalog
*     it_sort         =     " Sort Criteria
*     it_filter       =     " Filter Criteria
*  EXCEPTIONS
*     invalid_parameter_combination = 1
*     program_error   = 2
*     too_many_lines  = 3
*     others          = 4
    .
  IF sy-subrc <> 0.
* MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*            WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

ENDFORM.                    " DISPLAY_ALV
*&---------------------------------------------------------------------*
*&      Form  EXCEL_DOWNLOAD
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM excel_download .
  CALL METHOD cl_gui_frontend_services=>file_save_dialog
    EXPORTING
      window_title      = 'File Directory'    " Window Title
      default_extension = 'XLS'    " Default Extension
*     default_file_name =     " Default File Name
*     with_encoding     =
*     file_filter       =     " File Type Filter Table
      initial_directory = 'C:\'    " Initial Directory
*     prompt_on_overwrite       = 'X'
    CHANGING
      filename          = gv_filename    " File Name to Save
      path              = gv_path    " Path to File
      fullpath          = gv_fullpath    " Path + File Name
      user_action       = gv_result    " User Action (C Class Const ACTION_OK, ACTION_OVERWRITE etc)
*     file_encoding     =
*    EXCEPTIONS
*     cntl_error        = 1
*     error_no_gui      = 2
*     not_supported_by_gui      = 3
*     invalid_default_file_name = 4
*     others            = 5
    .
  IF sy-subrc <> 0.
*   MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
*              WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

  gv_fname = gv_fullpath.

CALL FUNCTION 'GUI_DOWNLOAD'
  EXPORTING
   BIN_FILESIZE                    = ''
    filename                        = gv_fname
   FILETYPE                        = 'DAT'
*   APPEND                          = ' '
*   WRITE_FIELD_SEPARATOR           = ' '
*   HEADER                          = '00'
*   TRUNC_TRAILING_BLANKS           = ' '
*   WRITE_LF                        = 'X'
*   COL_SELECT                      = ' '
*   COL_SELECT_MASK                 = ' '
*   DAT_MODE                        = ' '
*   CONFIRM_OVERWRITE               = ' '
*   NO_AUTH_CHECK                   = ' '
*   CODEPAGE                        = ' '
*   IGNORE_CERR                     = ABAP_TRUE
*   REPLACEMENT                     = '#'
*   WRITE_BOM                       = ' '
*   TRUNC_TRAILING_BLANKS_EOL       = 'X'
*   WK1_N_FORMAT                    = ' '
*   WK1_N_SIZE                      = ' '
*   WK1_T_FORMAT                    = ' '
*   WK1_T_SIZE                      = ' '
*   WRITE_LF_AFTER_LAST_LINE        = ABAP_TRUE
*   SHOW_TRANSFER_STATUS            = ABAP_TRUE
*   VIRUS_SCAN_PROFILE              = '/SCET/GUI_DOWNLOAD'
* IMPORTING
*   FILELENGTH                      =
  tables
    data_tab                        = gt_ty
*   FIELDNAMES                      =
 EXCEPTIONS
   FILE_WRITE_ERROR                = 1
   NO_BATCH                        = 2
   GUI_REFUSE_FILETRANSFER         = 3
   INVALID_TYPE                    = 4
   NO_AUTHORITY                    = 5
   UNKNOWN_ERROR                   = 6
   HEADER_NOT_ALLOWED              = 7
   SEPARATOR_NOT_ALLOWED           = 8
   FILESIZE_NOT_ALLOWED            = 9
   HEADER_TOO_LONG                 = 10
   DP_ERROR_CREATE                 = 11
   DP_ERROR_SEND                   = 12
   DP_ERROR_WRITE                  = 13
   UNKNOWN_DP_ERROR                = 14
   ACCESS_DENIED                   = 15
   DP_OUT_OF_MEMORY                = 16
   DISK_FULL                       = 17
   DP_TIMEOUT                      = 18
   FILE_NOT_FOUND                  = 19
   DATAPROVIDER_EXCEPTION          = 20
   CONTROL_FLUSH_ERROR             = 21
   OTHERS                          = 22
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

ENDFORM.                    " EXCEL_DOWNLOAD
