/*概要
購入金額に対する偏差値を求める

使用データ：
MySQL公式サンプルデータ sakilaDB
*/

select
a.id
,o.amount as '金額'
,TRUNCATE(average,0) as '平均金額'
,TRUNCATE(stddev,0) as '標準偏差'
,TRUNCATE((((o.amount - o.average) * 10) / o.stddev) + 50,0) as '偏差値'
from(
    select
    user_id
    ,amount
    ,(select avg(amount) from orders) as average
    ,(select STDDEV(amount) from orders) as stddev
from
orders)
as o

inner join
admin_users a
on
a.id = o.user_id

order by
o.amount desc
limit
10