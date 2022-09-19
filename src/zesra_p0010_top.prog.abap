*&---------------------------------------------------------------------*
*&  Include           ZESRA_P0010_TOP
*&---------------------------------------------------------------------*

TABLES: zesra_t1, zesra_t2, zesra_t3.

TYPES: BEGIN OF gty_ty,
*         mark,
         vbeln TYPE zesra_t1-vbeln,
         fkart TYPE zesra_t1-fkart,
         posnr TYPE zesra_t2-posnr,
         erdat TYPE zesra_t3-erdat,
         erzet TYPE zesra_t3-erzet,
         ernam TYPE zesra_t3-ernam,
       END OF gty_ty.

DATA: gt_ty TYPE TABLE OF gty_ty,
*      gs_ty TYPE gty_ty.
      gs_ty LIKE LINE OF  gt_ty,
      gt_fc TYPE          lvc_t_fcat,
      gs_fc TYPE          lvc_s_fcat.

DATA: go_alv       TYPE REF TO cl_gui_alv_grid,
      go_container TYPE REF TO cl_gui_custom_container.

DATA: gv_filename      TYPE string,
      gv_path          TYPE string,
      gv_fullpath      TYPE string,
      gv_result        TYPE i,
      gv_default_fname TYPE string,
      gv_fname         TYPE string.

SELECTION-SCREEN BEGIN OF BLOCK block WITH FRAME TITLE title.
PARAMETERS: p_param1 TYPE vbeln_va MODIF ID gr1,
            p_param2 TYPE datum MODIF ID gr2.
SELECTION-SCREEN END OF BLOCK block.
