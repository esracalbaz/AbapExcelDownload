*&---------------------------------------------------------------------*
*& Report  ZESRA_P0010
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*

REPORT zesra_p0010.

INCLUDE zesra_p0010_top.
INCLUDE zesra_p0010_pbo.
INCLUDE zesra_p0010_pai.
INCLUDE zesra_p0010_frm.

START-OF-SELECTION.

  PERFORM get_data.
  PERFORM set_fc.

  CALL SCREEN 0100.
