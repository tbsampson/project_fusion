USE [RequestsStaging]
GO
/****** Object:  StoredProcedure [dbo].[_JDEorderHeader]    Script Date: 08/13/2019 12:27:11 ******/
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
	EXEC _JDEorderHeader 60341
	
	Imports to F55BAL01
	
*/
ALTER PROCEDURE [dbo].[_JDEorderHeader]
	@OrderID		int
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    SELECT
		O.OrderID AS							[BH55BORDER],
		O.SectionID AS							[BH55BSECID],
		'N' AS									[BHEDSP],
		QS.SectionName AS						[BH55BSDEC],
		O.QuoteID AS							[55BQUOTE], -- Added 8/13/2019 by Tom for updated header
		'BC_' + C.CustomerNumber AS				[BH55BBT],
		dbo.JDEJulian(O.OrderDate) AS			[BHTRDJ],
		LEFT(LTRIM(RTRIM(O.CustomerPO)),25) AS	[BHVR01],
		CAST(R.RepNumber AS int) AS				[BHSLSM],
		CAST(CAST(ROUND(ISNULL(QSC.Commission / NULLIF(SubTotals.Amt - QS.Discount,0),0),5) AS DECIMAL(4,2)) * 100000 AS INTEGER) AS
												[BHSLCM],
		CASE U.SecurityLevel
			WHEN 1 THEN 1
			WHEN 2 THEN 1
			WHEN 16 THEN 2
			ELSE 3
		END AS									[BH55BOCODE],
		O.ProjectName AS						[BH55BJOB],
		ISNULL(LEFT(LTRIM(RTRIM(O.JobType)),10), '') AS
												[BH55BJTYPE],
		O.ShippingMethodID AS					[BH55BSMETH],
		O.Forward AS							[BH55BFWD],
		CAST(SubTotals.Lbs * 10000 AS int) AS	[BHWTLB],
		CASE
			WHEN O.City IS NOT NULL AND
				 LEN(LTRIM(RTRIM(O.State))) = 2 AND
				 LEN(LTRIM(RTRIM(O.Zipcode))) >= 5 AND
				 LEFT(LTRIM(RTRIM(O.Zipcode)),1) <= '9'
			THEN LEFT(UPPER(LTRIM(RTRIM(O.City)) + ',' + LTRIM(RTRIM(O.[State])) + ' ' + LTRIM(RTRIM(O.Zipcode))),23)
			ELSE ''
		END AS									[BHADD1],
		ISNULL(LEFT(UPPER(LTRIM(RTRIM(O.City))), 30),'') AS
												[BHCTY1],	
		CASE 
			WHEN LEN(LTRIM(RTRIM(O.State))) = 2 THEN UPPER(LTRIM(RTRIM(O.State)))
			ELSE ''
		END AS									[BHADDS],
		CASE
			WHEN LEFT(LTRIM(RTRIM(O.Zipcode)),1) <= '9' THEN LTRIM(RTRIM(O.Zipcode))
			ELSE ''
		END AS									[BHADDZ],
		O.CustomerEmail AS						[BHSDATTN],
							[BH55BMOF],
		'' AS									[BHKCOO],
		CAST(NULL AS smallmoney) AS				[BHDOCO],
		'' AS									[BHDCTO],
		'' AS									[BHUSER],
		'' AS									[BHPID],
		CAST(NULL AS int) AS					[BHUPMJ],
		CAST(NULL AS smallmoney) AS				[BHUPMT],
		'' AS									[BHJOBN]
	FROM
		dbo.Orders O

	INNER JOIN
		dbo.QuoteSections QS ON O.SectionID = QS.SectionID

	INNER JOIN
	(	
		SELECT
			OrderID,
			SUM( Quantity * CAST(Price AS decimal(13,5)) ) AS Amt,
			SUM( Quantity * CAST([Weight] AS decimal(13,5)) ) AS Lbs
		FROM	
			dbo.OrderDetails
		GROUP BY
			OrderID
	) SubTotals ON O.OrderID = SubTotals.OrderID

	LEFT OUTER JOIN
		dbo.Customers C	ON O.CustomerID = C.CustomerID

	LEFT OUTER JOIN
		dbo.RepCompanies R ON O.RepID = R.RepID

	LEFT OUTER JOIN
		dbo.QuoteSectionCommissions QSC ON O.SectionID = QSC.SectionID AND O.RepID = QSC.RepID

	LEFT OUTER JOIN 
		dbo.Users U	ON O.UserID = U.UserID

	WHERE
		O.OrderID = @OrderID;
END
