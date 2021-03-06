
/*
    F03B11Z1 - Open AR Balance
    VER0001 -  Tom Sampson
    BV R03B11Z1A
*/

SELECT

 '' VJEDUS -- EDI - User ID [Generic Edit] String (10)
,'' VJEDTY -- Type Record [UDC (00 RD)] Character (1)
,'' VJEDSQ -- Record Sequence [Generic Edit] Numeric (2)
,'' VJEDTN -- EDI - Transaction Number [Generic Edit] String (22)
,'' VJEDCT -- EDI - Document Type [Generic Edit] String (2)
,'' VJEDLN -- EDI - Line Number [Generic Edit] Numeric (7)
,'' VJEDTS -- EDI - Transaction Set Number [Generic Edit] String (6)
,'' VJEDFT -- EDI - Translation Format [Generic Edit] String (10)
,'' VJEDDT -- EDI - Transmission Date [Generic Edit] Date (6)
,'' VJEDER -- EDI - Send/Receive Indicator [UDC (H00 ED)] Character (1)
,'' VJEDDL -- EDI - Detail Lines Processed [Generic Edit] Numeric (5)
,'' VJEDSP -- EDI - Successfully Processed [Generic Edit] Character (1)
,'' VJEDTC -- EDI - Transaction Action [Generic Edit] Character (1)
,'' VJEDTR -- EDI - Transaction Type [Generic Edit] Character (1)
,'' VJEDBT -- EDI - Batch Number [Generic Edit] String (15)
,'' VJEDGL -- Batch File Create G/L Record [Generic Edit] Character (1)
,'' VJEDDH -- Batch File Discount Handling Flag [Generic Edit] Character (1)
,'' VJEDAN -- User Address Number [Generic Edit] Numeric (8)
,'' VJDOC -- Document (Voucher Invoice etc.) [Generic Edit] Numeric (8)
,'' VJDCT -- Document Type [UDC (00 DT)] String (2)
,'' VJKCO -- Document Company [Generic Edit] String (5)
,'' VJSFX -- Document Pay Item [Generic Edit] String (3)
,'' VJAN8 -- Address Number [Generic Edit] Numeric (8)
,'' VJDGJ -- Date - For G/L (and Voucher) - Julian [Generic Edit] Date (6)
,'' VJDIVJ -- Date - Invoice - Julian [Generic Edit] Date (6)
,'' VJICUT -- Batch Type [UDC (98 IT)] String (2)
,'' VJICU -- Batch Number [Generic Edit] Numeric (8)
,'' VJDICJ -- Date - Batch (Julian) [Generic Edit] Date (6)
,'' VJFY -- Fiscal Year [Generic Edit] Numeric (2)
,'' VJCTRY -- Century [Generic Edit] Numeric (2)
,'' VJPN -- Period Number - General Ledger [Generic Edit] Numeric (2)
,'' VJCO -- Company [Generic Edit] String (5)
,'' VJGLC -- G/L Offset [Generic Edit] String (4)
,'' VJAID -- Account ID [Generic Edit] String (8)
,'' VJPA8 -- Address Number - Parent [Generic Edit] Numeric (8)
,'' VJAN8J -- Address Number - Alternate Payee [Generic Edit] Numeric (8)
,'' VJPYR -- Payor Address Number [Generic Edit] Numeric (8)
,'' VJPOST -- G/L Posted Code [Generic Edit] Character (1)
,'' VJISTR -- A/R Post Status [Generic Edit] Character (1)
,'' VJBALJ -- Balanced - Journal Entries [UDC (H00 BB)] Character (1)
,'' VJPST -- Pay Status Code [UDC (00 PS)] Character (1)
,'' VJAG -- Amount - Gross [Generic Edit] Numeric (15)
,'' VJAAP -- Amount Open [Generic Edit] Numeric (15)
,'' VJADSC -- Discount Available [Generic Edit] Numeric (15)
,'' VJADSA -- Discount Taken [Generic Edit] Numeric (15)
,'' VJATXA -- Amount - Taxable [Generic Edit] Numeric (15)
,'' VJATXN -- Amount - Non-Taxable [Generic Edit] Numeric (15)
,'' VJSTAM -- Amount - Tax [Generic Edit] Numeric (15)
,'' VJCRRM -- Currency Mode-Foreign or Domestic Entry [UDC (H00 CY)] Character (1)
,'' VJCRCD -- Currency Code - From [Generic Edit] String (3)
,'' VJCRR -- Currency Conversion Rate - Spot Rate [Generic Edit] Numeric (15)
,'' VJDMCD -- Domestic Entry w/Mult Currency Distr [Generic Edit] Character (1)
,'' VJACR -- Amount - Currency [Generic Edit] Numeric (15)
,'' VJFAP -- Amount - Foreign Open [Generic Edit] Numeric (15)
,'' VJCDS -- Amount - Foreign Discount Available [Generic Edit] Numeric (15)
,'' VJCDSA -- Amount - Foreign Discount Taken [Generic Edit] Numeric (15)
,'' VJCTXA -- Amount - Foreign Taxable [Generic Edit] Numeric (15)
,'' VJCTXN -- Amount - Foreign Non-Taxable [Generic Edit] Numeric (15)
,'' VJCTAM -- Amount - Foreign Tax [Generic Edit] Numeric (15)
,'' VJTXA1 -- Tax Rate/Area [Generic Edit] String (10)
,'' VJEXR1 -- Tax Expl Code 1 [UDC (00 EX)] String (2)
,'' VJDSVJ -- Date - Service/Tax [Generic Edit] Date (6)
,'' VJGLBA -- G/L Bank Account [Generic Edit] String (8)
,'' VJAM -- Account Mode - G/L [UDC (H09 AM)] Character (1)
,'' VJAID2 -- Account ID [Generic Edit] String (8)
,'' VJAM2 -- Account Mode - G/L [UDC (H09 AM)] Character (1)
,'' VJMCU -- Business Unit [Generic Edit] String (12)
,'' VJOBJ -- Object Account [Generic Edit] String (6)
,'' VJSUB -- Subsidiary [Generic Edit] String (8)
,'' VJSBLT -- Subledger Type [UDC (00 ST)] Character (1)
,'' VJSBL -- Subledger - G/L [Generic Edit] String (8)
,'' VJPTC -- Payment Terms Code [Generic Edit] String (3)
,'' VJDDJ -- Date - Net Due [Generic Edit] Date (6)
,'' VJDDNJ -- Date - Discount Due - Julian [Generic Edit] Date (6)
,'' VJRDDJ -- Date of Last Sent Reminder [Generic Edit] Date (6)
,'' VJRDSJ -- Date - Reminder Stop Until Date [Generic Edit] Date (6)
,'' VJSMTJ -- Date - Statement [Generic Edit] Date (6)
,'' VJNBRR -- Reminders - Number of Reminders to Send [UDC (H00 NB)] Character (1)
,'' VJRDRL -- Level of Last Sent Reminder [UDC] Character (1)
,'' VJRMDS -- Number of Sent Reminders - Total [Generic Edit] Numeric (3)
,'' VJCOLL -- Collection Report (Y/N) [UDC (H00 CO)] Character (1)
,'' VJCORC -- Collection Reason Code [UDC (03B CL)] String (2)
,'' VJAFC -- Apply Finance Charges - Y/N [UDC (H00 AF)] Character (1)
,'' VJRSCO -- Write-Off Reason Code [UDC (03B RC)] String (2)
,'' VJCKNU -- Receipt Number [Generic Edit] String (25)
,'' VJODOC -- Document - Original [Generic Edit] Numeric (8)
,'' VJODCT -- Document Type - Original [UDC (00 DT)] String (2)
,'' VJOKCO -- Document Company (Original Order) [Generic Edit] String (5)
,'' VJOSFX -- Document Pay Item - Original [Generic Edit] String (3)
,'' VJVINV -- Supplier Invoice Number [Generic Edit] String (25)
,'' VJPO -- Purchase Order [Generic Edit] String (8)
,'' VJPDCT -- Document Type - Purchase Order [UDC (00 DT)] String (2)
,'' VJPKCO -- Document Company (Purchase Order) [Generic Edit] String (5)
,'' VJDCTO -- Order Type [UDC (00 DT)] String (2)
,'' VJLNID -- Line Number [Generic Edit] Numeric (6)
,'' VJSDOC -- Sales Document Number [Generic Edit] Numeric (8)
,'' VJSDCT -- Sales Document Type [UDC (00 DT)] String (2)
,'' VJSKCO -- Document Company (Sales Order) [Generic Edit] String (5)
,'' VJSFXO -- Order Suffix [Generic Edit] String (3)
,'' VJVLDT -- Date - Cleared/Value [Generic Edit] Date (6)
,'' VJCMC1 -- Commission Code 1 [Generic Edit] Numeric (8)
,'' VJVR01 -- Reference [Generic Edit] String (25)
,'' VJUNIT -- Unit [Generic Edit] String (8)
,'' VJMCU2 -- Business Unit 2 [Generic Edit] String (12)
,'' VJRMK -- Name - Remark [Generic Edit] String (30)
,'' VJALPH -- Name - Alpha [Generic Edit] String (40)
,'' VJRF -- Frequency - Recurring [UDC (H00 RF)] String (2)
,'' VJDRF -- Recurring Frequency # of Payments [Generic Edit] Numeric (3)
,'' VJCTL -- Control/Statement Field [Generic Edit] String (13)
,'' VJFNLP -- Closed Item - As Of Processing [Generic Edit] Character (1)
,'' VJITM -- Item Number - Short [Generic Edit] Numeric (8)
,'' VJU -- Units [Generic Edit] Numeric (15)
,'' VJUM -- Unit of Measure [UDC (00 UM)] String (2)
,'' VJALT6 -- G/L Posting Code - Cash Basis Acct [Generic Edit] Character (1)
,'' VJRYIN -- Payment Instrument [UDC (00 PY)] Character (1)
,'' VJVDGJ -- Void Date - For G/L - Julian [Generic Edit] Date (6)
,'' VJVRE -- Void Reason Code [UDC (03B VR)] String (3)
,'' VJRP1 -- A/R - A/P - Miscellaneous Code 1 [Generic Edit] Character (1)
,'' VJRP2 -- A/R - A/P - Miscellaneous Code 2 [Generic Edit] Character (1)
,'' VJRP3 -- A/R - A/P - Cash Rcpts/Inv Reg Code [Generic Edit] Character (1)
,'' VJAR01 -- A/R Reporting Code 1 [UDC (01 01)] String (3)
,'' VJAR02 -- A/R Reporting Code 2 [UDC (01 02)] String (3)
,'' VJAR03 -- A/R Reporting Code 3 [UDC (01 03)] String (3)
,'' VJAR04 -- A/R Reporting Code 4 [UDC (01 04)] String (3)
,'' VJAR05 -- A/R Reporting Code 5 [UDC (01 05)] String (3)
,'' VJAR06 -- A/R Reporting Code 6 [UDC (01 06)] String (3)
,'' VJAR07 -- A/R Reporting Code 7 [UDC (01 07)] String (3)
,'' VJAR08 -- A/R Reporting Code 8 [UDC (01 08)] String (3)
,'' VJAR09 -- A/R Reporting Code 9 [UDC (01 09)] String (3)
,'' VJAR10 -- A/R Reporting Code 10 [UDC (01 10)] String (3)
,'' VJURC1 -- User Reserved Code [Generic Edit] String (3)
,'' VJURDT -- User Reserved Date [Generic Edit] Date (6)
,'' VJURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,'' VJURAB -- User Reserved Number [Generic Edit] Numeric (8)
,'' VJURRF -- User Reserved Reference [Generic Edit] String (15)
,'' VJTORG -- Transaction Originator [Generic Edit] String (10)
,'' VJUSER -- User ID [Generic Edit] String (10)
,'' VJPID -- Program ID [Generic Edit] String (10)
,'' VJUPMJ -- Date - Updated [Generic Edit] Date (6)
,'' VJUPMT -- Time - Last Updated [Generic Edit] Numeric (6)
,'' VJJOBN -- Work Station ID [Generic Edit] String (10)
,'' VJHCRR -- Historical Currency Conversion Rate [Generic Edit] Numeric (15)
,'' VJHDGJ -- Historical Date - Julian [Generic Edit] Date (6)
,'' VJDIM -- Date - Invoice - MO [Generic Edit] Numeric (2)
,'' VJDID -- Date - Invoice - DA [Generic Edit] Numeric (2)
,'' VJDIY -- Date - Invoice - YR [Generic Edit] Numeric (2)
,'' VJDI# -- Date - Invoice - CTRY [Generic Edit] Numeric (2)
,'' VJDGM -- Date - For G/L (and Voucher) - MO [Generic Edit] Numeric (2)
,'' VJDGD -- Date - For G/L (and Voucher) - DA [Generic Edit] Numeric (2)
,'' VJDGY -- Date - For G/L (and Voucher) - YR [Generic Edit] Numeric (2)
,'' VJDG# -- Date - For G/L (and Voucher) - CTRY [Generic Edit] Numeric (2)
,'' VJDICM -- Date - Batch - MO [Generic Edit] Numeric (2)
,'' VJDICD -- Date - Batch - DA [Generic Edit] Numeric (2)
,'' VJDICY -- Date - Batch - YR [Generic Edit] Numeric (2)
,'' VJDIC# -- Date - Batch - CTRY [Generic Edit] Numeric (2)
,'' VJDSVM -- Date - Service/Tax - MO [Generic Edit] Numeric (2)
,'' VJDSVD -- Date - Service/Tax - DA [Generic Edit] Numeric (2)
,'' VJDSVY -- Date - Service/Tax - YR [Generic Edit] Numeric (2)
,'' VJDSV# -- Date - Service/Tax - CTRY [Generic Edit] Numeric (2)
,'' VJDDM -- Date - Net Due - MO [Generic Edit] Numeric (2)
,'' VJDDD -- Date - Net Due - DA [Generic Edit] Numeric (2)
,'' VJDDY -- Date - Net Due - YR [Generic Edit] Numeric (2)
,'' VJDD# -- Date - Net Due - CTRY [Generic Edit] Numeric (2)
,'' VJDDNM -- Date - Discount Due - MO [Generic Edit] Numeric (2)
,'' VJDDND -- Date - Discount Due -DA [Generic Edit] Numeric (2)
,'' VJDDNY -- Date - Discount Due - YR [Generic Edit] Numeric (2)
,'' VJDDN# -- Date - Discount Due - CTRY [Generic Edit] Numeric (2)
,'' VJSMTM -- Date - Statement - MO [Generic Edit] Numeric (2)
,'' VJSMTD -- Date - Statement - DA [Generic Edit] Numeric (2)
,'' VJSMTY -- Date - Statement - YR [Generic Edit] Numeric (2)
,'' VJSMT# -- Date - Statement - CTRY [Generic Edit] Numeric (2)
,'' VJRDDM -- Date of Last Sent Reminder - MO [Generic Edit] Numeric (2)
,'' VJRDDD -- Date of Last Sent Reminder - DA [Generic Edit] Numeric (2)
,'' VJRDDY -- Date of Last Sent Reminder - YR [Generic Edit] Numeric (2)
,'' VJRDD# -- Date of Last Sent Reminder - CTRY [Generic Edit] Numeric (2)
,'' VJRDSM -- Date - Reminder Stop Until Date - MO [Generic Edit] Numeric (2)
,'' VJRDSD -- Date - Reminder Stop Until Date - DA [Generic Edit] Numeric (2)
,'' VJRDSY -- Date - Reminder Stop Until Date - YR [Generic Edit] Numeric (2)
,'' VJRDS# -- Date - Reminder Stop Until Date - CTRY [Generic Edit] Numeric (2)
,'' VJHDGM -- Historical Date - MO [Generic Edit] Numeric (2)
,'' VJHDGD -- Historical Date - DA [Generic Edit] Numeric (2)
,'' VJHDGY -- Historical Date - YR [Generic Edit] Numeric (2)
,'' VJHDG# -- Historical Date - CTRY [Generic Edit] Numeric (2)
,'' VJSHPN -- Shipment Number [Generic Edit] Numeric (8)
,'' VJDTXS -- Deferred Tax Status - VAT [Generic Edit] Character (1)
,'' VJOMOD -- Originating System [UDC (03B OS)] Character (1)
,'' VJCLMG -- Collection Manager [UDC (01 CM)] String (10)
,'' VJCMGR -- Credit Manager [UDC (01 CR)] String (10)
,'' VJATAD -- Amount - To Distribute [Generic Edit] Numeric (15)
,'' VJCTAD -- Amount - Currency To Distribute [Generic Edit] Numeric (15)
,'' VJNRTA -- Non-Recoverable Tax Amount [Generic Edit] Numeric (15)
,'' VJFNRT -- Foreign Non-Recoverable Tax [Generic Edit] Numeric (15)
,'' VJPRGF -- Purge Flag [Generic Edit] Character (1)
,'' VJGFL1 -- Generic Flag 1 [Generic Edit] Character (1)
,'' VJGFL2 -- Generic Flag 2 [Generic Edit] Character (1)
,'' VJDOCO -- Document (Order No Invoice etc.) [Generic Edit] Numeric (8)
,'' VJKCOO -- Order Company (Order Number) [Generic Edit] String (5)
,'' VJSOTF -- Sales Order Tax Flag [Generic Edit] Character (1)
,'' VJDTPB -- Notification Payment Date [Generic Edit] Date (6)
,'' VJERDJ -- Date - For Exchange Rate - Julian [Generic Edit] Date (6)
,'' VJNETST -- Netting Status Code [UDC (00 NS)] Character (1)
,'' VJRMR1 -- Generic AR Receipt Matching Reference1 [Generic Edit] String (50)

FROM
