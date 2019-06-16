/*
    F4104 - Item Cross Reference
    VER0001 -  Tom Sampson
*/

SELECT

 '' IVAN8 -- Address Number [Generic Edit] Numeric (8)
,'' IVXRT -- Type - Cross-Reference Type Code [UDC (41 DT)] String (2)
,'' IVITM -- Item Number - Short [Generic Edit] Numeric (8)
,'' IVEXDJ -- Date - Expired [Generic Edit] Date (6)
,'' IVEFTJ -- Date - Effective [Generic Edit] Date (6)
,'' IVMCU -- Business Unit [Generic Edit] String (12)
,'' IVCITM -- Item Number - Customer/Supplier [Generic Edit] String (25)
,'' IVDSC1 -- Description [Generic Edit] String (30)
,'' IVDSC2 -- Description - Line 2 [Generic Edit] String (30)
,'' IVALN -- Search Text - Compressed [Generic Edit] String (30)
,'' IVLITM -- 2nd Item Number [Generic Edit] String (25)
,'' IVAITM -- 3rd Item Number [Generic Edit] String (25)
,'' IVURCD -- User Reserved Code [Generic Edit] String (2)
,'' IVURDT -- User Reserved Date [Generic Edit] Date (6)
,'' IVURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,'' IVURAB -- User Reserved Number [Generic Edit] Numeric (8)
,'' IVURRF -- User Reserved Reference [Generic Edit] String (15)
,'' IVUSER -- User ID [Generic Edit] String (10)
,'' IVPID -- Program ID [Generic Edit] String (10)
,'' IVJOBN -- Work Station ID [Generic Edit] String (10)
,'' IVUPMJ -- Date - Updated [Generic Edit] Date (6)
,'' IVTDAY -- Time of Day [Generic Edit] Numeric (6)
,'' IVRATO -- Substitute Ratio [Generic Edit] Numeric (15)
,'' IVAPSP -- Substitute Priority [Generic Edit] Numeric (15)
,'' IVIDEM -- Transfer Demand [Generic Edit] Character (1)
,'' IVAPSS -- APS Substitute [Generic Edit] Character (1)
,'' IVCIRV -- Item Revision Level - Customer/Supplier [Generic Edit] String (20)
,'' IVADIND -- Adjustment Indicator [UDC (42 IA)] Character (1)
,'' IVBPIND -- Base Price Indicator [UDC (42 IP)] Character (1)
,'' IVCARDNO -- Card Number [UDC (40R CD)] String (4)

FROM

TBD