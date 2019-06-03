/*
	Custom Detail for Request to E1 integration
	IR 20190420
	REWRITE 20190603
	Tom Sampson
	VER0010
*/


USE RequestsStaging;

DECLARE @OrderID INTEGER, @SectionID INTEGER

SET @OrderID = 55722
SET @SectionID = 205521

SELECT 
	 Orders.OrderID                  	"BD55BORDER" -- OrderID
	,QuoteSectionItems.SectionID        "BD55BSECID" -- SectionID
	,QuoteSectionItems.ItemID           "BD55BLINE" -- ItemID
	,'N'                                "BDEDSP" -- hard code to N
	,Systems.SystemNumber            	"BDAITM" -- System number.  This is freeform and may not match item in JDE
	,CAST((QuoteSectionItems.Quantity * (1 + CAST(ROUND((ISNULL(Comm.CommissionAmount, 0.00)  / (AvgPrice.Total - QuoteSections.Discount)),5) AS DECIMAL(4,2)))) * 10000 AS INTEGER)
										"BDUORG" -- Qty * commission / price after discounts
	,CAST(((QuoteSectionItems.UnitPrice - (QuoteSectionItems.UnitPrice * CAST(ISNULL(1 - Disc.Discount, 0.00) AS MONEY))) + ((QuoteSectionItems.UnitPrice - (QuoteSectionItems.UnitPrice * CAST(ISNULL(1 - Disc.Discount, 0.00) AS MONEY))) * (CAST(ROUND(ISNULL(NULLIF(ISNULL(Comm.CommissionAmount, 0.00),0)  / NULLIF(AvgPrice.Total - QuoteSections.Discount,0),0),5) AS DECIMAL(4,2))))) * 10000 AS BIGINT)	
										"BDUPRC" -- per unit price
	,CAST((QuoteSectionItems.UnitPrice - (QuoteSectionItems.UnitPrice * CAST(ISNULL(1 - Disc.Discount, 0.00) AS MONEY))) * 10000 AS BIGINT)
                                        "BDADSA" -- discount
	,CAST(CAST((((QuoteSectionItems.Quantity * QuoteSectionItems.UnitPrice) / NULLIF(AvgPrice.Total,0)) * ISNULL(Comm.CommissionAmount, 0.00)) AS NUMERIC(12,4)) * 10000 AS INTEGER)
                                        "BDIPRV" -- comm
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