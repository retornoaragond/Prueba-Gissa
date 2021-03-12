-- ///////////////////////////// Primer Query ////////////////////////////////
select 
	invoices.InvoiceID, 
	invoices.CustomerID, 
	customer.CustomerName, 
	delivery.DeliveryMethodName DeliveryMethod,
	ISNULL(customer.CreditLimit,-1) CreditLimit,
	people.FullName SalesPerson
from [WideWorldImporters].[Sales].[Invoices] invoices
	left outer join [WideWorldImporters].[Sales].[Customers] customer 
on invoices.CustomerID = customer.CustomerID
	left outer join [WideWorldImporters].[Application].[DeliveryMethods] delivery
on invoices.DeliveryMethodID = delivery.DeliveryMethodID
	left outer join [WideWorldImporters].[Application].[People] people
on people.PersonID = invoices.SalespersonPersonID
where year(invoiceDate) >= 2013 and year(invoiceDate) <= 2015;


-- ///////////////////////////// Segundo Query ////////////////////////////////
select 
	invoices.CustomerID, 
	customer.CustomerName, 
	invoices.[Count], 
	ROW_NUMBER() OVER(ORDER BY invoices.[count] Desc) [Order] 
from (
	select 
		invoice.CustomerID [CustomerID], 
		count(1) [Count]
	from [WideWorldImporters].[Sales].[Invoices] invoice 
	group by invoice.CustomerID
) invoices
left outer join [WideWorldImporters].[Sales].[Customers]  customer
on invoices.customerID = customer.CustomerID;
