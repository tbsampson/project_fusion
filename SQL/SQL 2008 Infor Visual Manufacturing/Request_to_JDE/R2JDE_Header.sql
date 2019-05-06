/*
	Custom Header for Request to E1 integration
	IR 20190420
	Tom Sampson
	VER0004
*/
USE Requests;

DECLARE @OrderID INTEGER, @SectionID INTEGER
-- Test values, production will be SP paramters
SET @OrderID = 55722
SET @SectionID = 205515

SELECT DISTINCT
	 Orders.OrderID                     "BH55BORDER"
	,QuoteSectionItems.SectionID        "BH55BSECID"
	,'N'                                "BHEDSP" -- EDI Successfully Processed
	,'BC_' + Customers.CustomerNumber   "BH55BBT"
	,CAST(LTRIM(RTRIM(CAST((DATEPART(year, Orders.OrderDate) -1900) AS CHAR))) + LTRIM(RTRIM(CAST((DATEPART(dy, Orders.OrderDate)) AS CHAR))) AS INTEGER) 
                                        "BHTRDJ"
	,LEFT(LTRIM(RTRIM(Orders.CustomerPO)),25) 
                                        "BHVR02"
	,RepCompanies.RepNumber             "BHSLSM"
	,CAST(ROUND(ISNULL(NULLIF(QuoteSectionCommissions.Commission,0)  / NULLIF(SubT.Amt - QuoteSections.Discount,0),0),5) AS DECIMAL(4,2)) 
                                        "BHSLCM"
	,CASE
		WHEN Users.SecurityLevel BETWEEN 1 AND 2 THEN 1
		WHEN Users.SecurityLevel = 16 THEN 2
		ELSE 3
	 END                                "BH55BOCODE"
	,Orders.Name                        "BH55BJOB"
	,CASE WHEN LTRIM(RTRIM(Orders.JobType)) IS NOT NULL
		THEN LTRIM(RTRIM(Orders.JobType))
		ELSE ''
	 END                                "BH55BJTYPE"
	,Orders.ShippingMethodID            "BH55BSMETH"
	,Orders.Forward                     "BH55BFWD"
	,SubT.Lbs                           "BHWTLB"
	,CASE WHEN
		LTRIM(RTRIM(Orders.Address)) IS NULL THEN ''
		ELSE LTRIM(RTRIM(Orders.Address))
	 END                                "BHADD1"
	,CASE WHEN
		LTRIM(RTRIM(Orders.City)) IS NULL THEN ''
		ELSE LTRIM(RTRIM(Orders.City))
	 END                                "BHCTY1"
	,CASE WHEN
		LTRIM(RTRIM(Orders.State)) IS NULL THEN ''
		ELSE LTRIM(RTRIM(Orders.State))
	 END                                "BHADDS"
	,CASE WHEN
		LTRIM(RTRIM(Orders.Zipcode)) IS NULL THEN ''
		ELSE LTRIM(RTRIM(Orders.Zipcode))
	 END                                "BHADDZ"
	,''                                 "BHKCOO"
	,''                                 "BHDOCO"
	,''                                 "BHDCTO"
	,''                                 "BHLIND"
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

ORDER BY

	 Orders.OrderID
	,QuoteSectionItems.SectionID;