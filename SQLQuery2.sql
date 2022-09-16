--OPENING THE TABLE AND VIEWING RECORDS
SELECT *
FROM StockXSneaker..CleanedSneaker


--Questions:
--What shoes are most popular within this dataset?
--Which shoes have the best/worst profit margins?
--What Factors affect profit margin?
--Is it possible to predict the sale price of a shoe at a given time? (i.e. when should i sell?)

--What Shoes are most popular?
SELECT [Sneaker Name] ,COUNT([Sneaker Name]) as NumberSold
FROM StockXSneaker..CleanedSneaker
GROUP BY [Sneaker Name]
ORDER BY 2 DESC

--Which shoes have the best/worst profit margins?

--Best Profit Margin
SELECT  [Sneaker Name], AVG([Sale Price] - [Retail Price]) AS AverageProfit
FROM StockXSneaker..CleanedSneaker
GROUP BY [Sneaker Name]
ORDER BY 2 DESC
	OFFSET 0 ROWS 
	FETCH FIRST 5 ROWS ONLY;


--Worst Profit Margin
SELECT  [Sneaker Name], AVG([Sale Price] - [Retail Price]) AS AverageProfit
FROM StockXSneaker..CleanedSneaker
GROUP BY [Sneaker Name]
ORDER BY 2
	OFFSET 0 ROWS 
	FETCH FIRST 5 ROWS ONLY;

--What Factors affect profit margin?
--Sorting average profits by State
SELECT [Buyer Region] as State ,AVG([Sale Price] - [Retail Price]) AS AverageProfit
FROM StockXSneaker..CleanedSneaker
GROUP BY [Buyer Region]
ORDER BY 2 DESC

--Brand affect on profit margin
SELECT Brand, AVG([Sale Price]-[Retail Price]) as AverageProfit
FROM StockXSneaker..CleanedSneaker
GROUP BY Brand

--Is there a certain time that profit margins were higher?
SELECT FORMAT([Order Date], 'MMMM, yyyy') as MonthYear, AVG([Sale Price]-[Retail Price]) as AverageProfit
FROM StockXSneaker..CleanedSneaker
GROUP BY FORMAT([Order Date], 'MMMM, yyyy')
ORDER BY 2 DESC








