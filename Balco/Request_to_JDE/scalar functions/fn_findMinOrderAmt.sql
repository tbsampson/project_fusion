USE [RequestsStaging]
GO
/****** Object:  UserDefinedFunction [dbo].[fn_findMinOrderAmt]    Script Date: 08/13/2019 13:23:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* function to return discount given line price and category code
	VER0001
	Tom Sampson
	8/13/2019

	example useage


EXEC fn_findMinOrderAmt 13, 26713.50


*/
-- USE Requests;

ALTER FUNCTION [dbo].[fn_findMinOrderAmt] (@OrderID INTEGER)

RETURNS INTEGER

AS

BEGIN

DECLARE @Result AS INTEGER

SET @Result =
	(
			SELECT 
				CAST((QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)) + ISNULL(ISNULL((Comm.CommissionAmount / (AvgPrice.Total - QuoteSections.Discount)),0) * QuoteSectionItems.UnitPrice * (1 - ISNULL(Disc.Discount,0)),0)) * 10000 AS BIGINT)
													                     
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
			AND Systems.SystemNumber = 'MINIMUM ORDER'  
	)

RETURN @Result

END

	