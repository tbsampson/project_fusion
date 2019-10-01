/*
    F41002 - UOM Conversion
    VER0001 -  Tom Sampson
*/

SELECT

 '' UMMCU -- Business Unit [Generic Edit] String (12)
,'' UMITM -- Item Number - Short [Generic Edit] Numeric (8)
,'' UMUM -- Unit of Measure [UDC (00 UM)] String (2)
,'' UMRUM -- Related Unit of Measure [UDC (00 UM)] String (2)
,'' UMUSTR -- Unit of Measure Structure [UDC (H41 US)] Character (1)
,'' UMCONV -- Conversion Factor [Generic Edit] Numeric (15)
,'' UMCNV1 -- Conversion Factor - Secondary to Primary [Generic Edit] Numeric (15)
,'' UMUSER -- User ID [Generic Edit] String (10)
,'' UMPID -- Program ID [Generic Edit] String (10)
,'' UMJOBN -- Work Station ID [Generic Edit] String (10)
,'' UMUPMJ -- Date - Updated [Generic Edit] Date (6)
,'' UMTDAY -- Time of Day [Generic Edit] Numeric (6)
,'' UMEXPO -- Exclude from PO [Generic Edit] Character (1)
,'' UMEXSO -- Exclude from SO [Generic Edit] Character (1)
,'' UMPUPC -- Code Purchase Price Code [Generic Edit] Integer (11)
,'' UMSEPC -- Code Sales Price Code [Generic Edit] Integer (11)

FROM

TBD