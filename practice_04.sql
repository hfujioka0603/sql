/*概要
国を日本でフィルタリングして、
８月の件数上限を３０件以上とし、
９月降順にして、TOP１０に絞る。

使用データ：
MySQL公式サンプルデータ sakilaDB
*/

select 
 p.customer_id
 ,sum(p.amount*(payment_date between '2005-07-01' and '2005-07-31')) as sep_sales
 ,sum(p.amount*(payment_date between '2005-08-01' and '2005-08-31')) as aug_sales
 ,c.country
from
 payment as p
left outer join
 customer_list as c
 on p.customer_id = c.ID
group by
 p.customer_id
having
 c.country = "Japan"
 and sep_sales > 30
order by 
 aug_sales desc
limit 10