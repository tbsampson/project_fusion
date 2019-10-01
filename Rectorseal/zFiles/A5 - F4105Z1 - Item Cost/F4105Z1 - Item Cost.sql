/*
    F4105Z1 - Item Cost
    VER0001 -  Tom Sampson
*/

SELECT

 '' SZEDUS -- EDI - User ID [Generic Edit] String (10)
,'' SZEDBT -- EDI - Batch Number [Generic Edit] String (15)
,'' SZEDTN -- EDI - Transaction Number [Generic Edit] String (22)
,'' SZEDLN -- EDI - Line Number [Generic Edit] Numeric (7)
,'' SZEDCT -- EDI - Document Type [Generic Edit] String (2)
,'' SZTYTN -- Type - Transaction [UDC (00 TT)] String (8)
,'' SZEDFT -- EDI - Translation Format [Generic Edit] String (10)
,'' SZEDDT -- EDI - Transmission Date [Generic Edit] Date (6)
,'' SZDRIN -- Direction Indicator [UDC (00 DN)] Character (1)
,'' SZEDDL -- EDI - Detail Lines Processed [Generic Edit] Numeric (5)
,'' SZEDSP -- EDI - Successfully Processed [Generic Edit] Character (1)
,'' SZPNID -- Trading Partner ID [Generic Edit] String (15)
,'' SZTNAC -- Transaction Action [UDC (00 TA)] String (2)
,'' SZITM -- Item Number - Short [Generic Edit] Numeric (8)
,'' SZLITM -- 2nd Item Number [Generic Edit] String (25)
,'' SZAITM -- 3rd Item Number [Generic Edit] String (25)
,'' SZMCU -- Business Unit [Generic Edit] String (12)
,'' SZLOCN -- Location [Generic Edit] String (20)
,'' SZLOTN -- Lot/Serial Number [Generic Edit] String (30)
,'' SZLOTG -- Lot Grade [UDC (40 LG)] String (3)
,'' SZLEDG -- Cost Method [UDC (40 CM)] String (2)
,'' SZUNCS -- Amount - Unit Cost [Generic Edit] Numeric (15)
,'' SZCSPO -- Costing Selection - Purchasing [UDC (H40 CT)] Character (1)
,'' SZCSIN -- Costing Selection - Inventory [UDC (H40 CS)] Character (1)
,'' SZURCD -- User Reserved Code [Generic Edit] String (2)
,'' SZURDT -- User Reserved Date [Generic Edit] Date (6)
,'' SZURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,'' SZURAB -- User Reserved Number [Generic Edit] Numeric (8)
,'' SZURRF -- User Reserved Reference [Generic Edit] String (15)
,'' SZTORG -- Transaction Originator [Generic Edit] String (10)
,'' SZUSER -- User ID [Generic Edit] String (10)
,'' SZPID -- Program ID [Generic Edit] String (10)
,'' SZJOBN -- Work Station ID [Generic Edit] String (10)
,'' SZUPMJ -- Date - Updated [Generic Edit] Date (6)
,'' SZTDAY -- Time of Day [Generic Edit] Numeric (6)
,'' SZCCFL -- Cost Changed Flag [Generic Edit] Character (1)
,'' SZOSTC -- Overstock Cost [Generic Edit] Numeric (15)
,'' SZCRCS -- Carrying Cost [Generic Edit] Numeric (15)
,'' SZSTOC -- Stockout Cost [Generic Edit] Numeric (15)

FROM

TBD