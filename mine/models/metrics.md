1. **Product** who is interested in satisfying the customers and listing high quality, popular products,
**Metric:** Count sold
**Definition:** count(order_id) grouped by things like product_id 
this will tell us which product_id is ordered most, can look at this over time to look at product popularity over time.
**Visualization**
Monthly Count Sold by Product  bar chart where the x-axis is `orders.purchased_timestamp` , the y-axis is `count(product_id)` , 
for readability we will join to the products table to find the name or category name 

2. **Marketing**
**Metric** Customer Lifetime Value 
**Definition** Sum( price) grouped by customer
**Visualization** take the average of this metric over time grouped monthly on a line chart
 
3. **Finance** 
**Metric** revenue by seller 
**Definition** sum(price) over time and grouped by the seller_id 
**Visualization** bar chart with top 10 sellers 

4. **Logistics**
**Metric** mean frieght value
**Definition** avg(frieght) 
**Visualization** big number period over period change in average freight value

5. And lastly, the **CEO** who is interested in knowing about the overall health of the company and where she should be focusing her time and effort.
**Metric** paid vs sponsored orders
**Definition** sum( credit card or ach payments)/ sum ( voucher payments ) --> i'm assuming here that vouchers are gifted
**Visualization** line chart showing our metric over time, we want to see if the vouchers are helping the company grow.
