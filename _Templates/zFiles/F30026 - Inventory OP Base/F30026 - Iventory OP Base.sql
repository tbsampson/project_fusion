/*
    F30026 - Iventory OP Base
    VER0001 -  Tom Sampson
*/

SELECT

 '' IEITM -- Item Number - Short [Generic Edit] Numeric (8)
,'' IELITM -- 2nd Item Number [Generic Edit] String (25)
,'' IEAITM -- 3rd Item Number [Generic Edit] String (25)
,'' IEMMCU -- Branch [Generic Edit] String (12)
,'' IELOCN -- Location [Generic Edit] String (20)
,'' IELOTN -- Lot/Serial Number [Generic Edit] String (30)
,'' IELEDG -- Cost Method [UDC (40 CM)] String (2)
,'' IECOST -- Cost Component [UDC (30 CA)] String (3)
,'' IELOTG -- Lot Grade [UDC (40 LG)] String (3)
,'' IESTDC -- Amount - Frozen Cost [Generic Edit] Numeric (15)
,'' IEXSMC -- Amount - Simulated Mfg. Cost [Generic Edit] Numeric (15)
,'' IECSL -- Amount - Frozen Cost Rollup [Generic Edit] Numeric (15)
,'' IEXSCR -- Amount - Simulated Cost Rollup [Generic Edit] Numeric (15)
,'' IESCTC -- Factor Code - Frozen [Generic Edit] String (4)
,'' IEXSFC -- Factor Code - Simulated [Generic Edit] String (4)
,'' IESTFC -- Factor - Frozen [Generic Edit] Numeric (15)
,'' IEXSF -- Factor - Simulated [Generic Edit] Numeric (15)
,'' IERATS -- Rate Code - Frozen [Generic Edit] String (4)
,'' IEXSRC -- Rate Code - Simulated [Generic Edit] String (4)
,'' IERTSD -- Rate - Frozen [Generic Edit] Numeric (15)
,'' IEXSR -- Rate - Simulated [Generic Edit] Numeric (15)
,'' IEPFLG -- Processing Flag [UDC (30 PF)] Character (1)
,'' IEUSER -- User ID [Generic Edit] String (10)
,'' IEPID -- Program ID [Generic Edit] String (10)
,'' IEJOBN -- Work Station ID [Generic Edit] String (10)
,'' IEUPMJ -- Date - Updated [Generic Edit] Date (6)
,'' IETDAY -- Time of Day [Generic Edit] Numeric (6)
,'' IEOPSQ -- Sequence Number - Operations [Generic Edit] Numeric (5)
,'' IEMCUL -- Alternate Work Center [Generic Edit] String (12)
,'' IEWMCU -- Workcenter Branch [Generic Edit] String (12)
,'' IELDA -- Account Level of Detail [Generic Edit] Character (1)
,'' IETBM -- Type Bill of Material [UDC (40 TB)] String (3)
,'' IEACQ -- Quantity - Accounting Cost [Generic Edit] Numeric (15)
,'' IEF -- Detail Flag [Generic Edit] Character (1)

FROM

TBD