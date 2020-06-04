/*概要
注文金額の月次対比

使用データ：
MySQL公式サンプルデータ sakilaDB
*/

select 
 customer_id
 ,sum(amount*(payment_date between '2005-07-01' and '2005-07-31')) as sep_sales
 ,sum(amount*(payment_date between '2005-08-01' and '2005-08-31')) as aug_sales
from
 payment
group by
 customer_id