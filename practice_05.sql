/*概要
該当の2カ月間内で、カスタマーの支払い合計２０ドル以上の降順

使用データ：
MySQL公式サンプルデータ sakilaDB
*/

SELECT
 payment.customer_id
 ,customer.first_name
 ,SUM(payment.amount)
FROM (
 SELECT
 *
 FROM
 payment
 WHERE
 payment_date between '2005/05/01' and '2005/05/31'
 ) payment
LEFT OUTER JOIN
 customer
ON
 customer.customer_id = payment.customer_id
GROUP BY
 payment.customer_id
HAVING
 SUM(payment.amount) > 20
ORDER BY
 SUM(payment.amount) desc
LIMIT
 1000