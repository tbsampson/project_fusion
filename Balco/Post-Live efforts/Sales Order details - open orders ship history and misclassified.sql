
/*
    F42119 - Sales Order Detail History
    IR 20190528 Tom Sampson
    Special detail for open orders with shipped history
*/
use BALCO;
SELECT

 '00020'   SDKCOO -- Order Company (Order Number) [Generic Edit] String (5)
,CASE

	WHEN CUSTOMER_ORDER.ID = 'SO047929' THEN 7065
	WHEN CUSTOMER_ORDER.ID = 'SO053481' THEN 6262
	WHEN CUSTOMER_ORDER.ID = 'SO054488' THEN 6298
	WHEN CUSTOMER_ORDER.ID = 'SO054613' THEN 6309
	WHEN CUSTOMER_ORDER.ID = 'SO054891' THEN 6414
	WHEN CUSTOMER_ORDER.ID = 'SO060310' THEN 1795
	WHEN CUSTOMER_ORDER.ID = 'SO060511' THEN 6366
	WHEN CUSTOMER_ORDER.ID = 'SO060799' THEN 2303
	WHEN CUSTOMER_ORDER.ID = 'SO060815' THEN 6708
	WHEN CUSTOMER_ORDER.ID = 'SO060860' THEN 6709
	WHEN CUSTOMER_ORDER.ID = 'SO060875' THEN 2379
	WHEN CUSTOMER_ORDER.ID = 'SO060974' THEN 7053
	WHEN CUSTOMER_ORDER.ID = 'SO061207' THEN 7054
	WHEN CUSTOMER_ORDER.ID = 'SO061361' THEN 6338
	WHEN CUSTOMER_ORDER.ID = 'SO061412' THEN 7040
	WHEN CUSTOMER_ORDER.ID = 'SO061601' THEN 6390
	WHEN CUSTOMER_ORDER.ID = 'SO061608' THEN 6725
	WHEN CUSTOMER_ORDER.ID = 'SO061610' THEN 6726
	WHEN CUSTOMER_ORDER.ID = 'SO061640' THEN 6727
	WHEN CUSTOMER_ORDER.ID = 'SO061652' THEN 6729
	WHEN CUSTOMER_ORDER.ID = 'SO061657' THEN 6730
	WHEN CUSTOMER_ORDER.ID = 'SO062082' THEN 7047
	WHEN CUSTOMER_ORDER.ID = 'SO062223' THEN 6749
	WHEN CUSTOMER_ORDER.ID = 'SO062265' THEN 6972
	WHEN CUSTOMER_ORDER.ID = 'SO062298' THEN 6752
	WHEN CUSTOMER_ORDER.ID = 'SO062322' THEN 6315
	WHEN CUSTOMER_ORDER.ID = 'SO062432' THEN 7050
	WHEN CUSTOMER_ORDER.ID = 'SO062494' THEN 7007
	WHEN CUSTOMER_ORDER.ID = 'SO062527' THEN 6764
	WHEN CUSTOMER_ORDER.ID = 'SO062530' THEN 6765
	WHEN CUSTOMER_ORDER.ID = 'SO062588' THEN 6268
	WHEN CUSTOMER_ORDER.ID = 'SO062597' THEN 6767
	WHEN CUSTOMER_ORDER.ID = 'SO062688' THEN 6323
	WHEN CUSTOMER_ORDER.ID = 'SO062736' THEN 6768
	WHEN CUSTOMER_ORDER.ID = 'SO062740' THEN 6769
	WHEN CUSTOMER_ORDER.ID = 'SO062752' THEN 6355
	WHEN CUSTOMER_ORDER.ID = 'SO062795' THEN 6770
	WHEN CUSTOMER_ORDER.ID = 'SO062796' THEN 6367
	WHEN CUSTOMER_ORDER.ID = 'SO062804' THEN 6378
	WHEN CUSTOMER_ORDER.ID = 'SO062812' THEN 6771
	WHEN CUSTOMER_ORDER.ID = 'SO062814' THEN 6772
	WHEN CUSTOMER_ORDER.ID = 'SO062830' THEN 6349
	WHEN CUSTOMER_ORDER.ID = 'SO062904' THEN 6992
	WHEN CUSTOMER_ORDER.ID = 'SO062971' THEN 7056
	WHEN CUSTOMER_ORDER.ID = 'SO062993' THEN 6784
	WHEN CUSTOMER_ORDER.ID = 'SO063015' THEN 6791
	WHEN CUSTOMER_ORDER.ID = 'SO063190' THEN 6329
	WHEN CUSTOMER_ORDER.ID = 'SO063229' THEN 7035
	WHEN CUSTOMER_ORDER.ID = 'SO063277' THEN 6334
	WHEN CUSTOMER_ORDER.ID = 'SO063286' THEN 6813
	WHEN CUSTOMER_ORDER.ID = 'SO063294' THEN 6266
	WHEN CUSTOMER_ORDER.ID = 'SO063295' THEN 6312
	WHEN CUSTOMER_ORDER.ID = 'SO063369' THEN 6357
	WHEN CUSTOMER_ORDER.ID = 'SO063379' THEN 6815
	WHEN CUSTOMER_ORDER.ID = 'SO063394' THEN 6816
	WHEN CUSTOMER_ORDER.ID = 'SO063436' THEN 6397
	WHEN CUSTOMER_ORDER.ID = 'SO063536' THEN 6384
	WHEN CUSTOMER_ORDER.ID = 'SO063562' THEN 7043
	WHEN CUSTOMER_ORDER.ID = 'SO063566' THEN 6829
	WHEN CUSTOMER_ORDER.ID = 'SO063611' THEN 7052
	WHEN CUSTOMER_ORDER.ID = 'SO063624' THEN 6990
	WHEN CUSTOMER_ORDER.ID = 'SO063710' THEN 6840
	WHEN CUSTOMER_ORDER.ID = 'SO063737' THEN 6306
	WHEN CUSTOMER_ORDER.ID = 'SO063757' THEN 6850
	WHEN CUSTOMER_ORDER.ID = 'SO063768' THEN 6337
	WHEN CUSTOMER_ORDER.ID = 'SO063810' THEN 6285
	WHEN CUSTOMER_ORDER.ID = 'SO063852' THEN 6304
	WHEN CUSTOMER_ORDER.ID = 'SO063879' THEN 6316
	WHEN CUSTOMER_ORDER.ID = 'SO063922' THEN 6356
	WHEN CUSTOMER_ORDER.ID = 'SO063955' THEN 6862
	WHEN CUSTOMER_ORDER.ID = 'SO063968' THEN 6377
	WHEN CUSTOMER_ORDER.ID = 'SO063972' THEN 6317
	WHEN CUSTOMER_ORDER.ID = 'SO063984' THEN 6383
	WHEN CUSTOMER_ORDER.ID = 'SO064035' THEN 6351
	WHEN CUSTOMER_ORDER.ID = 'SO064104' THEN 6876
	WHEN CUSTOMER_ORDER.ID = 'SO064171' THEN 6889
	WHEN CUSTOMER_ORDER.ID = 'SO064177' THEN 6891
	WHEN CUSTOMER_ORDER.ID = 'SO064277' THEN 6294
	WHEN CUSTOMER_ORDER.ID = 'SO064363' THEN 6332
	WHEN CUSTOMER_ORDER.ID = 'SO064367' THEN 6407
	WHEN CUSTOMER_ORDER.ID = 'SO064368' THEN 6409

END		SDDOCO -- Document (Order No Invoice etc.) [Generic Edit] Numeric (8)
,'SO'   SDDCTO -- Order Type [UDC (00 DT)] String (2)
,CAST(ROW_NUMBER() OVER (partition by CUSTOMER_ORDER.ROWID order by  CUSTOMER_ORDER.ID ,CAST(CUST_ORDER_LINE.LINE_NO AS INTEGER)	,WORK_ORDER.BASE_ID	,CAST(WORK_ORDER.SUB_ID AS INTEGER)) + 1000 AS BIGINT)
	 SDLNID -- Line Number [Generic Edit] Numeric (6)
,'000'   SDSFXO -- Order Suffix [Generic Edit] String (3)
,'       20001'   SDMCU -- Business Unit [Generic Edit] String (12)
,'00020'   SDCO -- Company [Generic Edit] String (5)
,''   SDOKCO -- Document Company (Original Order) [Generic Edit] String (5)
,''   SDOORN -- Original Order Number [Generic Edit] String (8)
,''   SDOCTO -- Original Order Type [UDC (00 DT)] String (2)
,''   SDOGNO -- Original Line Number [Generic Edit] Numeric (7)
,''   SDRKCO -- Company - Key (Related Order) [Generic Edit] String (5)
,ISNULL(WORK_ORDER.BASE_ID,'') SDRORN -- Related PO/SO/WO Number [Generic Edit] String (8)
,CASE
     WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  
                  IN (210,  217,  220,  230,  310,  320,  340,  350,  380,  
                        410,  420,  470,  500,  610,  710,  720,  730,  745,  750,  780) Then 'WO'  
     WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  
                  IN (240, 390, 450, 460, 740, 755) Then 'OD'
     ELSE ''
END   SDRCTO -- Related PO/SO/WO Order Type [UDC (00 DT)] String (2)
,''   SDRLLN -- Related PO/SO Line Number [Generic Edit] Numeric (7)
,''   SDDMCT -- Agreement Number - Distribution [Generic Edit] String (12)
,''   SDDMCS -- Agreement Supplement - Distribution [Generic Edit] Numeric (3)
,BT.SZAN8   SDAN8 -- Address Number [Generic Edit] Numeric (8)
,ISNULL(ST.SZAN8 ,BT.SZAN8)  SDSHAN -- Address Number - Ship To [Generic Edit] Numeric (8)
,BT.SZPA8   SDPA8 -- Address Number - Parent [Generic Edit] Numeric (8)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.ORDER_DATE),'')   SDDRQJ -- Date - Requested [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.CREATE_DATE),'')   SDTRDJ -- Date - Order/Transaction [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.PRINTED_DATE),'')   SDPDDJ -- Date - Scheduled Pick [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(ISNULL(CUST_ORDER_LINE.PROMISE_DEL_DATE,CUSTOMER_ORDER.PROMISE_DEL_DATE)),'')   SDADDJ -- Date - Actual Ship Date [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(RECEIVABLE.INVOICE_DATE),'')   SDIVD -- Date - Invoice [Generic Edit] Date (6)
,''   SDCNDJ -- Date - Cancel [Generic Edit] Date (6)
,CASE
     WHEN RECEIVABLE.POSTING_DATE IS NOT NULL THEN ISNULL(dbo.JDEJulian(RECEIVABLE.POSTING_DATE),'')
     ELSE ISNULL(dbo.JDEJulian(RECEIVABLE.INVOICE_DATE),'')
 END   SDDGL -- Date - For G/L (and Voucher) [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUST_ORDER_LINE.DESIRED_SHIP_DATE),'')    SDRSDJ -- Date - Promised Delivery [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUSTOMER_ORDER.ORDER_DATE),'')   SDPEFJ -- Date - Price Effective Date [Generic Edit] Date (6)
,ISNULL(dbo.JDEJulian(CUST_ORDER_LINE.DESIRED_SHIP_DATE),'')    SDPPDJ -- Date - Promised Shipment [Generic Edit] Date (6)
,ISNULL(LEFT(LTRIM(RTRIM(CUSTOMER_ORDER.CUSTOMER_PO_REF)),25),'')   SDVR01 -- Reference [Generic Edit] String (25)
,CAST(CUSTOMER_ORDER.ID AS VARCHAR) + '_' + CAST(CUST_ORDER_LINE.LINE_NO AS VARCHAR)   SDVR02 -- Reference 2 [Generic Edit] String (25)
,CASE
    WHEN CUST_ORDER_LINE.PRODUCT_CODE IN ('801 - OKC EXP','904 - ICT FRT','905 - OKC FRT','914 - ICT CRAT','925 - DIST FEE')
        THEN 74398 -- 'FRIEGHT' ******* NOTE: THIS IS NOT THE SAME IN PD! ************
        WHEN CUST_ORDER_LINE.PART_ID IS NULL AND CUST_ORDER_LINE.PRODUCT_CODE NOT IN ('801 - OKC EXP','904 - ICT FRT','905 - OKC FRT','914 - ICT CRAT','925 - DIST FEE')
        THEN 50521
        WHEN CUST_ORDER_LINE.PART_ID IS NOT NULL AND CUST_ORDER_LINE.PRODUCT_CODE NOT IN ('801 - OKC EXP','904 - ICT FRT','905 - OKC FRT','914 - ICT CRAT','925 - DIST FEE')
        THEN ISNULL(ITEM_MASTER_1.SZITM,'50521')
        ELSE 50521
 END  SDITM -- Item Number - Short [Generic Edit] Numeric (8)
,CASE
    WHEN CUST_ORDER_LINE.PRODUCT_CODE IN ('801 - OKC EXP','904 - ICT FRT','905 - OKC FRT','914 - ICT CRAT','925 - DIST FEE')
        THEN 'FREIGHT'
        WHEN CUST_ORDER_LINE.PART_ID IS NULL AND CUST_ORDER_LINE.PRODUCT_CODE NOT IN ('801 - OKC EXP','904 - ICT FRT','905 - OKC FRT','914 - ICT CRAT','925 - DIST FEE')
        THEN 'OTH_EXPS'
        WHEN CUST_ORDER_LINE.PART_ID IS NOT NULL AND CUST_ORDER_LINE.PRODUCT_CODE NOT IN ('801 - OKC EXP','904 - ICT FRT','905 - OKC FRT','914 - ICT CRAT','925 - DIST FEE')
        THEN ISNULL(ITEM_MASTER_1.SZLITM,'OTH_EXPS')
        ELSE 'OTH_EXPS'
 END  SDLITM -- 2nd Item Number [Generic Edit] String (25)
,ISNULL(ITEM_MASTER_1.SZAITM,'')   SDAITM -- 3rd Item Number [Generic Edit] String (25)
,''   SDLOCN -- Location [Generic Edit] String (20)
,''   SDLOTN -- Lot/Serial Number [Generic Edit] String (30)
,''   SDFRGD -- From Grade [UDC (40 LG)] String (3)
,''   SDTHGD -- Thru Grade [UDC (40 LG)] String (3)
,''   SDFRMP -- From Potency [Generic Edit] Numeric (7)
,''   SDTHRP -- Thru Potency [Generic Edit] Numeric (7)
,''   SDEXDP -- Days Before Expiration [Generic Edit] Numeric (5)
,CASE 
    WHEN CUST_ORDER_LINE.PART_ID IS NULL
    THEN ISNULL(LEFT(LTRIM(RTRIM(CUST_ORDER_LINE.CUSTOMER_PART_ID)),30),'')
    ELSE ISNULL(LEFT(LTRIM(RTRIM(ITEM_MASTER_1.SZDSC1)),30),'')
 END  SDDSC1 -- Description [Generic Edit] String (30)
,ISNULL(LEFT(LTRIM(RTRIM(CUST_ORDER_LINE.PRODUCT_CODE)),30),'')   SDDSC2 -- Description - Line 2 [Generic Edit] String (30)
,ISNULL(ITEM_MASTER_1.SZLNTY,'N')  SDLNTY -- Line Type [Generic Edit] String (2)
,'999'   SDNXTR -- Status Code - Next [UDC (40 AT)] String (3)
,'620'   SDLTTR -- Status Code - Last [UDC (40 AT)] String (3)
,'       20001'   SDEMCU -- Business Unit - Header [Generic Edit] String (12)
,''   SDRLIT -- Item Number - Related (Kit) [Generic Edit] String (8)
,''   SDKTLN -- Kit Master Line Number [Generic Edit] Numeric (6)
,''   SDCPNT -- Component Line Number [Generic Edit] Numeric (4)
,''   SDRKIT -- Related Kit Component [Generic Edit] Numeric (8)
,''   SDKTP -- Number of Component Per Parent [Generic Edit] Numeric (15)
,''   SDSRP1 -- Sales Catalog Section [UDC (41 S1)] String (3)
,''   SDSRP2 -- Sub Section [UDC (41 S2)] String (3)
,''   SDSRP3 -- Sales Category Code 3 [UDC (41 S3)] String (3)
,ISNULL(ITEM_MASTER_1.SZPRP4,'')   SDSRP4 -- Sales Category Code 4 [UDC (41 S4)] String (3)
,''   SDSRP5 -- Sales Category Code 5 [UDC (41 S5)] String (3)
,''   SDPRP1 -- Commodity Class [UDC (41 P1)] String (3)
,''   SDPRP2 -- Commodity Sub Class [UDC (41 P2)] String (3)
,''   SDPRP3 -- Supplier Rebate Code [UDC (41 P3)] String (3)
,''   SDPRP4 -- Master Planning Family [UDC (41 P4)] String (3)
,''   SDPRP5 -- Purchasing Category Code 5 [UDC (41 P5)] String (3)
,ISNULL(ITEM_MASTER_1.SZUOM1,'EA')  SDUOM -- Unit of Measure as Input [UDC (00 UM)] String (2)
,CAST((CUST_ORDER_LINE.ORDER_QTY * 10000) AS BIGINT)  SDUORG -- Units - Order/Transaction Quantity [Generic Edit] Numeric (15)
,CAST((CUST_ORDER_LINE.TOTAL_SHIPPED_QTY * 10000) AS BIGINT)  SDSOQS -- Quantity Shipped [Generic Edit] Numeric (15)
,''   SDSOBK -- Units - Qty Backordered/Held [Generic Edit] Numeric (15)
,''   SDSOCN -- Units - Quantity Canceled/Scrapped [Generic Edit] Numeric (15)
,''   SDSONE -- Units - Future Quantity Committed [Generic Edit] Numeric (15)
,''   SDUOPN -- Units - Open [Generic Edit] Numeric (15)
,CAST((CUST_ORDER_LINE.TOTAL_SHIPPED_QTY * 10000) AS BIGINT)   SDQTYT -- Units - Shipped to Date [Generic Edit] Numeric (15)
,''   SDQRLV -- Units - Relieved [Generic Edit] Numeric (15)
,'H'   SDCOMM -- Committed (H/S) [UDC (H42 CP)] Character (1)
,''   SDOTQY -- Other Quantity (1/2) [UDC] Character (1)
,CAST((CUST_ORDER_LINE.UNIT_PRICE * 10000) AS BIGINT)   SDUPRC -- Amount - Price per Unit [Generic Edit] Numeric (15)
,CAST((CUST_ORDER_LINE.TOTAL_AMT_SHIPPED * 100) AS BIGINT)   SDAEXP -- Amount - Extended Price [Generic Edit] Numeric (15)
,''   SDAOPN -- Amount - Open [Generic Edit] Numeric (15)
,'0'   SDPROV -- Price Override Code [Generic Edit] Character (1)
,''   SDTPC -- Temporary Price (Y/N) [Generic Edit] Character (1)
,ISNULL(ITEM_MASTER_1.SZUOM1,'')   SDAPUM -- Unit of Measure - Entered for Unit Price [UDC (00 UM)] String (2)
,CAST((CUST_ORDER_LINE.UNIT_PRICE * 10000) AS BIGINT)   SDLPRC -- Amount - List Price [Generic Edit] Numeric (15)
,ISNULL(CASE
	WHEN WORK_ORDER.ACT_MATERIAL_COST = 0
		OR WORK_ORDER.DESIRED_QTY = 0 
	THEN 0
	WHEN ITEM_MASTER_1.SZSTKT = 'M' THEN CAST(((WORK_ORDER.ACT_MATERIAL_COST/WORK_ORDER.DESIRED_QTY) * 1.7) * 10000 AS BIGINT)
	ELSE CAST((WORK_ORDER.ACT_MATERIAL_COST/WORK_ORDER.DESIRED_QTY) * 10000 AS BIGINT)
 END,'')    SDUNCS -- Amount - Unit Cost [Generic Edit] Numeric (15)
,ISNULL(CASE
	WHEN WORK_ORDER.ACT_MATERIAL_COST = 0
		OR WORK_ORDER.DESIRED_QTY = 0 
	THEN 0
    WHEN ITEM_MASTER_1.SZSTKT = 'M' THEN CAST(((WORK_ORDER.ACT_MATERIAL_COST) * 1.7) * 100 AS BIGINT)
	ELSE CAST((WORK_ORDER.ACT_MATERIAL_COST) * 100 AS BIGINT)
 END,'')   SDECST -- Amount - Extended Cost [Generic Edit] Numeric (15)
,'0'   SDCSTO -- Cost Override Code [Generic Edit] Character (1)
,''   SDTCST -- Extended Cost - Transfer [Generic Edit] Numeric (15)
,''   SDINMG -- Print Message [UDC (40 PM)] String (10)
,CASE
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 0 THEN 'NI'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 3 THEN 'N20'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 20 THEN 'N20'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 30 THEN 'N3'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 35 THEN 'N20'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 45 THEN 'N4'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 60 THEN 'N6'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 90 THEN 'N9'
	WHEN CUSTOMER_ORDER.TERMS_NET_DAYS = 301 THEN 'N20'
	ELSE ''
 END  SDPTC -- Payment Terms Code [Generic Edit] String (3)
,'C'   SDRYIN -- Payment Instrument [UDC (00 PY)] Character (1)
,''   SDDTBS -- Based on Date [UDC (42 BD)] Character (1)
,''   SDTRDC -- Discount - Trade [Generic Edit] Numeric (7)
,''   SDFUN2 -- Trade Discount (Old) [Generic Edit] Numeric (15)
,'20'   SDASN -- Price and Adjustment Schedule [UDC (40 AS)] String (8)
,''   SDPRGR -- Item Price Group [UDC (40 PI)] String (8)
,''   SDCLVL -- Pricing Category Level [Generic Edit] String (3)
,''   SDCADC -- Discount % - Cash [Generic Edit] Numeric (7)
,'00020'   SDKCO -- Document Company [Generic Edit] String (5)
,ISNULL(REPLACE(RECEIVABLE_LINE.INVOICE_ID,'IN',''),'')   SDDOC -- Document (Voucher Invoice etc.) [Generic Edit] Numeric (8)
,''   SDDCT -- Document Type [UDC (00 DT)] String (2)
,''   SDODOC -- Document - Original [Generic Edit] Numeric (8)
,''   SDODCT -- Document Type - Original [UDC (00 DT)] String (2)
,''   SDOKC -- Document Company - Original [Generic Edit] String (5)
,''   SDPSN -- Pick Slip Number [Generic Edit] Numeric (8)
,''   SDDELN -- Delivery Number [Generic Edit] Numeric (8)
,''   SDTAX1 -- Sales Taxable (Y/N) [UDC (H00 TV)] Character (1)
,''   SDTXA1 -- Tax Rate/Area [Generic Edit] String (10)
,''   SDEXR1 -- Tax Expl Code 1 [UDC (00 EX)] String (2)
,''   SDATXT -- Associated Text [Generic Edit] Character (1)
,'0'   SDPRIO -- Priority - Processing [UDC (H40 PR)] Character (1)
,''   SDRESL -- Printed Code [Generic Edit] Character (1)
,'Y'   SDBACK -- Backorders Allowed (Y/N) [Generic Edit] Character (1)
,'Y'   SDSBAL -- Substitutes Allowed (Y/N) [Generic Edit] Character (1)
,'Y'   SDAPTS -- Partial Line Shipments Allowed (Y/N) [Generic Edit] Character (1)
,''   SDLOB -- Line of Business [UDC (40 LB)] String (3)
,''   SDEUSE -- End Use [UDC (40 EU)] String (3)
,''   SDDTYS -- Duty Status [UDC (40 DS)] String (2)
,''   SDNTR -- Nature of Transaction [UDC (00 NT)] String (2)
,ISNULL(_PREF_VENDORS.ABAN8,'') SDVEND -- Primary / Last Supplier Number [Generic Edit] Numeric (8)
,''   SDCARS -- Carrier Number [Generic Edit] Numeric (8)
,''   SDMOT -- Mode of Transport [UDC (00 TM)] String (3)
,''   SDROUT -- Route Code [UDC (42 RT)] String (3)
,''   SDSTOP -- Stop Code [UDC (42 SP)] String (3)
,''   SDZON -- Zone Number [UDC (40 ZN)] String (3)
,''   SDCNID -- Container I.D. [Generic Edit] String (20)
,''   SDFRTH -- Freight Handling Code [UDC (42 FR)] String (3)
,''   SDSHCM -- Shipping Commodity Class [UDC (41 E)] String (3)
,''   SDSHCN -- Shipping Conditions Code [UDC (41 C)] String (3)
,''   SDSERN -- Serial Number - Lot [Generic Edit] String (30)
,ISNULL(ITEM_MASTER_1.SZUOM1,'EA')   SDUOM1 -- Unit of Measure - Primary [UDC (00 UM)] String (2)
,CAST((CUST_ORDER_LINE.ORDER_QTY * 10000) AS BIGINT)  SDPQOR -- Units - Primary Quantity Ordered [Generic Edit] Numeric (15)
,ISNULL(ITEM_MASTER_1.SZUOM1,'EA')   SDUOM2 -- Unit of Measure - Secondary [UDC (00 UM)] String (2)
,CAST((CUST_ORDER_LINE.ORDER_QTY * 10000) AS BIGINT)  SDSQOR -- Units - Secondary Quantity Ordered [Generic Edit] Numeric (15)
,ISNULL(ITEM_MASTER_1.SZUOM1,'EA')   SDUOM4 -- Unit of Measure - Pricing [UDC (00 UM)] String (2)
,CASE
    WHEN PART.WEIGHT IS NULL THEN ''
    ELSE CAST(CAST((PART.WEIGHT * 10000) AS BIGINT) AS VARCHAR)
 END   SDITWT -- Unit Weight [Generic Edit] Numeric (15)
,'LB'   SDWTUM -- Weight Unit of Measure [UDC (00 UM)] String (2)
,''   SDITVL -- Unit Volume [Generic Edit] Numeric (15)
,'GA'   SDVLUM -- Volume Unit of Measure [UDC (00 UM)] String (2)
,''   SDRPRC -- Reprice (Basket Price) Category [UDC (40 PI)] String (8)
,''   SDORPR -- Order Reprice Category [UDC (40 PI)] String (8)
,''   SDORP -- Order Repriced Indicator [Generic Edit] Character (1)
,'07'   SDCMGP -- Costing Method - Inventory [Generic Edit] String (2)
,ISNULL(ITEM_MASTER_1.SZGLPT,'')   SDGLC -- G/L Offset [Generic Edit] String (4)
,1+(YEAR(CUSTOMER_ORDER.ORDER_DATE) - 1) / 100   SDCTRY -- Century [Generic Edit] Numeric (2)
,''   SDFY -- Fiscal Year [Generic Edit] Numeric (2)
,''   SDSO01 -- Inter Branch Sales [Generic Edit] Character (1)
,CASE 
    WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  
                  IN (210,  217,  220,  230,  310,  320,  340,  350,  380,  
                        410,  420,  470,  500,  610,  710,  720,  730,  745,  750,  780) Then 1  
    WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  
                  IN (240, 390, 450, 460, 740, 755) Then ''
    WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  
                  IN (735,  800,  801,  900,  901,  902,  903,  914,  915,  
                        925,  950,  951,  975,  998,  999) Then 1
   WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  IN ('KSR', 'OKR') Then 1
   WHEN LEFT(CUST_ORDER_LINE.PRODUCT_CODE,3)  IN (904, 905) Then ''
   ELSE ''
 END  SDSO02 -- On Hand Updated [Generic Edit] Character (1)
,''   SDSO03 -- Configurator Print Flag [Generic Edit] Character (1)
,''   SDSO04 -- Sales Order Status 04 [Generic Edit] Character (1)
,''   SDSO05 -- Substitute Item Indicator [Generic Edit] Character (1)
,''   SDSO06 -- Preference Commitment Indicator [Generic Edit] Character (1)
,''   SDSO07 -- Ship date (PDDJ) overridden [Generic Edit] Character (1)
,''   SDSO08 -- Price Adjustment Line Indicator [Generic Edit] Character (1)
,''   SDSO09 -- Price Adj. History Indicator [Generic Edit] Character (1)
,''   SDSO10 -- Preference Production Allocation [Generic Edit] Character (1)
,''   SDSO11 -- Transfer/Direct Ship/Intercompany Flag [Generic Edit] Character (1)
,''   SDSO12 -- Deferred entries flag [Generic Edit] Character (1)
,''   SDSO13 -- Euro Conversion Status Flag [Generic Edit] Character (1)
,''   SDSO14 -- Sales Order Status 14 [Generic Edit] Character (1)
,''   SDSO15 -- Sales Order Status 15 [Generic Edit] Character (1)
,''   SDACOM -- Apply Commission (Y/N) [Generic Edit] Character (1)
,''   SDCMCG -- Commission Category [Generic Edit] String (8)
,''   SDRCD -- Reason Code [UDC (42 RC)] String (3)
,''   SDGRWT -- Gross Weight [Generic Edit] Numeric (15)
,''   SDGWUM -- Gross Weight Unit of Measure [UDC (00 UM)] String (2)
,''   SDSBL -- Subledger - G/L [Generic Edit] String (8)
,''   SDSBLT -- Subledger Type [UDC (00 ST)] Character (1)
,''   SDLCOD -- Code - Location Tax Status [UDC (46 LT)] String (2)
,''   SDUPC1 -- Price Code 1 [UDC (40 P1)] String (2)
,''   SDUPC2 -- Price Code 2 [UDC (40 P2)] String (2)
,''   SDUPC3 -- Price Code 3 [UDC (40 P3)] String (2)
,''   SDSWMS -- Status - In Warehouse [Generic Edit] Character (1)
,''   SDUNCD -- Work Order Freeze Code [UDC (H00 UN)] Character (1)
,''   SDCRMD -- Send Method [UDC (00 SM)] Character (1)
,'USD'   SDCRCD -- Currency Code - From [Generic Edit] String (3)
,''   SDCRR -- Currency Conversion Rate - Spot Rate [Generic Edit] Numeric (15)
,'0'   SDFPRC -- Amount - List Price per Unit [Generic Edit] Numeric (15)
,'0'   SDFUP -- Amount - Foreign Price per Unit [Generic Edit] Numeric (15)
,'0'   SDFEA -- Amount - Foreign Extended Price [Generic Edit] Numeric (15)
,'0'   SDFUC -- Amount - Foreign Unit Cost [Generic Edit] Numeric (15)
,''   SDFEC -- Amount - Foreign Extended Cost [Generic Edit] Numeric (15)
,''   SDURCD -- User Reserved Code [Generic Edit] String (2)
,''   SDURDT -- User Reserved Date [Generic Edit] Date (6)
,''   SDURAT -- User Reserved Amount [Generic Edit] Numeric (15)
,''   SDURAB -- User Reserved Number [Generic Edit] Numeric (8)
,''   SDURRF -- User Reserved Reference [Generic Edit] String (15)
,''   SDTORG -- Transaction Originator [Generic Edit] String (10)
,'TSAMPSON'   SDUSER -- User ID [Generic Edit] String (10)
,'SQL'   SDPID -- Program ID [Generic Edit] String (10)
,''   SDJOBN -- Work Station ID [Generic Edit] String (10)
,ISNULL(dbo.JDEJulian(GETDATE()),'')   SDUPMJ -- Date - Updated [Generic Edit] Date (6)
,''   SDTDAY -- Time of Day [Generic Edit] Numeric (6)
,''   SDSO16 -- Manufacturing Variance Accounting Flag [Generic Edit] Character (1)
,''   SDSO17 -- Sales Order Status 17 [Generic Edit] Character (1)
,'0'   SDSO18 -- Sales Order Status 18 [Generic Edit] Character (1)
,''   SDSO19 -- Sales Order Status 19 [Generic Edit] Character (1)
,''   SDSO20 -- Sales Order Status 20 [Generic Edit] Character (1)
,''   SDIR01 -- Integration Reference 01 [Generic Edit] String (30)
,''   SDIR02 -- Integration Reference 02 [Generic Edit] String (30)
,''   SDIR03 -- Integration Reference 03 [Generic Edit] String (30)
,''   SDIR04 -- Integration Reference 04 [Generic Edit] String (30)
,''   SDIR05 -- Integration Reference 05 [Generic Edit] String (30)
,'0'   SDSOOR -- Source of Order [Generic Edit] Integer (11)
,ISNULL(CAST(WORK_ORDER.BASE_ID AS VARCHAR) + '_' + CAST(WORK_ORDER.SUB_ID AS VARCHAR),'')   SDVR03 -- Reference [Generic Edit] String (25)
,'0'   SDDEID -- Demand Unique Key ID [Generic Edit] Numeric (15)
,''   SDPSIG -- Pull Signal [Generic Edit] String (30)
,''   SDRLNU -- Release Number [Generic Edit] String (10)
,'0'   SDPMDT -- Scheduled Shipment Time [Generic Edit] Numeric (6)
,'0'   SDRLTM -- Time - Release [Generic Edit] Numeric (6)
,''   SDRLDJ -- Date - Release [Generic Edit] Date (6)
,'0'   SDDRQT -- Requested Delivery Time [Generic Edit] Numeric (6)
,'0'   SDADTM -- Actual Shipment Time [Generic Edit] Numeric (6)
,'0'   SDOPTT -- Time - Original Promised Delivery [Generic Edit] Numeric (6)
,'0'   SDPDTT -- Time - Scheduled Pick [Generic Edit] Numeric (6)
,'0'   SDPSTM -- Time - Future Time 2 [Generic Edit] Numeric (6)
,'0'   SDXDCK -- Cross-Docking Flag [Generic Edit] Character (1)
,''   SDXPTY -- Cross Docking Priority for Sales Orders [Generic Edit] Numeric (15)
,''   SDDUAL -- Dual Unit Of Measure Item [Generic Edit] Character (1)
,''   SDBSC -- Buying Segment Code [UDC (42B BS)] String (10)
,''   SDCBSC -- Current Buying Segment Code [UDC (42B BS)] String (10)
,'0'   SDCORD -- Change Order Number [Generic Edit] Numeric (3)
,''   SDDVAN -- Address Number - Deliver To [Generic Edit] Numeric (8)
,''   SDPEND -- Pending Approval Flag [Generic Edit] Character (1)
,''   SDRFRV -- Revision Reason [UDC (42 RR)] String (3)
,''   SDMCLN -- Matrix Control Line Number [Generic Edit] Numeric (6)
,''   SDSHPN -- Shipment Number [Generic Edit] Numeric (8)
,'0'   SDRSDT -- Promised Delivery Time [Generic Edit] Numeric (6)
,''   SDPRJM -- Project Number [Generic Edit] Numeric (8)
,''   SDOSEQ -- Sequence Number [Generic Edit] Numeric (4)
,''   SDMERL -- Item Revision Level [Generic Edit] String (3)
,''   SDHOLD -- Hold Orders Code [UDC (42 HC)] String (2)
,''   SDHDBU -- Business Unit - Header [Generic Edit] String (12)
,''   SDDMBU -- Business Unit - Demand [Generic Edit] String (12)
,''   SDBCRC -- Currency Code - Base [Generic Edit] String (3)
,''   SDODLN -- Document Line Number - Original [Generic Edit] Numeric (7)
,ISNULL(dbo.JDEJulian(CUST_ORDER_LINE.DESIRED_SHIP_DATE),'')   SDOPDJ -- Date - Original Promised Delivery [Generic Edit] Date (6)
,''   SDXKCO -- Cross Dock Order Company (Order Number) [Generic Edit] String (5)
,''   SDXORN -- Cross Dock Order No [Generic Edit] Numeric (8)
,''   SDXCTO -- Cross Dock Order Type [UDC (00 DT)] String (2)
,''   SDXLLN -- Cross Dock Line Number [Generic Edit] Numeric (6)
,''   SDXSFX -- Cross Dock Order Suffix [Generic Edit] String (3)
,''   SDPOE -- Port of Entry or Exit [UDC (40 PE)] String (6)
,''   SDPMTO -- Payment Terms Override Code [Generic Edit] Character (1)
,''   SDANBY -- Buyer Number [Generic Edit] Numeric (8)
,''   SDPMTN -- Promotion ID [Generic Edit] String (12)
,''   SDNUMB -- Asset Item Number [Generic Edit] Numeric (8)
,''   SDAAID -- Parent Number [Generic Edit] Numeric (8)
,ISNULL(LEFT(LTRIM(RTRIM(CUSTOMER_ORDER.FREE_ON_BOARD)),50),'')   SDSPATTN -- Ship To Attention [Generic Edit] String (50)
,'0'   SDPRAN8 -- Partner Address Number [Generic Edit] Numeric (8)
,'0'   SDPRCIDLN -- Partner Contact Line Number ID [Generic Edit] Numeric (5)
,'0'   SDCCIDLN -- Customer Contact Line Number ID [Generic Edit] Numeric (5)
,'0'   SDSHCCIDLN -- Ship To Cust Contact Line Num ID [Generic Edit] Numeric (5)
,'0'   SDOPPID -- Opportunity Number [Generic Edit] Numeric (15)
,''   SDOSTP -- Organization Structure Type [UDC (01 TS)] String (3)
,''   SDUKID -- Unique Key ID (Internal) [Generic Edit] Numeric (15)
,''   SDCATNM -- Catalog Name [Generic Edit] String (30)
,''   SDALLOC -- Allocation Process Flag [Generic Edit] Character (1)
,'0'   SDFULPID -- Fulfillment Plan ID [Generic Edit] Integer (11)
,''   SDALLSTS -- Allocation Status Number [UDC (42 AS)] String (30)
,'0'   SDOSCORE -- Sales Order Score [Generic Edit] Numeric (15)
,''   SDOSCOREO -- Order Score Override [Generic Edit] Character (1)
,'00020'   SDCMCO -- Customer Master Company [Generic Edit] String (5)
,''   SDKITID -- Kit Identifier [Generic Edit] Numeric (15)
,'0'   SDKITAMTDOM -- Accumulated Amount Invoiced (Domestic) [Generic Edit] Numeric (15)
,'0'   SDKITAMTFOR -- Accumulated Amount Invoiced (Foreign) [Generic Edit] Numeric (15)
,''   SDKITDIRTY -- Kit Component Dirty Flag [Generic Edit] Character (1)
,''   SDOCITT -- OC In-Transit Flag [Generic Edit] Character (1)
,'0'   SDOCCARDNO -- OC Kanban Card No [Generic Edit] Numeric (8)
,''   SDPMPN -- Production Number [Generic Edit] String (30)
,''   SDPNS -- Production Number Short [Generic Edit] Numeric (10)

FROM  CUST_ORDER_LINE CUST_ORDER_LINE

LEFT JOIN DEMAND_SUPPLY_LINK DEMAND_SUPPLY_LINK
	ON CUST_ORDER_LINE.CUST_ORDER_ID = DEMAND_SUPPLY_LINK.DEMAND_BASE_ID
	AND CUST_ORDER_LINE.LINE_NO = DEMAND_SUPPLY_LINK.DEMAND_SEQ_NO

LEFT JOIN WORK_ORDER WORK_ORDER 
	ON DEMAND_SUPPLY_LINK.SUPPLY_BASE_ID = WORK_ORDER.BASE_ID 
	AND DEMAND_SUPPLY_LINK.SUPPLY_LOT_ID = WORK_ORDER.LOT_ID 
	AND DEMAND_SUPPLY_LINK.SUPPLY_SPLIT_ID = WORK_ORDER.SPLIT_ID 
	AND DEMAND_SUPPLY_LINK.SUPPLY_SUB_ID = WORK_ORDER.SUB_ID 

JOIN CUSTOMER_ORDER CUSTOMER_ORDER
	ON CUSTOMER_ORDER.ID = CUST_ORDER_LINE.CUST_ORDER_ID
	
JOIN _ADDRESS_BOOK_MERGED BT
	ON 'BC_' + CUSTOMER_ORDER.CUSTOMER_ID = BT.SZALKY

LEFT JOIN _ADDRESS_BOOK_MERGED ST
	ON 'BC_' + CUSTOMER_ORDER.CUSTOMER_ID + '_' + CAST(ISNULL(CUSTOMER_ORDER.SHIP_TO_ADDR_NO,1) AS VARCHAR) = ST.SZALKY	

LEFT JOIN RECEIVABLE_LINE RECEIVABLE_LINE
    ON CUST_ORDER_LINE.CUST_ORDER_ID = RECEIVABLE_LINE.CUST_ORDER_ID
    AND CUST_ORDER_LINE.LINE_NO = RECEIVABLE_LINE.CUST_ORDER_LINE_NO

LEFT JOIN RECEIVABLE RECEIVABLE
    ON RECEIVABLE.INVOICE_ID = RECEIVABLE_LINE.INVOICE_ID

LEFT JOIN _ITEM_MASTER_1_TABLE ITEM_MASTER_1
    ON CUST_ORDER_LINE.PART_ID = LTRIM(RTRIM(ITEM_MASTER_1.SZLITM))  

LEFT JOIN PART PART
    ON CUST_ORDER_LINE.PART_ID = PART.ID   

LEFT JOIN _PREF_VENDORS _PREF_VENDORS
	ON 'BC_' + CAST(PART.PREF_VENDOR_ID AS VARCHAR) = _PREF_VENDORS.ABALKY

WHERE CUSTOMER_ORDER.ID IN ('SO047929','SO053481','SO054488','SO054613','SO054891','SO060310','SO060511','SO060799','SO060815','SO060860','SO060875','SO060974','SO061207','SO061361','SO061412','SO061601','SO061608','SO061610','SO061640','SO061652','SO061657','SO062082','SO062223','SO062265','SO062298','SO062322','SO062432','SO062494','SO062527','SO062530','SO062588','SO062597','SO062688','SO062736','SO062740','SO062752','SO062795','SO062796','SO062804','SO062812','SO062814','SO062830','SO062904','SO062971','SO062993','SO063015','SO063190','SO063229','SO063277','SO063286','SO063294','SO063295','SO063369','SO063379','SO063394','SO063436','SO063536','SO063562','SO063566','SO063611','SO063624','SO063710','SO063737','SO063757','SO063768','SO063810','SO063852','SO063879','SO063922','SO063955','SO063968','SO063972','SO063984','SO064035','SO064104','SO064171','SO064177','SO064277','SO064363','SO064367','SO064368')

-- AND CUSTOMER_ORDER.ID IN ('SO063394','SO062597','SO063955','SO063286','SO062814')

AND CUST_ORDER_LINE.ORDER_QTY = CUST_ORDER_LINE.TOTAL_SHIPPED_QTY
