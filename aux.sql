DEFINE ResellerSales AS
SELECT SUM(DimReseller_AnnualSales) AS TotalSales,
  ARB(DimReseller_ResellerName) AS RepNames,
  DimReseller_OrderMonth AS OrderMonth
GROUP BY OrderMonth;

RETURN MonthlySales AS
SELECT AVG(TotalSales) AS AvgSalesPerRep
FROM ResellerSales
GROUP BY TotalSales, GROUPING SETS(RepNames), GROUPING SETS(OrderMonth)