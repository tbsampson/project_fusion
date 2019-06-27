
/*
    F0911Z1 - GL Transaction
    VER0001 -  Tom Sampson
    BV 
*/



SELECT

 'JDE' VNEDUS -- EDI - User ID [Generic Edit] String (10)
,'' VNEDTY -- Type Record [UDC (00 RD)] Character (1)
,'' VNEDSQ -- Record Sequence [Generic Edit] Numeric (2)
,'' VNEDTN -- EDI - Transaction Number [Generic Edit] String (22)
,'' VNEDCT -- EDI - Document Type [Generic Edit] String (2)
,'' VNEDLN -- EDI - Line Number [Generic Edit] Numeric (7)
,'' VNEDTS -- EDI - Transaction Set Number [Generic Edit] String (6)
,'' VNEDFT -- EDI - Translation Format [Generic Edit] String (10)
,'' VNEDDT -- EDI - Transmission Date [Generic Edit] Date (6)
,'' VNEDER -- EDI - Send/Receive Indicator [UDC (H00 ED)] Character (1)
,'' VNEDDL -- EDI - Detail Lines Processed [Generic Edit] Numeric (5)
,'' VNEDSP -- EDI - Successfully Processed [Generic Edit] Character (1)
,'' VNEDTC -- EDI - Transaction Action [Generic Edit] Character (1)
,'' VNEDTR -- EDI - Transaction Type [Generic Edit] Character (1)
,'' VNEDBT -- EDI - Batch Number [Generic Edit] String (15)
,'' VNEDGL -- Batch File Create G/L Record [Generic Edit] Character (1)
,'' VNEDAN -- User Address Number [Generic Edit] Numeric (8)
,'' VNKCO -- Document Company [Generic Edit] String (5)
,'' VNDCT -- Document Type [UDC (00 DT)] String (2)
,'' VNDOC -- Document (Voucher Invoice etc.) [Generic Edit] Numeric (8)
,'' VNDGJ -- Date - For G/L (and Voucher) - Julian [Generic Edit] Date (6)
,'' VNJELN -- Journal Entry Line Number [Generic Edit] Numeric (7)
,'' VNEXTL -- Line Extension Code [Generic Edit] String (2)
,'' VNPOST -- G/L Posted Code [Generic Edit] Character (1)
,'' VNICU -- Batch Number [Generic Edit] Numeric (8)
,'' VNICUT -- Batch Type [UDC (98 IT)] String (2)
,'' VNDICJ -- Date - Batch (Julian) [Generic Edit] Date (6)
,'' VNDSYJ -- Date - Batch System Date [Generic Edit] Date (6)
,'' VNTICU -- Batch Time [Generic Edit] Numeric (6)
,'' VNCO -- Company [Generic Edit] String (5)
,'' VNANI -- Account Number - Input (Mode Unknown) [Generic Edit] String (29)
,'' VNAM -- Account Mode - G/L [UDC (H09 AM)] Character (1)
,'' VNAID -- Account ID [Generic Edit] String (8)
,'' VNMCU -- Business Unit [Generic Edit] String (12)
,'' VNOBJ -- Object Account [Generic Edit] String (6)
,'' VNSUB -- Subsidiary [Generic Edit] String (8)
,'' VNSBL -- Subledger - G/L [Generic Edit] String (8)
,'' VNSBLT -- Subledger Type [UDC (00 ST)] Character (1)
,'' VNLT -- Ledger Types [UDC (09 LT)] String (2)
,'' VNPN -- Period Number - General Ledger [Generic Edit] Numeric (2)
,'' VNCTRY -- Century [Generic Edit] Numeric (2)
,'' VNFY -- Fiscal Year [Generic Edit] Numeric (2)
,'' VNFQ -- Fiscal Quarter (Obsolete) [UDC (H09 FQ)] String (4)
,'' VNCRCD -- Currency Code - From [Generic Edit] String (3)
,'' VNCRR -- Currency Conversion Rate - Spot Rate [Generic Edit] Numeric (15)
,'' VNHCRR -- Historical Currency Conversion Rate [Generic Edit] Numeric (15)
,'' VNHDGJ -- Historical Date - Julian [Generic Edit] Date (6)
,'' VNAA -- Amount [Generic Edit] Numeric (15)
,'' VNU -- Units [Generic Edit] Numeric (15)
,'' VNUM -- Unit of Measure [UDC (00 UM)] String (2)
,'' VNGLC -- G/L Offset [Generic Edit] String (4)
,'' VNRE -- Reverse or Void (R/V) [UDC (H09 RE)] Character (1)
,'' VNEXA -- Name - Alpha Explanation [Generic Edit] String (30)
,'' VNEXR -- Name - Remark Explanation [Generic Edit] String (30)
,'' VNR1 -- Reference 1 - JE Voucher Invoice etc. [Generic Edit] String (8)
,'' VNR2 -- Reference 2 [Generic Edit] String (8)
,'' VNR3 -- Reference 3 - Account Reconciliation [Generic Edit] String (8)
,'' VNSFX -- Document Pay Item [Generic Edit] String (3)
,'' VNODOC -- Document - Original [Generic Edit] Numeric (8)
,'' VNODCT -- Document Type - Original [UDC (00 DT)] String (2)
,'' VNOSFX -- Document Pay Item - Original [Generic Edit] String (3)
,'' VNPKCO -- Document Company (Purchase Order) [Generic Edit] String (5)
,'' VNOKCO -- Document Company (Original Order) [Generic Edit] String (5)
,'' VNPDCT -- Document Type - Purchase Order [UDC (00 DT)] String (2)
,'' VNAN8 -- Address Number [Generic Edit] Numeric (8)
,'' VNCN -- Payment Number [Generic Edit] String (8)
,'' VNDKJ -- Date - Check - Julian [Generic Edit] Date (6)
,'' VNDKC -- Date - Check Cleared [Generic Edit] Date (6)
,'' VNASID -- Serial Number [Generic Edit] String (25)
,'' VNBRE -- Batch Rear End Posted Code [UDC (09 BR)] Character (1)
,'' VNRCND -- Reconciled Code [UDC (09 RC)] Character (1)
,'' VNSUMM -- Summarized Code [Generic Edit] Character (1)
,'' VNPRGE -- Purge Code [Generic Edit] Character (1)
,'' VNTNN -- Flag for 1099 [Generic Edit] Character (1)
,'' VNALT1 -- G/L Posting Code - Alternate 1 [Generic Edit] Character (1)
,'' VNALT2 -- G/L Posting Code - Alternate 2 [Generic Edit] Character (1)
,'' VNALT3 -- G/L Posting Code - Alternate 3 [Generic Edit] Character (1)
,'' VNALT4 -- G/L Posting Code - Alternate 4 [Generic Edit] Character (1)
,'' VNALT5 -- G/L Posting Code - Alternate 5 [Generic Edit] Character (1)
,'' VNALT6 -- G/L Posting Code - Cash Basis Acct [Generic Edit] Character (1)
,'' VNALT7 -- Commitment Relief Flag [Generic Edit] Character (1)
,'' VNALT8 -- Billing Control [Generic Edit] Character (1)
,'' VNALT9 -- Currency Update [Generic Edit] Character (1)
,'' VNALT0 -- G/L Posting Code - Alternate 0 [Generic Edit] Character (1)
,'' VNALTT -- G/L Posting Code - Alternate T [Generic Edit] Character (1)
,'' VNALTU -- G/L Posting Code - Alternate U [Generic Edit] Character (1)
,'' VNALTV -- Stocked Inventory Commitment [Generic Edit] Character (1)
,'' VNALTW -- G/L Posting Code - Alternate W [Generic Edit] Character (1)
,'' VNALTX -- Consumption Tax Cross Reference [Generic Edit] Character (1)
,'' VNALTZ -- G/L Posting Code - Account Debit Balance [Generic Edit] Character (1)
,'' VNDLNA -- Delete Not Allowed [Generic Edit] Character (1)
,'' VNCFF1 -- Client Free Form - Alternate 1 [Generic Edit] Character (1)
,'' VNCFF2 -- Client Free Form - Alternate 2 [Generic Edit] Character (1)
,'' VNASM -- Lease Cost Ledger Posted Code [Generic Edit] Character (1)
,'' VNBC -- Bill Code [UDC (98 BC)] Character (1)
,'' VNVINV -- Supplier Invoice Number [Generic Edit] String (25)
,'' VNIVD -- Date - Invoice [Generic Edit] Date (6)
,'' VNWR01 -- Categories - Work Order 01 [UDC (00 W1)] String (4)
,'' VNPO -- Purchase Order [Generic Edit] String (8)
,'' VNPSFX -- Purchase Order Suffix [Generic Edit] String (3)
,'' VNDCTO -- Order Type [UDC (00 DT)] String (2)
,'' VNLNID -- Line Number [Generic Edit] Numeric (6)
,'' VNWY -- Fiscal Year - Weekly [Generic Edit] Numeric (2)
,'' VNWN -- Fiscal Period - Weekly [Generic Edit] Numeric (2)
,'' VNFNLP -- Closed Item - As Of Processing [Generic Edit] Character (1)
,'' VNOPSQ -- Sequence Number - Operations [Generic Edit] Numeric (5)
,'' VNJBCD -- Job Type (Craft) Code [UDC (06 G)] String (6)
,'' VNJBST -- Job Step [UDC (06 GS)] String (4)
,'' VNHMCU -- Business Unit - Home [Generic Edit] String (12)
,'' VNDOI -- DOI Sub [Generic Edit] Numeric (2)
,'' VNALID -- Outsider Lease or Well ID [Generic Edit] String (25)
,'' VNALTY -- ID Type [UDC (00 AL)] String (2)
,'' VNDSVJ -- Date - Service/Tax [Generic Edit] Date (6)
,'' VNTORG -- Transaction Originator [Generic Edit] String (10)
,'' VNREG# -- Registration Number [Generic Edit] Numeric (8)
,'' VNPYID -- Payment ID (Internal) [Generic Edit] Numeric (15)
,'' VNUSER -- User ID [Generic Edit] String (10)
,'' VNPID -- Program ID [Generic Edit] String (10)
,'' VNJOBN -- Work Station ID [Generic Edit] String (10)
,'' VNUPMJ -- Date - Updated [Generic Edit] Date (6)
,'' VNUPMT -- Time - Last Updated [Generic Edit] Numeric (6)
,'' VNCRRM -- Currency Mode-Foreign or Domestic Entry [UDC (H00 CY)] Character (1)
,'' VNACR -- Amount - Currency [Generic Edit] Numeric (15)
,'' VNDGM -- Date - For G/L (and Voucher) - MO [Generic Edit] Numeric (2)
,'' VNDGD -- Date - For G/L (and Voucher) - DA [Generic Edit] Numeric (2)
,'' VNDGY -- Date - For G/L (and Voucher) - YR [Generic Edit] Numeric (2)
,'' VNDG# -- Date - For G/L (and Voucher) - CTRY [Generic Edit] Numeric (2)
,'' VNDICM -- Date - Batch - MO [Generic Edit] Numeric (2)
,'' VNDICD -- Date - Batch - DA [Generic Edit] Numeric (2)
,'' VNDICY -- Date - Batch - YR [Generic Edit] Numeric (2)
,'' VNDIC# -- Date - Batch - CTRY [Generic Edit] Numeric (2)
,'' VNDSYM -- Date - Batch System Date - MO [Generic Edit] Numeric (2)
,'' VNDSYD -- Date - Batch System Date - DA [Generic Edit] Numeric (2)
,'' VNDSYY -- Date - Batch System Date - YR [Generic Edit] Numeric (2)
,'' VNDSY# -- Date - Batch System Date - CTRY [Generic Edit] Numeric (2)
,'' VNDKM -- Date - Check - MO [Generic Edit] Numeric (2)
,'' VNDKD -- Date - Check - DA [Generic Edit] Numeric (2)
,'' VNDKY -- Date - Check - YR [Generic Edit] Numeric (2)
,'' VNDK# -- Date - Check - CTRY [Generic Edit] Numeric (2)
,'' VNDSVM -- Date - Service/Tax - MO [Generic Edit] Numeric (2)
,'' VNDSVD -- Date - Service/Tax - DA [Generic Edit] Numeric (2)
,'' VNDSVY -- Date - Service/Tax - YR [Generic Edit] Numeric (2)
,'' VNDSV# -- Date - Service/Tax - CTRY [Generic Edit] Numeric (2)
,'' VNHDGM -- Historical Date - MO [Generic Edit] Numeric (2)
,'' VNHDGD -- Historical Date - DA [Generic Edit] Numeric (2)
,'' VNHDGY -- Historical Date - YR [Generic Edit] Numeric (2)
,'' VNHDG# -- Historical Date - CTRY [Generic Edit] Numeric (2)
,'' VNDKCM -- Date - Check Cleared - MO [Generic Edit] Numeric (2)
,'' VNDKCD -- Date - Check Cleared - DA [Generic Edit] Numeric (2)
,'' VNDKCY -- Date - Check Cleared - YR [Generic Edit] Numeric (2)
,'' VNDKC# -- Date - Check Cleared - CTRY [Generic Edit] Numeric (2)
,'' VNIVDM -- Date - Invoice - MO [Generic Edit] Numeric (2)
,'' VNIVDD -- Date - Invoice - DA [Generic Edit] Numeric (2)
,'' VNIVDY -- Date - Invoice - YR [Generic Edit] Numeric (2)
,'' VNIVD# -- Date - Invoice - CTRY [Generic Edit] Numeric (2)
,'' VNABR1 -- Managerial Analysis Code 1 [Generic Edit] String (12)
,'' VNABR2 -- Managerial Analysis Code 2 [Generic Edit] String (12)
,'' VNABR3 -- Managerial Analysis Code 3 [Generic Edit] String (12)
,'' VNABR4 -- Managerial Analysis Code 4 [Generic Edit] String (12)
,'' VNABT1 -- Managerial Analysis Type 1 [UDC] Character (1)
,'' VNABT2 -- Managerial Analysis Type 2 [UDC] Character (1)
,'' VNABT3 -- Managerial Analysis Type 3 [UDC] Character (1)
,'' VNABT4 -- Managerial Analysis Type 4 [UDC] Character (1)
,'' VNITM -- Item Number - Short [Generic Edit] Numeric (8)
,'' VNPM01 -- Posting Code 1 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM02 -- Posting Code 2 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM03 -- Posting Code 3 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM04 -- Posting Code 4 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM05 -- Posting Code 5 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM06 -- Posting Code 6 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM07 -- Posting Code 7 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM08 -- Posting Code 8 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM09 -- Posting Code 9 - Managerial Accounting . [Generic Edit] Character (1)
,'' VNPM10 -- Posting Code 10- Managerial Accounting . [Generic Edit] Character (1)
,'' VNBCRC -- Currency Code - Base [Generic Edit] String (3)
,'' VNEXR1 -- Tax Expl Code 1 [UDC (00 EX)] String (2)
,'' VNTXA1 -- Tax Rate/Area [Generic Edit] String (10)
,'' VNTXITM -- Tax - Short Item Number [Generic Edit] Numeric (8)
,'' VNACTB -- Activity-Based Costing Activity Code [Generic Edit] String (10)
,'' VNSTAM -- Amount - Tax [Generic Edit] Numeric (15)
,'' VNCTAM -- Amount - Foreign Tax [Generic Edit] Numeric (15)
,'' VNAG -- Amount - Gross [Generic Edit] Numeric (15)
,'' VNAGF -- Amount - Foreign Gross [Generic Edit] Numeric (15)
,'' VNTKTX -- Track Taxes Flag [Generic Edit] Character (1)
,'' VNDLNID -- DistributionLine Number [Generic Edit] Numeric (6)
,'' VNCKNU -- Receipt Number [Generic Edit] String (25)
,'' VNBUPC -- Burdening Posted Code [Generic Edit] Character (1)
,'' VNAHBU -- Alternate Home Business Unit [Generic Edit] String (12)
,'' VNEPGC -- Employee Pool Grouping Code [UDC (00 12)] String (3)
,'' VNJPGC -- Job Pool Grouping Code [UDC (00 12)] String (3)
,'' VNRC5 -- File Line Identifier 5.0 [Generic Edit] Numeric (5)
,'' VNSFXE -- Pay Item Extension Number [Generic Edit] Numeric (2)
,'' VNOFM -- Auto Offset Method (S Y or B) [Generic Edit] Character (1)

FROM