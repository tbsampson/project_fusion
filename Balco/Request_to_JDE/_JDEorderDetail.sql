USE RequestsStaging;

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	_JDEorderDetail 
	VER0001
	Tom Sampson
	IR 20190618
	usage 
	EXEC dbo._JDEorderDetail <orderID>
	
	example
	USE RequestsStaging;
	EXEC dbo._JDEorderDetail 60312
	
*/
CREATE PROCEDURE dbo._JDEorderDetail (@OrderID INTEGER)

AS

SELECT 

	 Orders.OrderID                  	"BD55BORDER"
	,QuoteSectionItems.SectionID        "BD55BSECID"
	,QuoteSectionItems.ItemID           "BD55BLINE"
	,'N'                                "BDEDSP"
	,Systems.SystemNumber            	"BDAITM"
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

WHERE Orders.OrderID = @OrderID

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