use sales ;
SELECT * FROM salesdb;
-- TOTAL REVENUE
select sum(revenue) as total_revenue from salesdb;
-- CATEGORY-WISE REVENUE
select category , sum(revenue) as category_revenue from salesdb group by category;
-- MONTHLY REVENUE TREND
select 
	year(order_date) as year,
    month(order_date) as month,
    sum(revenue) as monthly_revenue from salesdb
    group by year(order_date) ,month(order_date) order by year , month;
-- TOP CATEGRY BY REVENUE        
select category from salesdb group by category having sum(revenue) = ( 
						select max(total_rev) from( select sum(revenue) as total_rev from salesdb
                        group by category) t ) ;
