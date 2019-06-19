/*
	Custom Detail for Request to E1 integration
	F55BAL11
	IR 20190420
	REWRITE 20190603
	Tom Sampson
	VER0011
*/


USE RequestsStaging;

DECLARE @OrderID INTEGER, @SectionID INTEGER

SET @OrderID = 60312
SET @SectionID = 224817

/*
-- case 1
SET @OrderID = 60307
SET @SectionID = 224801

-- case 2
SET @OrderID = 60308
SET @SectionID = 224802

-- case 3
SET @OrderID = 60309
SET @SectionID = 224803

-- case 4
SET @OrderID = 60310
SET @SectionID = 224804

-- case 5
SET @OrderID = 60312
SET @SectionID = 224817

*/


SELECT 

	 Orders.OrderID                  	"BD55BORDER"
	,QuoteSectionItems.SectionID        "BD55BSECID"
	,QuoteSectionItems.ItemID           "BD55BLINE"
	,'N'                                "BDEDSP"
	,Systems.SystemNumber            	"BDAITM"
/*	
	,QuoteSectionItems.UnitPrice list_price
	,ISNULL(Disc.Discount,0) discount
	,QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)) after_discount
	,ISNULL(Comm.CommissionAmount / (AvgPrice.Total - QuoteSections.Discount),0) commission_rate
	,ISNULL(ISNULL((Comm.CommissionAmount / (AvgPrice.Total - QuoteSections.Discount)),0) * QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)),0) comm_amt
	,QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)) + ISNULL(ISNULL((Comm.CommissionAmount / (AvgPrice.Total - QuoteSections.Discount)),0) * QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)),0) cust_unit_price
*/	
	
	,CAST(QuoteSectionItems.Quantity * 10000 AS INTEGER)
										"BDUORG" -- Qty
	,CAST((QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)) + ISNULL(ISNULL((Comm.CommissionAmount / (AvgPrice.Total - QuoteSections.Discount)),0) * QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)),0)) * 10000 AS BIGINT)
										"BDUPRC" -- customer unit price (list price - discounts + commission)
	,CAST(ISNULL(QuoteSectionItems.Quantity * QuoteSectionItems.UnitPrice * (ISNULL(Disc.Discount,0)),0) * 100 AS BIGINT)
										"BDADSA" -- list price - discount								
	,CAST((QuoteSectionItems.Quantity * (ISNULL(ISNULL((Comm.CommissionAmount / (AvgPrice.Total - QuoteSections.Discount)),0) * QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)),0))) * 100 AS BIGINT)
										"BDIPRV" -- total commission
	,CASE 
		WHEN LEFT(RTRIM(LTRIM(QuoteSectionItems.Custom)),60) IS NULL THEN ''
		ELSE LEFT(RTRIM(LTRIM(QuoteSectionItems.Custom)),60)
	 END                                "BDTXLN"
	,''                                 "BDKCOO"
	,''                                 "BDDOCO"
	,''                                 "BDDCTO"
	,''                                 "BDLIND"
	,''                                 "BDUSER"
	,''                                 "BDPID"
	,''                                 "BDUPMJ"
	,''                                 "BDUPMT"
	,''                                 "BDJOBN"


	                                        
FROM Quotes

INNER JOIN ShippingCosts
	ON Quotes.ShippingID = ShippingCosts.ShippingID

INNER JOIN QuoteSections
	ON Quotes.QuoteID = QuoteSections.QuoteID

INNER JOIN QuoteSectionItems
	ON QuoteSections.SectionID = QuoteSectionItems.SectionID

INNER JOIN Systems
	ON QuoteSectionItems.SystemID = Systems.SystemID

INNER JOIN ConversionUnits
	ON Systems.UnitOfMeasure = ConversionUnits.UnitID

INNER JOIN Users
	ON Quotes.UserID = Users.UserID

LEFT OUTER JOIN Plans
	ON Quotes.PlanID = Plans.PlanID

LEFT OUTER JOIN SystemCategories
	ON Systems.CategoryID = SystemCategories.CategoryID

LEFT OUTER JOIN (
	SELECT T.SectionID
		,T.DiscountID
		,MAX(D.Amount) AS Discount

	FROM DiscountDetails AS D

	INNER JOIN (
		SELECT I.SectionID
			,C.DiscountID
			,SUM(CAST(I.UnitPrice AS MONEY) * I.Quantity) AS Price

		FROM QuoteSectionItems AS I

		INNER JOIN Systems AS S
			ON I.SystemID = S.SystemID

		INNER JOIN SystemCategories AS C
			ON S.CategoryID = C.CategoryID

		WHERE (C.DiscountID <> 0)

		GROUP BY I.SectionID
			,C.DiscountID
		) AS T
		ON D.DiscountID = T.DiscountID
			AND D.Minimum < T.Price

	GROUP BY T.SectionID
		,T.DiscountID
		,T.Price
	) AS Disc

	ON QuoteSections.SectionID = Disc.SectionID
		AND SystemCategories.DiscountID = Disc.DiscountID

LEFT OUTER JOIN (
	SELECT S.QuoteID
		,S.SectionID
		,SUM(I.Quantity * I.UnitPrice) AS Total
	FROM QuoteSections AS S

	INNER JOIN QuoteSectionItems AS I
		ON S.SectionID = I.SectionID
	GROUP BY S.QuoteID
		,S.SectionID
	) AS AvgPrice
	ON Quotes.QuoteID = AvgPrice.QuoteID
		AND QuoteSections.SectionID = AvgPrice.SectionID

LEFT OUTER JOIN (
	SELECT SectionID
		,SUM(Commission) AS CommissionAmount
	FROM QuoteSectionCommissions
	GROUP BY SectionID
	) AS Comm
	ON QuoteSections.SectionID = Comm.SectionID

JOIN Orders Orders
	ON Orders.QuoteID = QuoteSections.QuoteID
	AND Orders.SectionID = QuoteSections.SectionID

WHERE (QuoteSections.SectionID = @SectionID)


UNION ALL

SELECT TOP 1

	 Orders.OrderID AS                  "BD55BORDER"
	,QuoteSectionItems.SectionID        "BD55BSECID"
	,LTRIM(RTRIM(CAST(RIGHT(DATEPART(HOUR, GETDATE()),2) AS CHAR)))
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(MINUTE, GETDATE()),2) AS CHAR)))
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(SECOND, GETDATE()),2) AS CHAR)))	
		+ LTRIM(RTRIM(CAST(RIGHT(DATEPART(MILLISECOND, GETDATE()),2) AS CHAR)))
	                                    "BD55BLINE"
	,'N'                                "BDEDSP"
	,'FREIGHT' AS                       "BDAITM"
	,10000                              "BDUORG"
	,CAST(Orders.ShippingAmount * 10000 AS INTEGER)              "BDUPRC"
	,0                                  "BDADSA"
	,0                                  "BDIPRV"
	,ShippingCosts.ShippingDescription  "BDTXLN"
	,''                                 "BDKCOO"
	,''                                 "BDDOCO"
	,''                                 "BDDCTO"
	,''                                 "BDLIND"
	,''                                 "BDUSER"
	,''                                 "BDPID"
	,''                                 "BDUPMJ"
	,''                                 "BDUPMT"
	,''                                 "BDJOBN"	
	
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
				,CAST(SUM(Quantity * UnitPrice) AS decimal(13,3)) AS Amt
				,CAST(SUM(Quantity * UnitWeight) AS decimal(13,3)) AS Lbs
		FROM	QuoteSectionItems QIT
		WHERE	SectionID = @SectionID
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
	AND QuoteSectionItems.SectionID = @SectionID
