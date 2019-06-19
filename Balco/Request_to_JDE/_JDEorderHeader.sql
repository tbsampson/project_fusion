USE RequestsStaging;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	_JDEorderHeader 
	VER0002
	Tom Sampson
	IR 20190618
	usage 
	EXEC dbo._JDEorderHeader <orderID>
	
	example
	USE RequestsStaging;
	EXEC dbo._JDEorderHeader 60312
	
*/
ALTER PROCEDURE dbo._JDEorderHeader (@OrderID INTEGER)

AS

SELECT DISTINCT
	 Orders.OrderID                     "BH55BORDER"
	,QuoteSectionItems.SectionID        "BH55BSECID"
	,'N'       							"BHEDSP" -- EDI Successfully Processed
	,QuoteSections.SectionName			"BH55BSDEC"
	,'BC_' + Customers.CustomerNumber   "BH55BBT"
	,dbo.JDEJulian(Orders.OrderDate)
                                        "BHTRDJ"
	,LEFT(LTRIM(RTRIM(Orders.CustomerPO)),25) 
                                        "BHVR01"
	,RepCompanies.RepNumber             "BHSLSM"
	,CAST(CAST(ROUND(ISNULL(NULLIF(QuoteSectionCommissions.Commission,0)  / NULLIF(SubT.Amt - QuoteSections.Discount,0),0),5) AS DECIMAL(4,2)) * 100000 AS INTEGER)
                                        "BHSLCM"
	,CASE
		WHEN Users.SecurityLevel BETWEEN 1 AND 2 THEN 1
		WHEN Users.SecurityLevel = 16 THEN 2
		ELSE 3
	 END                                "BH55BOCODE"
	,Orders.Name                        "BH55BJOB"
	,CASE WHEN LTRIM(RTRIM(Orders.JobType)) IS NOT NULL
		THEN LEFT(LTRIM(RTRIM(Orders.JobType)),10)
		ELSE ''
	 END                                "BH55BJTYPE"
	,Orders.ShippingMethodID            "BH55BSMETH"
	,Orders.Forward                     "BH55BFWD"
	,CAST(SubT.Lbs * 10000 AS INTEGER)  "BHWTLB"
	,ISNULL(CASE
		WHEN LEN(LTRIM(RTRIM(Orders.State))) <> 2
			OR LTRIM(RTRIM(Orders.State)) IS NULL
			OR LTRIM(RTRIM(Orders.State)) = ''
			OR LEFT(LTRIM(RTRIM(Orders.Zipcode)),1) > '9'
			OR LTRIM(RTRIM(Orders.Zipcode)) IS NULL
			OR LTRIM(RTRIM(Orders.Zipcode)) = ''
			THEN LEFT(UPPER(LTRIM(RTRIM(Orders.City)) +','+ LTRIM(RTRIM(Orders.State)) + ' ' + LTRIM(RTRIM(Orders.Zipcode))),23)
			ELSE ''
	 END, '') 							"BHADD1"	
	,ISNULL(LEFT(UPPER(LTRIM(RTRIM(Orders.City))), 30),'') 
										"BHCTY1"
	,CASE 
		WHEN LEN(LTRIM(RTRIM(Orders.State))) = 2 THEN UPPER(LTRIM(RTRIM(Orders.State)))
		ELSE ''
	 END 								"BHADDS"
	,CASE
		WHEN LEFT(LTRIM(RTRIM(Orders.Zipcode)),1) <= '9' THEN ISNULL(LTRIM(RTRIM(Orders.Zipcode)),'')
		ELSE ''
	 END 								"BHADDZ"
    ,''                                 "BHSDATTN"
	,''                                 "BHKCOO"
	,''                                 "BHDOCO"
	,''                                 "BHDCTO"
	,''                                 "BHUSER"
	,''                                 "BHPID"
	,''                                 "BHUPMJ"
	,''                                 "BHUPMT"
	,''                                 "BHJOBN"	

FROM 
	QuoteSectionItems QuoteSectionItems

JOIN QuoteSections QuoteSections
	ON QuoteSectionItems.SectionID = QuoteSections.SectionID

JOIN Orders Orders
	ON Orders.QuoteID = QuoteSections.QuoteID

JOIN ShippingCosts ShippingCosts
	ON Orders.ShippingID = ShippingCosts.ShippingID
	
INNER JOIN
	Systems Systems ON QuoteSectionItems.SystemID = Systems.SystemID
	
INNER JOIN
	(	SELECT	SectionID
				,SUM(CAST(Quantity AS DECIMAL(13,5)) * CAST(UnitPrice AS DECIMAL(13,5))) AS Amt
				,SUM(CAST(Quantity AS DECIMAL(13,5)) * CAST(UnitWeight AS DECIMAL(13,5))) AS Lbs
		FROM	QuoteSectionItems QIT
		GROUP BY	SectionID) "SubT"
	
	ON (QuoteSectionItems.SectionID = "SubT".SectionID)
	
JOIN RepCompanies RepCompanies
	ON 	Orders.RepID = RepCompanies.RepID

JOIN
	QuoteSectionCommissions QuoteSectionCommissions 
			ON QuoteSectionItems.SectionID = QuoteSectionCommissions.SectionID
			AND QuoteSectionCommissions.RepID = Orders.RepID

JOIN Customers Customers
	ON Orders.CustomerID = Customers.CustomerID

JOIN CustomerAddresses CustomerAddresses
	ON Customers.CustomerID = CustomerAddresses.CustomerID

JOIN Quotes Quotes
	ON Orders.QuoteID = Quotes.QuoteID

LEFT JOIN Users Users
	ON Quotes.UserID = Users.UserID

LEFT JOIN Permissions Permissions
	ON Users.SecurityLevel = Permissions.PermissionID	

WHERE 
	Orders.OrderID = @OrderID

GO
