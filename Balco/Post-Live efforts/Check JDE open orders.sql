SELECT

  F4211.SDKCOO -- Order Company (Order Number)
 ,F4211.SDDOCO -- Document (Order No Invoice etc.)
 ,F4211.SDDCTO -- Order Type
 ,F4211.SDLNID -- Line Number
 ,F4211.SDSFXO -- Order Suffix
 ,F4211.SDMCU -- Business Unit
 ,F4211.SDCO -- Company
 ,F4211.SDOKCO -- Document Company (Original Order)
 ,F4211.SDOORN -- Original Order Number
 ,F4211.SDOCTO -- Original Order Type
 ,F4211.SDOGNO -- Original Line Number
 ,F4211.SDRKCO -- Company - Key (Related Order)
 ,F4211.SDRORN -- Related PO/SO/WO Number
 ,F4211.SDRCTO -- Related PO/SO/WO Order Type
 ,F4211.SDRLLN -- Related PO/SO Line Number
 ,F4211.SDDMCT -- Agreement Number - Distribution
 ,F4211.SDDMCS -- Agreement Supplement - Distribution
 ,F4211.SDAN8 -- Address Number
 ,F4211.SDSHAN -- Address Number - Ship To
 ,F4211.SDPA8 -- Address Number - Parent
 ,F4211.SDDRQJ -- Date - Requested
 ,F4211.SDTRDJ -- Date - Order/Transaction
 ,F4211.SDPDDJ -- Date - Scheduled Pick
 ,F4211.SDADDJ -- Date - Actual Ship Date
 ,F4211.SDIVD -- Date - Invoice
 ,F4211.SDCNDJ -- Date - Cancel
 ,F4211.SDDGL -- Date - For G/L (and Voucher)
 ,F4211.SDRSDJ -- Date - Promised Delivery
 ,F4211.SDPEFJ -- Date - Price Effective Date
 ,F4211.SDPPDJ -- Date - Promised Shipment
 ,F4211.SDVR01 -- Reference
 ,F4211.SDVR02 -- Reference 2
 ,F4211.SDITM -- Item Number - Short
 ,F4211.SDLITM -- 2nd Item Number
 ,F4211.SDAITM -- 3rd Item Number
 ,F4211.SDLOCN -- Location
 ,F4211.SDLOTN -- Lot/Serial Number
 ,F4211.SDFRGD -- From Grade
 ,F4211.SDTHGD -- Thru Grade
 ,F4211.SDFRMP -- From Potency
 ,F4211.SDTHRP -- Thru Potency
 ,F4211.SDEXDP -- Days Before Expiration
 ,F4211.SDDSC1 -- Description
 ,F4211.SDDSC2 -- Description - Line 2
 ,F4211.SDLNTY -- Line Type
 ,F4211.SDNXTR -- Status Code - Next
 ,F4211.SDLTTR -- Status Code - Last
 ,F4211.SDEMCU -- Business Unit - Header
 ,F4211.SDRLIT -- Item Number - Related (Kit)
 ,F4211.SDKTLN -- Kit Master Line Number
 ,F4211.SDCPNT -- Component Line Number
 ,F4211.SDRKIT -- Related Kit Component
 ,F4211.SDKTP -- Number of Component Per Parent
 ,F4211.SDSRP1 -- Sales Catalog Section
 ,F4211.SDSRP2 -- Sub Section
 ,F4211.SDSRP3 -- Sales Category Code 3
 ,F4211.SDSRP4 -- Sales Category Code 4
 ,F4211.SDSRP5 -- Sales Category Code 5
 ,F4211.SDPRP1 -- Commodity Class
 ,F4211.SDPRP2 -- Commodity Sub Class
 ,F4211.SDPRP3 -- Supplier Rebate Code
 ,F4211.SDPRP4 -- Master Planning Family
 ,F4211.SDPRP5 -- Purchasing Category Code 5
 ,F4211.SDUOM -- Unit of Measure as Input
 ,F4211.SDUORG -- Units - Order/Transaction Quantity
 ,F4211.SDSOQS -- Quantity Shipped
 ,F4211.SDSOBK -- Units - Qty Backordered/Held
 ,F4211.SDSOCN -- Units - Quantity Canceled/Scrapped
 ,F4211.SDSONE -- Units - Future Quantity Committed
 ,F4211.SDUOPN -- Units - Open
 ,F4211.SDQTYT -- Units - Shipped to Date
 ,F4211.SDQRLV -- Units - Relieved
 ,F4211.SDCOMM -- Committed (H/S)
 ,F4211.SDOTQY -- Other Quantity (1/2)
 ,F4211.SDUPRC -- Amount - Price per Unit
 ,F4211.SDAEXP -- Amount - Extended Price
 ,F4211.SDAOPN -- Amount - Open
 ,F4211.SDPROV -- Price Override Code
 ,F4211.SDTPC -- Temporary Price (Y/N)
 ,F4211.SDAPUM -- Unit of Measure - Entered for Unit Price
 ,F4211.SDLPRC -- Amount - List Price
 ,F4211.SDUNCS -- Amount - Unit Cost
 ,F4211.SDECST -- Amount - Extended Cost
 ,F4211.SDCSTO -- Cost Override Code
 ,F4211.SDTCST -- Extended Cost - Transfer
 ,F4211.SDINMG -- Print Message
 ,F4211.SDPTC -- Payment Terms Code
 ,F4211.SDRYIN -- Payment Instrument
 ,F4211.SDDTBS -- Based on Date
 ,F4211.SDTRDC -- Discount - Trade
 ,F4211.SDFUN2 -- Trade Discount (Old)
 ,F4211.SDASN -- Price and Adjustment Schedule
 ,F4211.SDPRGR -- Item Price Group
 ,F4211.SDCLVL -- Pricing Category Level
 ,F4211.SDCADC -- Discount % - Cash
 ,F4211.SDKCO -- Document Company
 ,F4211.SDDOC -- Document (Voucher Invoice etc.)
 ,F4211.SDDCT -- Document Type
 ,F4211.SDODOC -- Document - Original
 ,F4211.SDODCT -- Document Type - Original
 ,F4211.SDOKC -- Document Company - Original
 ,F4211.SDPSN -- Pick Slip Number
 ,F4211.SDDELN -- Delivery Number
 ,F4211.SDTAX1 -- Sales Taxable (Y/N)
 ,F4211.SDTXA1 -- Tax Rate/Area
 ,F4211.SDEXR1 -- Tax Expl Code 1
 ,F4211.SDATXT -- Associated Text
 ,F4211.SDPRIO -- Priority - Processing
 ,F4211.SDRESL -- Printed Code
 ,F4211.SDBACK -- Backorders Allowed (Y/N)
 ,F4211.SDSBAL -- Substitutes Allowed (Y/N)
 ,F4211.SDAPTS -- Partial Line Shipments Allowed (Y/N)
 ,F4211.SDLOB -- Line of Business
 ,F4211.SDEUSE -- End Use
 ,F4211.SDDTYS -- Duty Status
 ,F4211.SDNTR -- Nature of Transaction
 ,F4211.SDVEND -- Primary / Last Supplier Number
 ,F4211.SDCARS -- Carrier Number
 ,F4211.SDMOT -- Mode of Transport
 ,F4211.SDROUT -- Route Code
 ,F4211.SDSTOP -- Stop Code
 ,F4211.SDZON -- Zone Number
 ,F4211.SDCNID -- Container I.D.
 ,F4211.SDFRTH -- Freight Handling Code
 ,F4211.SDSHCM -- Shipping Commodity Class
 ,F4211.SDSHCN -- Shipping Conditions Code
 ,F4211.SDSERN -- Serial Number - Lot
 ,F4211.SDUOM1 -- Unit of Measure - Primary
 ,F4211.SDPQOR -- Units - Primary Quantity Ordered
 ,F4211.SDUOM2 -- Unit of Measure - Secondary
 ,F4211.SDSQOR -- Units - Secondary Quantity Ordered
 ,F4211.SDUOM4 -- Unit of Measure - Pricing
 ,F4211.SDITWT -- Unit Weight
 ,F4211.SDWTUM -- Weight Unit of Measure
 ,F4211.SDITVL -- Unit Volume
 ,F4211.SDVLUM -- Volume Unit of Measure
 ,F4211.SDRPRC -- Reprice (Basket Price) Category
 ,F4211.SDORPR -- Order Reprice Category
 ,F4211.SDORP -- Order Repriced Indicator
 ,F4211.SDCMGP -- Costing Method - Inventory
 ,F4211.SDGLC -- G/L Offset
 ,F4211.SDCTRY -- Century
 ,F4211.SDFY -- Fiscal Year
 ,F4211.SDSO01 -- Inter Branch Sales
 ,F4211.SDSO02 -- On Hand Updated
 ,F4211.SDSO03 -- Configurator Print Flag
 ,F4211.SDSO04 -- Sales Order Status 04
 ,F4211.SDSO05 -- Substitute Item Indicator
 ,F4211.SDSO06 -- Preference Commitment Indicator
 ,F4211.SDSO07 -- Ship date (PDDJ) overridden
 ,F4211.SDSO08 -- Price Adjustment Line Indicator
 ,F4211.SDSO09 -- Price Adj. History Indicator
 ,F4211.SDSO10 -- Preference Production Allocation
 ,F4211.SDSO11 -- Transfer/Direct Ship/Intercompany Flag
 ,F4211.SDSO12 -- Deferred entries flag
 ,F4211.SDSO13 -- Euro Conversion Status Flag
 ,F4211.SDSO14 -- Sales Order Status 14
 ,F4211.SDSO15 -- Sales Order Status 15
 ,F4211.SDACOM -- Apply Commission (Y/N)
 ,F4211.SDCMCG -- Commission Category
 ,F4211.SDRCD -- Reason Code
 ,F4211.SDGRWT -- Gross Weight
 ,F4211.SDGWUM -- Gross Weight Unit of Measure
 ,F4211.SDSBL -- Subledger - G/L
 ,F4211.SDSBLT -- Subledger Type
 ,F4211.SDLCOD -- Code - Location Tax Status
 ,F4211.SDUPC1 -- Price Code 1
 ,F4211.SDUPC2 -- Price Code 2
 ,F4211.SDUPC3 -- Price Code 3
 ,F4211.SDSWMS -- Status - In Warehouse
 ,F4211.SDUNCD -- Work Order Freeze Code
 ,F4211.SDCRMD -- Send Method
 ,F4211.SDCRCD -- Currency Code - From
 ,F4211.SDCRR -- Currency Conversion Rate - Spot Rate
 ,F4211.SDFPRC -- Amount - List Price per Unit
 ,F4211.SDFUP -- Amount - Foreign Price per Unit
 ,F4211.SDFEA -- Amount - Foreign Extended Price
 ,F4211.SDFUC -- Amount - Foreign Unit Cost
 ,F4211.SDFEC -- Amount - Foreign Extended Cost
 ,F4211.SDURCD -- User Reserved Code
 ,F4211.SDURDT -- User Reserved Date
 ,F4211.SDURAT -- User Reserved Amount
 ,F4211.SDURAB -- User Reserved Number
 ,F4211.SDURRF -- User Reserved Reference
 ,F4211.SDTORG -- Transaction Originator
 ,F4211.SDUSER -- User ID
 ,F4211.SDPID -- Program ID
 ,F4211.SDJOBN -- Work Station ID
 ,F4211.SDUPMJ -- Date - Updated
 ,F4211.SDTDAY -- Time of Day
 ,F4211.SDSO16 -- Manufacturing Variance Accounting Flag
 ,F4211.SDSO17 -- Sales Order Status 17
 ,F4211.SDSO18 -- Sales Order Status 18
 ,F4211.SDSO19 -- Sales Order Status 19
 ,F4211.SDSO20 -- Sales Order Status 20
 ,F4211.SDIR01 -- Integration Reference 01
 ,F4211.SDIR02 -- Integration Reference 02
 ,F4211.SDIR03 -- Integration Reference 03
 ,F4211.SDIR04 -- Integration Reference 04
 ,F4211.SDIR05 -- Integration Reference 05
 ,F4211.SDSOOR -- Source of Order
 ,F4211.SDVR03 -- Reference
 ,F4211.SDDEID -- Demand Unique Key ID
 ,F4211.SDPSIG -- Pull Signal
 ,F4211.SDRLNU -- Release Number
 ,F4211.SDPMDT -- Scheduled Shipment Time
 ,F4211.SDRLTM -- Time - Release
 ,F4211.SDRLDJ -- Date - Release
 ,F4211.SDDRQT -- Requested Delivery Time
 ,F4211.SDADTM -- Actual Shipment Time
 ,F4211.SDOPTT -- Time - Original Promised Delivery
 ,F4211.SDPDTT -- Time - Scheduled Pick
 ,F4211.SDPSTM -- Time - Future Time 2
 ,F4211.SDXDCK -- Cross-Docking Flag
 ,F4211.SDXPTY -- Cross Docking Priority for Sales Orders
 ,F4211.SDDUAL -- Dual Unit Of Measure Item
 ,F4211.SDBSC -- Buying Segment Code
 ,F4211.SDCBSC -- Current Buying Segment Code
 ,F4211.SDCORD -- Change Order Number
 ,F4211.SDDVAN -- Address Number - Deliver To
 ,F4211.SDPEND -- Pending Approval Flag
 ,F4211.SDRFRV -- Revision Reason
 ,F4211.SDMCLN -- Matrix Control Line Number
 ,F4211.SDSHPN -- Shipment Number
 ,F4211.SDRSDT -- Promised Delivery Time
 ,F4211.SDPRJM -- Project Number
 ,F4211.SDOSEQ -- Sequence Number
 ,F4211.SDMERL -- Item Revision Level
 ,F4211.SDHOLD -- Hold Orders Code
 ,F4211.SDHDBU -- Business Unit - Header
 ,F4211.SDDMBU -- Business Unit - Demand
 ,F4211.SDBCRC -- Currency Code - Base
 ,F4211.SDODLN -- Document Line Number - Original
 ,F4211.SDOPDJ -- Date - Original Promised Delivery
 ,F4211.SDXKCO -- Cross Dock Order Company (Order Number)
 ,F4211.SDXORN -- Cross Dock Order No
 ,F4211.SDXCTO -- Cross Dock Order Type
 ,F4211.SDXLLN -- Cross Dock Line Number
 ,F4211.SDXSFX -- Cross Dock Order Suffix
 ,F4211.SDPOE -- Port of Entry or Exit
 ,F4211.SDPMTO -- Payment Terms Override Code
 ,F4211.SDANBY -- Buyer Number
 ,F4211.SDPMTN -- Promotion ID
 ,F4211.SDNUMB -- Asset Item Number
 ,F4211.SDAAID -- Parent Number
 ,F4211.SDSPATTN -- Ship To Attention
 ,F4211.SDPRAN8 -- Partner Address Number
 ,F4211.SDPRCIDLN -- Partner Contact Line Number ID
 ,F4211.SDCCIDLN -- Customer Contact Line Number ID
 ,F4211.SDSHCCIDLN -- Ship To Cust Contact Line Num ID
 ,F4211.SDOPPID -- Opportunity Number
 ,F4211.SDOSTP -- Organization Structure Type
 ,F4211.SDUKID -- Unique Key ID (Internal)
 ,F4211.SDCATNM -- Catalog Name
 ,F4211.SDALLOC -- Allocation Process Flag
 ,F4211.SDFULPID -- Fulfillment Plan ID
 ,F4211.SDALLSTS -- Allocation Status Number
 ,F4211.SDOSCORE -- Sales Order Score
 ,F4211.SDOSCOREO -- Order Score Override
 ,F4211.SDCMCO -- Customer Master Company
 ,F4211.SDKITID -- Kit Identifier
 ,F4211.SDKITAMTDOM -- Accumulated Amount Invoiced (Domestic)
 ,F4211.SDKITAMTFOR -- Accumulated Amount Invoiced (Foreign)
 ,F4211.SDKITDIRTY -- Kit Component Dirty Flag
 ,F4211.SDOCITT -- OC In-Transit Flag
 ,F4211.SDOCCARDNO -- OC Kanban Card No
 ,F4211.SDPMPN -- Production Number
 ,F4211.SDPNS -- Production Number Short


FROM PRODDTA.F4211 F4211

JOIN 

WHERE 

    F4211.SDKCOO = '00020'
AND F4211.SDDCTO = 'SO'
AND F4211.SDMCU = '       20001'

