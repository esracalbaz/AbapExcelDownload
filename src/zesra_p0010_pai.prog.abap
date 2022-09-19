*&---------------------------------------------------------------------*
*&  Include           ZESRA_P0010_PAI
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0100  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0100 INPUT.
  CASE sy-ucomm.
    WHEN '&BCK'.
      SET SCREEN 0.
    WHEN '&EXCL'.
      PERFORM excel_download.
*      FORM excel_download .
*        CALL METHOD cl_gui_frontend_services=>file_save_dialog
*        EXPORTING
*          window_title      = 'File Directory'    " Window Title
*          default_extension = 'XLS'    " Default Extension
**     default_file_name =     " Default File Name
**     with_encoding     =
**     file_filter       =     " File Type Filter Table
*        initial_directory = 'C:\'    " Initial Directory
**     prompt_on_overwrite       = 'X'
*      CHANGING
*        filename          = gv_filename    " File Name to Save
*        path              = gv_path    " Path to File
*        fullpath          = gv_fullpath    " Path + File Name
*        user_action       = gv_result    " User Action (C Class Const ACTION_OK, ACTION_OVERWRITE etc)
**     file_encoding     =
**     EXCEPTIONS
**     cntl_error        = 1
**     error_no_gui      = 2
**     not_supported_by_gui      = 3
**     invalid_default_file_name = 4
**     others            = 5
*    .
*        IF sy-subrc <> 0.
**     MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
**               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
*          ENDIF.
*
*    gv_fname = gv_fullpath.
*
*    CALL FUNCTION 'GUI_DOWNLOAD'
*      EXPORTING
*        bin_filesize            = ''
*        filename                = gv_fname
*        filetype                = 'DAT'
**     APPEND                  = ' '
**     WRITE_FIELD_SEPARATOR   = ' '
**     HEADER                  = '00'
**     TRUNC_TRAILING_BLANKS   = ' '
**     WRITE_LF                = 'X'
**     COL_SELECT              = ' '
**     COL_SELECT_MASK         = ' '
**     DAT_MODE                = ' '
**     CONFIRM_OVERWRITE       = ' '
**     NO_AUTH_CHECK           = ' '
**     CODEPAGE                = ' '
**     IGNORE_CERR             = ABAP_TRUE
**     REPLACEMENT             = '#'
**     WRITE_BOM               = ' '
**     TRUNC_TRAILING_BLANKS_EOL       = 'X'
**     WK1_N_FORMAT            = ' '
**     WK1_N_SIZE              = ' '
**     WK1_T_FORMAT            = ' '
**     WK1_T_SIZE              = ' '
**     WRITE_LF_AFTER_LAST_LINE        = ABAP_TRUE
**     SHOW_TRANSFER_STATUS    = ABAP_TRUE
**     VIRUS_SCAN_PROFILE      = '/SCET/GUI_DOWNLOAD'
**   IMPORTING
**     FILELENGTH              =
*      TABLES
*        data_tab                = gt_ty
**     FIELDNAMES              =
*      EXCEPTIONS
*        file_write_error        = 1
*        no_batch                = 2
*        gui_refuse_filetransfer = 3
*        invalid_type            = 4
*        no_authority            = 5
*        unknown_error           = 6
*        header_not_allowed      = 7
*        separator_not_allowed   = 8
*        filesize_not_allowed    = 9
*        header_too_long         = 10
*        dp_error_create         = 11
*        dp_error_send           = 12
*        dp_error_write          = 13
*        unknown_dp_error        = 14
*        access_denied           = 15
*        dp_out_of_memory        = 16
*        disk_full               = 17
*        dp_timeout              = 18
*        file_not_found          = 19
*        dataprovider_exception  = 20
*        control_flush_error     = 21
*        OTHERS                  = 22.
*    IF sy-subrc <> 0.
** Implement suitable error handling here
*      ENDIF.
*
*  ENDFORM.                    " EXCEL_DOWNLOAD
*  	WHEN OTHERS.
ENDCASE.
ENDMODULE.                 " USER_COMMAND_0100  INPUT
